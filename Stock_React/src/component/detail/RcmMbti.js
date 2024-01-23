import { redirect, useNavigate, useParams } from "react-router-dom";
import { KI_ID, RequsetHeader } from "../../config/apikey";
import { API_BASE_URL } from "../../config/host-config";
import React, { useContext, useEffect, useState } from "react";
import AuthContext from "../util/AuthContext";
import { width } from "@mui/system";

const RcmMbti = ({ value }) => {
  // const { value } = useParams();
  // 유저 mbti 저장
  const [isMbti, setIsMbti] = useState("");
  // 종목이름,코드 저장
  const [mbtiPro, setMbitPro] = useState([]);
  const [randomItems, setRandomItems] = useState([]);
  const redirect = useNavigate();

  let values = [];
  const { email, mbti } = useContext(AuthContext);

  function getMbti(mbti) {
    switch (mbti) {
      case "ISTJ":
      case "ISFJ":
      case "ESTJ":
      case "ESFJ":
        return 2;
      case "ISFP":
      case "ESFP":
      case "ISTP":
      case "ESTP":
        return 3;
      case "INFJ":
      case "ENFJ":
      case "INFP":
      case "ENFP":
        return 4;
      case "INTJ":
      case "ENTJ":
      case "INTP":
      case "ENTP":
        return 5;
      case "선택안함":
        return 0;
      default:
        return 0;
    }
  }

  const seq = getMbti(isMbti.mbti);

  const getUserMbti = async () => {
    const mbtiRes = await fetch(
      API_BASE_URL +
        "/api/user/myInfo/" +
        localStorage.getItem("LOGIN_USEREMAIL")
    );
    const mbtiData = await mbtiRes.json();
    setIsMbti({
      mbti: mbtiData.mbti,
    });
  };
  const rcmMbtiApi = async (seq) => {
    const userId = KI_ID;
    // const res = await fetch(
    //   "/quotations/psearch-result?user_id=" + userId + "&seq=" + seq,
    //   {
    //     headers: {
    //       ...RequsetHeader,
    //       tr_id: "HHKST03900400",
    //       custtype: "P",
    //     },
    //   }
    // );
    const res = await fetch(
      "https://kq53e0bc8b.execute-api.ap-northeast-2.amazonaws.com/b2w-api1/rcmmbti/" +
        seq,
      {
        headers: {
          authorization: localStorage.getItem("ACCESS_TOKEN"),
        },
      }
    );

    if (res.status === 200) {
      const data = await res.json();
      data.output2.forEach((x) => {
        const { code, name } = x;
        values.push({ code, name });
      });
      setMbitPro(values);
    }
  };

  useEffect(() => {
    getUserMbti();
  }, [value]);

  useEffect(() => {
    if (isMbti && isMbti.mbti) {
      rcmMbtiApi(getMbti(isMbti.mbti));
    }
  }, [isMbti]);

  useEffect(() => {
    if (mbtiPro.length > 0) {
      // 필터링
      const filteredItems = mbtiPro.filter(
        (item) =>
          !item.name.includes("KODEX") && //삼성자산운용의 ETF
          !item.name.includes("선물") &&
          !item.name.includes("스팩") &&
          !item.name.includes("인버스") &&
          !item.name.includes("TIGER") && //미래에셋자산운용의 ETF
          !item.name.includes("HANARO") &&
          !item.name.includes("KOSEF") &&
          !item.name.includes("SOL") &&
          !item.name.includes("KBSTAR") && //국민
          !item.name.includes("KTOP") &&
          !item.name.includes("TIMEFOLIO") &&
          !item.name.includes("ARIRANG") &&
          !item.name.includes("200") &&
          !item.name.includes("Fn") &&
          !item.name.includes("ACE") &&
          !item.name.includes("KRX") &&
          !item.name.includes("BNK") &&
          !item.name.includes("WOORI") && //우리
          !item.name.includes("KOREA") &&
          !item.name.includes("TREX") &&
          !item.name.includes("KOSEF") &&
          !item.name.includes("옥수수") &&
          !item.name.includes("레버리지") &&
          !item.name.includes("QV") &&
          !item.name.includes("2x") &&
          !item.name.includes("스팩")
      );
      const newRandomItems = getRandomItems(filteredItems, 4);
      setRandomItems(newRandomItems);
    }
  }, [mbtiPro]);

  const getRandomItems = (arr, count) => {
    const shuffled = arr.sort(() => 0.5 - Math.random());
    return shuffled.slice(0, count);
  };

  const goDetailHandler = (item) => {
    redirect(`/detail/${item.name}(${item.code})`);
  };

  const mypageHandler = (e) => {
    redirect("/mypage");
  };

  if (seq === 0) {
    return (
      <div style={{ width: 400 }}>
        추천 종목을 보고 싶으시면 MBTI를 추가해주세요!
        <button
          onClick={mypageHandler}
          style={{ width: 200, height: 40, marginLeft: 80 }}
        >
          수정하러 내정보 가기
        </button>
      </div>
    );
  }

  return (
    <>
      {randomItems.length > 0 &&
        randomItems.map((item, index) => (
          <p key={index} id="mbtiBtnBox">
            <button onClick={() => goDetailHandler(item)}>
              {item.name}({item.code})
            </button>
          </p>
        ))}
    </>
  );
};

export default RcmMbti;
