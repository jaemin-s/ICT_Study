import React, { useEffect, useState } from "react";
import { NavLink, useNavigate } from "react-router-dom";
import { API_BASE_URL } from "../../config/host-config";
import Swal from "sweetalert2";
const RegistFrame = ({ boardType }) => {
  const [userInfo, setUserInfo] = useState({
    nick: "",
    email: "",
  });
  const [inputTitle, setInputTitle] = useState("");
  const [inputContent, setInputContent] = useState("");
  const navigate = useNavigate();

  const REQUEST_URL = API_BASE_URL + "/api/";
  async function getInfo() {
    const res = await fetch(
      REQUEST_URL + "user/myInfo/" + localStorage.getItem("LOGIN_USEREMAIL")
    );
    const myInfo = await res.json();
    setUserInfo({
      nick: myInfo.nick,
      email: myInfo.email,
    });
  }

  useEffect(() => {
    getInfo();
  }, []);

  function titleHandler(e) {
    setInputTitle(e.target.value);
  }
  function contentHandler(e) {
    setInputContent(e.target.value);
  }

  async function submitHandler() {
    if (inputTitle.replace(/\s/g, "") === "") {
      alert("제목은 필수 사항입니다.");
      return;
    } else if (inputContent.replace(/\s/g, "") === "") {
      alert("내용은 필수 사항입니다.");
      return;
    }

    const res = await fetch(REQUEST_URL + "board", {
      method: "POST",
      headers: { "content-type": "application/json" },
      body: JSON.stringify({
        title: inputTitle,
        content: inputContent,
        writer: userInfo.nick,
        email: userInfo.email,
        type: boardType,
      }),
    });

    const responseJson = await res.text();
    navigate("/" + boardType);

    Swal.fire({
      position: "middle",
      icon: "success",
      title: "글이 등록되었습니다!",
      showConfirmButton: false,
      timer: 1500,
    });
  }

  return (
    <div>
      <table className="table" id="inquiryBoard">
        <tbody>
          <tr>
            <td className="writer">작성자</td>
            <td>
              <input
                className="form-control input-sm"
                value={userInfo.nick}
                readOnly
              />
            </td>
          </tr>
          <tr>
            <td className="title">제목</td>
            <td>
              <input
                className="form-control input-sm"
                name="title"
                id="title"
                onChange={(e) => titleHandler(e)}
              />
            </td>
          </tr>
          <tr>
            <td className="content">내용</td>
            <td>
              <textarea
                className="form-control"
                rows="16"
                name="content"
                id="content"
                type="text"
                onChange={(e) => contentHandler(e)}
                style={{ resize: "none" }}
              ></textarea>
            </td>
          </tr>
        </tbody>
      </table>
      <div>
        <button
          type="submit"
          className="button-58"
          id="regist-btn"
          style={{ float: "right" }}
          onClick={submitHandler}
        >
          등록
        </button>
        <NavLink to={-1}>
          <button className="button-58-1" style={{ float: "right" }}>
            취소
          </button>
        </NavLink>
      </div>
    </div>
  );
};

export default RegistFrame;
