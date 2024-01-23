import React, { useEffect, useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faMedal } from "@fortawesome/free-solid-svg-icons";
import { API_BASE_URL } from "../../../config/host-config";
const MyPageViewInfo = () => {
  const [userInfo, setUserInfo] = useState({
    email: "",
    name: "",
    nick: "",
    age: "",
    career: "",
    gender: "",
    mbti: "",
    myStocks: [],
    money: 0,
    return: "",
    role: "",
  });
  const [rank, setRank] = useState("0");

  function getAge(age) {
    switch (age) {
      case "1":
        return "입문";
      case "2":
        return "1~3년";
      case "3":
        return "4~10년";
      case "4":
        return "10년 이상";
      default:
        return age;
    }
  }

  async function getInfo() {
    const res = await fetch(
      API_BASE_URL +
        "/api/user/myInfo/" +
        localStorage.getItem("LOGIN_USEREMAIL")
    );
    const myInfo = await res.json();
    setUserInfo({
      email: myInfo.email,
      name: myInfo.name,
      nick: myInfo.nick,
      age: myInfo.age,
      career: myInfo.career,
      gender: myInfo.gender,
      money: myInfo.money,
      myStocks: myInfo.myStocks,
      mbti: myInfo.mbti,
      role: myInfo.role,
    });
  }
  useEffect(() => {
    getInfo();
    getMyRank();
  }, [userInfo]);

  function getGender(gender) {
    switch (gender) {
      case "man":
        return "남성";
      case "woman":
        return "여성";
      // 카카오 로그인 시
      case "male":
        return "남성";
      case "female":
        return "여성";
    }
  }

  const getMyRank = async () => {
    const res = await fetch(
      API_BASE_URL +
        "/api/trade/rank/" +
        localStorage.getItem("LOGIN_USEREMAIL")
    );
    if (res.status === 200) {
      const result = await res.json();
      if (result === null) {
        setRank(0);
      } else {
        setRank(result.rank);
      }
    }
  };

  function getRole(role) {
    switch (role) {
      case "BRONZE":
        return "#804A00";
      case "SILVER":
        return "#C0C0C0";
      case "GOLD":
        return "#F9BC28";
      default:
        return "";
    }
  }
  return (
    <>
      {/* <!-- Page Heading --> */}
      <div className="basic-info">
        <br />
        <br />
        <br />
        <br />
        {rank === 0 ? (
          <div>
            <div id="1" style={{ marginBottom: "10px" }}>
              나의 주식실력을 알고 싶다면 모의투자를 경험해보세요!
            </div>
          </div>
        ) : (
          <div id="1">
            '{userInfo.nick}' 님의 현재 등수 : {rank} 등
          </div>
        )}
      </div>
      <br />
      <br />
      {/* 회원정보 */}
      <div className="userInfo">
        <div className="info">
          <h5 className="name">
            이름
            <span className="border" style={{ textAlign: "center" }}>
              |
            </span>{" "}
            {userInfo.name}
          </h5>
          <h5 className="nick">
            닉네임<span className="border">|</span> {userInfo.nick}
          </h5>
          <h5 className="email">
            이메일<span className="border">|</span> {userInfo.email}
          </h5>
          <h5 className="gender">
            성별<span className="border">|</span> {getGender(userInfo.gender)}
          </h5>
          <h5 className="age">
            나이<span className="border">|</span> {userInfo.age}세
          </h5>
          <h5 className="career">
            경력<span className="border">|</span> {getAge(userInfo.career)}
          </h5>
          <h5 className="mbti">
            MBTI<span className="border">|</span> {userInfo.mbti}
          </h5>
          <h5 className="role">
            등급<span className="border">|</span> {userInfo.role}
          </h5>
        </div>
        <FontAwesomeIcon
          icon={faMedal}
          style={{
            color: getRole(userInfo.role),
            fontSize: "260px",
            marginTop: "50px",
          }}
        />
      </div>
    </>
  );
};

export default MyPageViewInfo;
