import React, { useEffect, useState } from "react";
import "./InquiryBoard.scss";
import Paging from "./Paging";
import BoardSideBar from "./BoardSideBar";
import { NavLink, useLocation, useNavigate } from "react-router-dom";
import BoardContent from "./BoardContent";
import { API_BASE_URL } from "../../config/host-config";
const InquiryBoard = ({ props }) => {
  const location = useLocation();
  const { state } = location;
  const [page, setPage] = useState(!!state ? state.savedPage : 1);
  const [boardData, setboardData] = useState();
  const navigate = useNavigate();

  async function getBoardList() {
    const res = await fetch(
      API_BASE_URL + "/api/board/inquiry" + "?size=" + 8 + "&page=" + (page - 1)
    );
    const data = await res.json();
    setboardData({
      content: data.content,
      totalElements: data.totalElements,
      totlaPages: data.totalPages,
      pageIndex: data.pageable.pageNumber,
      offset: data.pageable.offset,
    });
  }
  useEffect(() => {
    getBoardList();
  }, [page]);

  function titleClickHandler(id) {
    navigate("/regist", {
      state: { boardType: "inquiry", id: id, type: "read", savedPage: page },
    });
  }
  return (
    <>
      <div id="page-top" style={{ width: "80%", maxWidth: "1920px" }}>
        <div id="wrapper">
          <BoardSideBar />
          <div className="container-fluid">
            <div style={{ display: "flex", justifyContent: "center" }}>
              <nav className="navbar navbar-expand-lg navbar-light bg-light">
                <div
                  className="collapse navbar-collapse"
                  id="navbarSupportedContent"
                >
                  <ul className="navbar-nav mr-auto">
                    <li className="nav-item">
                      <a
                        className="nav-link"
                        id="my-info"
                        href="#"
                        style={{ fontWeight: 700, fontSize: 25 }}
                      >
                        문의 게시판
                      </a>
                    </li>
                  </ul>
                  <br />
                  <br />
                </div>
              </nav>
            </div>
            <BoardContent
              boardData={boardData}
              titleClickHandler={titleClickHandler}
            />
            {boardData && (
              <Paging
                page={page}
                count={boardData.totalElements}
                setPage={setPage}
              />
            )}
            <br />
            <NavLink
              to="/regist"
              state={{ boardType: "inquiry", type: "write", savedPage: page }}
            >
              {localStorage.getItem("isLoggedIn") === "1" && (
                <button className="button-58" style={{ float: "right" }}>
                  글쓰기
                </button>
              )}
            </NavLink>
          </div>
        </div>
      </div>
    </>
  );
};

export default InquiryBoard;
