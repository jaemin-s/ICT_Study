import React, { useEffect, useRef, useState } from 'react'
import '../bootstrap/css/sb-admin-2.min.css';
import './Header.scss';
import { Button, ModalBody, ModalFooter, ModalHeader, Modal } from 'reactstrap';
import { Link } from 'react-router-dom';
import { useNavigate } from 'react-router-dom';
import { KI_APP_KEY,KI_SECRET_KEY, DATA_GO_KR_KEY } from '../../config/apikey';
const Header = () => {

  const redirection = useNavigate();
  
  const [data, setData] = useState(null); // 결과를 저장할 상태
    let corps;
  const getCode = async (e) => {
      try {
          corps = e.target.dataset.stockId;
          console.log(corps);
          const res = await fetch('https://apis.data.go.kr/1160100/service/GetCorpBasicInfoService_V2/getCorpOutline_V2?pageNo=1&resultType=json&serviceKey='+ DATA_GO_KR_KEY +'&numOfRows=20&corpNm='+ corps+'');

          if (res.status === 200) {
              const data = await res.json();
              setData(data.response.body.items.item);  // 결과를 상태에 저장
              console.log(data);
          }
      } catch (error) {
      console.error(error);
      }
  };



  const findStockCode = (stockName) => {
    const stock = data.find((item) => item.corpNm === stockName); //이름
    if(stock) {
        return stock.fssCorpUnqNo;    //코드
    } else {
        return null;
    }
  };

  const stockName = corps;
  // const stockCode = findStockCode(stockName);
  // console.log(stockCode);


  const [keyItem, SetKeyItem] = useState([]);

  const [infoIsModal, setInfoIsModal] = useState(false);

  // const redirection = useNavigate();
  const inputRef = useRef();
  
  const searchHandler = (e) => {
    console.log("핸들러 발동");
    e.preventDefault();
    if(inputRef.current.value.trim() === '') {
      alert('검색어를 입력하세요!!');
      return;
    }
    // redirection(`/Detail/${inputRef.current.value}`);
    console.log("입력값: "  + inputRef.current.value);
    infoModal();
  };


  const nameData = async () => {
    console.log("fetch문 안으로 등장");
    const res = await fetch('/getStockPriceInfo?serviceKey=1KP%2F74OKGakEjZuUJc6YTkn5UTLRHtfug6BKkunpBqx3owk%2BrrquqsAG7hl7NqMbb5qqQYWVrkVKn7fnYfvXtQ%3D%3D&numOfRows=30&pageNo=1&resultType=json&likeItmsNm=' + inputRef.current.value)
    console.log("res", res); 
    const nameData = await res.json();
    const infoNameData = [];

    nameData.response.body.items.item.forEach(nameList => {
      const {
        itmsNm : itmsNm,
        srtnCd : srtnCd
      } = nameList;
      const isDuplicate = infoNameData.some(item => item.itmsNm === itmsNm && item.srtnCd === srtnCd); // 중복 체크
    
      // 중복된 값이 없을 경우에만 추가
      if (!isDuplicate) {
        console.log("중복검사중이야");
        infoNameData.push({
          itmsNm,
          srtnCd   
      });
      SetKeyItem(infoNameData);
  }});
  if (infoNameData.length === 0) {
    alert("검색 결과가 없습니다.");
    
  } else {
    infoModal();
  }
  }  
     
  useEffect(() => {
    console.log("useEffect");
  }, [keyItem]);


  const infoModal = () => {
    console.log("모달이야");
    setInfoIsModal(!infoIsModal);
  };

  const allInfoModal = (
    <>
      <Modal isOpen={infoIsModal} style={{maxWidth: 2000, width: 800, marginTop: 200}}>
        <ModalBody style={{height: 300}}>
          {keyItem.length === 0 ? (  
            <div id='spinner-image'>       
            <img src={require('./guideline/image/spiner.gif')} alt="Loading..."></img>
            </div>
          ) : (
            <div id='info-modal'>
              {keyItem.map((item, index) => (
                <p key={index} id='info-modal-tag'>
                  <Link to={`/detail/${item.srtnCd}&${item.itmsNm}`} onClick={() => {
                    redirection(`/detail/${item.srtnCd}&${item.itmsNm}`);
                    infoModal();
                  }}>
                    {item.itmsNm} - {item.srtnCd} &nbsp; &#124; &nbsp;
                  </Link>
                </p>
              ))}
            </div>
          )}
        </ModalBody>
        <ModalFooter>
          <Button onClick={infoModal} id='cancleFooter'>취소</Button>
        </ModalFooter>
      </Modal>
    </>
  );
  
  


  return (
    <>
  <div style={{ display: "flex", justifyContent: "center", lineHeight: "5" }}>
    <nav className="navbar navbar-expand-lg navbar-light bg-light" >
      <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span className="navbar-toggler-icon"></span>
      </button>
      <div className="collapse navbar-collapse" id="navbarSupportedContent">
        <ul className="navbar-nav mr-auto">
          <li className="nav-item active">
            <a className="nav-link" href="/" style={{marginRight: "100px"}}>
            <img src={require('./guideline/image/logo.PNG')} alt="@" className="center-image" style={{width: "70%"}}></img>
              <span className="sr-only">(current)</span></a>
          </li>
          <li className="nav-item">
            <a className="nav-link" href="/guide" style={{marginRight: "100px"}}>Guide</a>
          </li>
          <li className="nav-item" style={{ flex: 1, textAlign: "center",  marginTop: "60px" }}>
            <nav className="navbar navbar-light bg-light" style={{}}>
              <form className="container-fluid" onSubmit={searchHandler}>
                <div className="input-group">
                  <button onClick={nameData}>
                    <span className="input-group-text" id="basic-addon1">
                      <img src={require('../bootstrap/img/search.png')} alt='search' style={{ width: "25px", border: "none" }}></img>
                    </span>
                  </button>
                  <i className="fa-regular fa-magnifying-glass"></i>
                  
                  <input type="text" className="form-control dropdown" placeholder="Search" aria-label="Search" aria-describedby="basic-addon1" 
                     ref={inputRef}/>
                </div>
              </form>
            </nav>
          </li>
          <li className="nav-item">
            <a className="nav-link" href="/login" style={{marginLeft: "100px"}}>Login</a>
          </li>
          <li className="nav-item">
            <a className="nav-link" href="/join" style={{marginLeft: "100px"}}>Join</a>
          </li>
          <li className="nav-item">
            <a className="nav-link" href="/mypage" style={{marginLeft: "100px"}}>MyPage</a>
          </li>
        </ul>
      </div>
    </nav>
  </div>

  {infoIsModal && allInfoModal}
</>
  )
}

export default Header;