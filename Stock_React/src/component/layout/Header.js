import React, { useContext, useEffect, useRef, useState } from "react";
import "../bootstrap/css/sb-admin-2.min.css";
import "./Header.scss";
import { Button, ModalBody, ModalFooter, ModalHeader, Modal } from "reactstrap";
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import { DATA_GO_KR_KEY } from "../../config/apikey";
import AuthContext from "../util/AuthContext";
import { isLogin } from "../util/login-utils";
import Swal from "sweetalert2";

const Header = () => {
  const redirection = useNavigate();
  const [keyItem, SetKeyItem] = useState([]); // api 값 관리
  const [infoIsModal, setInfoIsModal] = useState(false); // 모달 관리
  const inputRef = useRef();
  const [role, setRole] = useState("BRONZE");
  const { isLoggedIn, onLogout, email, name, image, userRole } =
    useContext(AuthContext);

  const logoutHandler = () => {
    onLogout();
    redirection("/login");
  };

  const [data, setData] = useState(null); // 결과를 저장할 상태
  let corps;
  const getCode = async (e) => {
    try {
      corps = e.target.dataset.stockId;
      const res = await fetch(
        "https://apis.data.go.kr/1160100/service/GetCorpBasicInfoService_V2/getCorpOutline_V2?pageNo=1&resultType=json&serviceKey=" +
          DATA_GO_KR_KEY +
          "&numOfRows=20&corpNm=" +
          corps +
          ""
      );

      if (res.status === 200) {
        const data = await res.json();
        setData(data.response.body.items.item); // 결과를 상태에 저장
      }
    } catch (error) {
      console.error(error);
    }
  };
  const findStockCode = (stockName) => {
    const stock = data.find((item) => item.corpNm === stockName); //이름
    if (stock) {
      return stock.fssCorpUnqNo; //코드
    } else {
      return null;
    }
  };

  const stockName = corps;
  // const stockCode = findStockCode(stockName);

  async function fetchNaver(input) {
    const res = await fetch(
      "https://kq53e0bc8b.execute-api.ap-northeast-2.amazonaws.com/b2w-api1/naverstocksearch/" +
        input
    );
    if (res.status === 200) {
      const data = await res.text();
      try {
        const tempArr = data
          .split("items")[1]
          .replaceAll('"', "")
          .split("]]],")[0]
          .split("[[[")[1]
          .split(",");
        const resultArr = [];
        for (let i = 0; i < tempArr.length; i += 5) {
          const item = tempArr[i + 1].replaceAll("[", "").replaceAll("]", "");
          const code = tempArr[i].replaceAll("[", "").replaceAll("]", "");
          const stockType = tempArr[i + 2]
            .replaceAll("[", "")
            .replaceAll("]", "");
          console.log(stockType);
          if (
            item.includes("KODEX") || //삼성자산운용의 ETF
            item.includes("선물") ||
            item.includes("스팩") ||
            item.includes("인버스") ||
            item.includes("TIGER") || //미래에셋자산운용의 ETF
            item.includes("HANARO") ||
            item.includes("KOSEF") ||
            item.includes("SOL") ||
            item.includes("KBSTAR") || //국민
            item.includes("KTOP") ||
            item.includes("TIMEFOLIO") ||
            item.includes("ARIRANG") ||
            item.includes("200") ||
            item.includes("Fn") ||
            item.includes("ACE") ||
            item.includes("KRX") ||
            item.includes("BNK") ||
            item.includes("WOORI") || //우리
            item.includes("KOREA") ||
            item.includes("TREX") ||
            item.includes("KOSEF") ||
            item.includes("옥수수") ||
            item.includes("레버리지") ||
            (stockType !== "코스닥" && stockType !== "코스피")
          ) {
          } else {
            resultArr.push({
              itmsNm: item,
              srtnCd: code,
            });
          }
        }
        if (resultArr.length === 0) {
          throw new Error("");
        }
        SetKeyItem(resultArr);
      } catch (e) {
        notResultConfirm("결과가 없습니다.");
        setInfoIsModal(false);
      }
      // const tempArr = data
      //   .split("items")[1]
      //   .replaceAll('"', "")
      //   .split("]]],")[0]
      //   .split("[[[")[1]
      //   .split(",");
    }
  }

  const searchHandler = (e) => {
    e.preventDefault();

    const inputValue = inputRef.current.value.trim().toUpperCase();
    if (inputRef.current.value.trim() === "") {
      notResultConfirm("검색어를 입력하세요.");
      return;
    } else {
      fetchNaver(inputValue);
    }
    SetKeyItem([]);
    setInfoIsModal(true);
    // nameData(inputValue);
  };

  const notResultConfirm = (text) => {
    Swal.fire({
      position: "middle",
      icon: "info",
      title: text,
      showConfirmButton: false,
      timer: 1500,
    });
  };

  const [loadingFail, setLoadingFail] = useState(false); // 로딩실패시 재렌더링을 위한 상태관리
  const nameData = async (inputValue) => {
    // const res = await fetch(
    //   "/getStockPriceInfo?serviceKey=1KP%2F74OKGakEjZuUJc6YTkn5UTLRHtfug6BKkunpBqx3owk%2BrrquqsAG7hl7NqMbb5qqQYWVrkVKn7fnYfvXtQ%3D%3D&numOfRows=30&pageNo=1&resultType=json&likeItmsNm=" +
    //     inputValue
    // );
    const res = await fetch(
      "https://kq53e0bc8b.execute-api.ap-northeast-2.amazonaws.com/b2w-api1/querysearch/" +
        inputValue +
        ""
    );

    if (res.status === 500) {
      setLoadingFail(!loadingFail);
      return;
    } else {
      const nameData = await res.json();
      const infoNameData = [];

      nameData.response.body.items.item.forEach((nameList) => {
        const { itmsNm: itmsNm, srtnCd: srtnCd } = nameList;
        const isDuplicate = infoNameData.some(
          (item) => item.itmsNm === itmsNm && item.srtnCd === srtnCd
        ); // 중복 체크

        // 중복된 값이 없을 경우에만 추가
        if (!isDuplicate) {
          infoNameData.push({
            itmsNm,
            srtnCd,
          });
          SetKeyItem(infoNameData);
        }
      });
      if (infoNameData.length === 0) {
        setInfoIsModal(false);
      } else {
        // infoModal();
      }
    }
  };

  useEffect(() => {}, [keyItem]);

  useEffect(() => {
    setRole(localStorage.getItem("LOGIN_USERROLE"));
  }, [email]);

  const infoModal = () => {
    document.getElementById("searchText").value = "";
    setInfoIsModal(!infoIsModal);
  };

  const closeModal = () => {
    setInfoIsModal(false);
  };

  const allInfoModal = (
    <>
      <Modal
        isOpen={infoIsModal}
        style={{ maxWidth: 2000, width: 620, marginTop: 200 }}
      >
        <ModalBody style={{ height: 650 }}>
          {keyItem.length === 0 ? (
            <div id="spinner-image">
              <img
                src={require("./guideline/image/spiner.gif")}
                alt="Loading..."
              ></img>
            </div>
          ) : (
            <div id="info-modal">
              {keyItem.map((item, index) => (
                <p key={index} id="info-modal-tag">
                  <Link
                    to={`/detail/${item.itmsNm}(${item.srtnCd})`}
                    onClick={() => {
                      infoModal();
                    }}
                  >
                    &#8226; {item.itmsNm} - {item.srtnCd} &nbsp; &nbsp;
                  </Link>
                </p>
              ))}
            </div>
          )}
        </ModalBody>
        <ModalFooter>
          <Button
            onClick={closeModal}
            id="cancleFooter"
            style={{
              backgroundColor: "skyblue",
              width: 100,
              height: 50,
              border: "none",
            }}
          >
            취소
          </Button>
        </ModalFooter>
      </Modal>
    </>
  );

  const [isToggle, setIsToggle] = useState(false);
  const dropdownRef = useRef(false);
  // 드롭다운 외부클릭시 닫게
  useEffect(() => {
    const handleOutsideClick = (event) => {
      if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
        setIsToggle(false);
      }
    };
    document.addEventListener("mousedown", handleOutsideClick);
    return () => {
      document.removeEventListener("mousedown", handleOutsideClick);
    };
  }, []);
  const toggleHandler = () => {
    setIsToggle((prevIsToggle) => !prevIsToggle);
  };

  const Search = ({ size = 25, color = "#fcf9f9" }) => (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width={size}
      height={size}
      viewBox="0 0 24 24"
      fill="none"
      stroke={color}
      strokeWidth="2.5"
      strokeLinecap="round"
      strokeLinejoin="round"
    >
      <circle cx="11" cy="11" r="8"></circle>
      <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
    </svg>
  );

  return (
    <>
      <nav
        className={`navbar navbar-expand navbar-light ${
          role === "ADMIN" ? "bg-warning" : "bg-white"
        } topbar mb-4 static-top shadow`}
        style={{ width: "100%", justifyContent: "space-between" }}
      >
        {/* LOGO */}
        <a className="nav-link" href="/">
          <img
            src={require("./guideline/image/logo.PNG")}
            alt="@"
            className="center-image"
            style={{ width: "300px", marginLeft: "55px" }}
          ></img>
          <span className="sr-only">(current)</span>
        </a>
        {/* 검색창 */}
        <div
          style={{
            display: "flex",
            justifyContent: "center",
            alignItems: "center",
            marginLeft: "120px",
          }}
        >
          <form className="search-form-container" onSubmit={searchHandler}>
            <div className="input-group input-group-append">
              <input
                id="searchText"
                type="text"
                className="form-control " //border-0 small
                placeholder="이름으로 검색해주세요."
                aria-label="Search"
                aria-describedby="basic-addon1"
                ref={inputRef}
              />
              <button className="btn btn-primary searchBtn">
                <i className="fa-solid fa-magnifying-glass"></i>
                <Search />
              </button>
            </div>
          </form>
        </div>

        {/* 회원 정보 */}
        <ul
          className="navbar-nav"
          style={{ width: "30%", paddingLeft: "120px" }}
        >
          <li
            className={
              isToggle
                ? "nav-item dropdown no-arrow show"
                : "nav-item dropdown no-arrow"
            }
            onClick={toggleHandler}
            ref={dropdownRef}
          >
            <a
              className={
                isToggle
                  ? "nav-link dropdown-toggle slide-up"
                  : "nav-link dropdown-toggle slide-down"
              }
              id="userDropdown"
              role="button"
              data-toggle="dropdown"
              aria-haspopup="true"
              aria-expanded={isToggle ? "true" : "false"}
            >
              <span style={{ fontWeight: 600, fontSize: 20 }}>
                {isLogin() ? email : "WELCOME"}
                &nbsp;
                <span className={isToggle ? "rotate-up" : "rotate-down"}>
                  {isToggle ? "▲" : "▼"}
                </span>
              </span>
            </a>

            {/* <!-- Dropdown - User Information --> */}
            <ul
              className={
                isToggle
                  ? "dropdown-menu dropdown-menu-right shadow animated--grow-in show"
                  : "dropdown-menu dropdown-menu-right shadow animated--grow-in"
              }
              aria-labelledby="userDropdown"
            >
              <li className="dropdown-item">
                <a className="nav-link" href="/notice">
                  공지사항
                </a>
              </li>
              <hr className="border-line" />
              <li className="dropdown-item">
                <a className="nav-link" href="/inquiry">
                  문의 게시판
                </a>
              </li>
              <hr className="border-line" />
              <li className="dropdown-item">
                <a className="nav-link" href="/guide">
                  가이드
                </a>
              </li>
              <hr className="border-line" />
              {isLogin() ? (
                <>
                  {role === "ADMIN" ? (
                    <li className="dropdown-item">
                      <a className="nav-link" href="/adminPage">
                        관리자 페이지
                      </a>
                    </li>
                  ) : (
                    <li className="dropdown-item">
                      <a className="nav-link" href="/mypage">
                        마이 페이지
                      </a>
                    </li>
                  )}
                  <hr className="border-line" />
                  <li className="dropdown-item">
                    <a
                      className="nav-link"
                      data-toggle="modal"
                      data-target="#logoutModal"
                      onClick={logoutHandler}
                    >
                      로그아웃
                    </a>
                  </li>
                </>
              ) : (
                <>
                  <li className="dropdown-item">
                    <a className="nav-link" href="/join">
                      회원가입
                    </a>
                  </li>
                  <hr className="border-line" />
                  <li className="dropdown-item">
                    <a className="nav-link" href="/login">
                      로그인
                    </a>
                  </li>
                </>
              )}
            </ul>
          </li>
        </ul>
      </nav>

      {infoIsModal && allInfoModal}
    </>
  );
};

export default Header;
