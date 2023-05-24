<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-9 write-wrap">
                        <div class="titlebox">
                            <p>상세보기</p>
                        </div>
                        
                        <form action="${pageContext.request.contextPath}/freeboard/modify" method="post">
                            <div>
                                <label>DATE</label>
                                <c:if test="${article.updateDate == null}">
                                	<p>
										<fmt:parseDate value="${article.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both"/>
	                           			<fmt:formatDate value="${parsedDateTime}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
	                           			${parsedDateTime}
									</p>
                                </c:if>
                                <c:if test="${article.updateDate != null}">
                                	<p>
										<fmt:parseDate value="${article.updateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both"/>
	                           			<fmt:formatDate value="${parsedDateTime}" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
	                           			${parsedDateTime}
									</p>
                                </c:if>
                            </div>   
                            <div class="form-group">
                                <label>번호</label>
                                <input class="form-control" name="bno" value="${article.bno}" readonly>
                            </div>
                            <div class="form-group">
                                <label>작성자</label>
                                <input class="form-control" name="writer" value="${article.writer}" readonly>
                            </div>    
                            <div class="form-group">
                                <label>제목</label>
                                <input class="form-control" name="title" value="${article.title}" readonly>
                            </div>

                            <div class="form-group">
                                <label>내용</label>
                                <textarea class="form-control" rows="10" name="content" readonly>${article.content}</textarea>
                            </div>

                            <button type="submit" class="btn btn-primary" onclick="return confirm('변경 페이지로 이동합니다.')">변경</button>
                            <button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/freeboard/freeList?pageNum=${p.pageNum}&cpp=${p.cpp}&keyword=${p.keyword}&condition=${p.condition}'">목록</button>
                    </form>
                </div>
            </div>
        </div>
        </section>
        
        <section style="margin-top: 80px;">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-md-9 write-wrap">
                        <form class="reply-wrap">
                            <div class="reply-image">
                                <img src="${pageContext.request.contextPath}/img/profile.png">
                            </div>
                            <!--form-control은 부트스트랩의 클래스입니다-->
	                    <div class="reply-content">
	                        <textarea class="form-control" rows="3" id="reply"></textarea>
	                        <div class="reply-group">
	                              <div class="reply-input">
	                              <input type="text" class="form-control" id="replyId" placeholder="이름">
	                              <input type="password" class="form-control" id="replyPw" placeholder="비밀번호">
	                              </div>
	                              
	                              <button type="button" class="right btn btn-info" id="replyRegist">등록하기</button>
	                        </div>
	
	                    </div>
                        </form>

                        <!--여기에접근 반복-->
                        <div id="replyList">
                        
	                        <!-- 
	                        <div class='reply-wrap'>
	                            <div class='reply-image'>
	                                <img src='../img/profile.png'>
	                            </div>
	                            <div class='reply-content'>
	                                <div class='reply-group'>
	                                    <strong class='left'>honggildong</strong> 
	                                    <small class='left'>2019/12/10</small>
	                                    <a href='#' class='right'><span class='glyphicon glyphicon-pencil'></span>수정</a>
	                                    <a href='#' class='right'><span class='glyphicon glyphicon-remove'></span>삭제</a>
	                                </div>
	                                <p class='clearfix'>여기는 댓글영역</p>
	                            </div>
	                        </div> 
	                        -->
	                        
                        </div>
                        <button type="button" class="form-control" id="moreList" style="display:block">더보기(페이징)</button>
                    </div>
                </div>
            </div>
        </section>
        
	<!-- 모달 -->
	<div class="modal fade" id="replyModal" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
					<h4 class="modal-title">댓글수정</h4>
				</div>
				<div class="modal-body">
					<!-- 수정폼 id값을 확인하세요-->
					<div class="reply-content">
					<textarea class="form-control" rows="4" id="modalReply" placeholder="내용입력"></textarea>
					<div class="reply-group">
						<div class="reply-input">
						    <input type="hidden" id="modalRno">
							<input type="password" class="form-control" placeholder="비밀번호" id="modalPw">
						</div>
						<button class="right btn btn-info" id="modalModBtn">수정하기</button>
						<button class="right btn btn-info" id="modalDelBtn">삭제하기</button>
					</div>
					</div>
					<!-- 수정폼끝 -->
				</div>
			</div>
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>


<script>

    window.onload = function() {
			
        document.getElementById('replyRegist').onclick = function() {

            const bno = '${article.bno}'; // 게시글 번호
            const reply = document.getElementById('reply').value;
            const replyId = document.getElementById('replyId').value;
            const replyPw = document.getElementById('replyPw').value;
        

            if(reply ===''||replyId===''||replyPw===''){
                alert('이름, 비밀번호, 내용을 입력하세요');
                return;
            }

            const reqObj = {
                method: 'post',
                headers: {
                    'Content-Type':'application/json'
                },
                body: JSON.stringify({
                    'bno' : bno,
                    'reply' : reply,
                    'replyId' : replyId,
                    'replyPw' : replyPw
                })
            }
            
            fetch('${pageContext.request.contextPath}/reply/regist',reqObj)
                .then(res => res.text())
                .then(data => {
                    console.log('통신 성공!: '+ data);
                    document.getElementById('reply').value = '';
                    document.getElementById('replyId').value = '';
                    document.getElementById('replyPw').value = '';
                    //등록 완료 후 댓글 목록 함수를 호출해서 비동기식으로 목록 표현
                    getList(1,true);
                });

        }// 댓글 등록 끝

        //더보기 버튼 동작
        document.getElementById('moreList').onclick = () => {
            getList(++page, false);
        }
        
       	let page = 1; //전역 의미로 사용할 페이지 번호
        let strAdd = ''; //화면에 그려넣을 태그를 문자열의 형태로 추가할 변수
        const $replyList = document.getElementById('replyList');
		getList(1,true);
        
            //댓글 목록을 가져올 함수
            //요청된 페이지의 번호와, 화면을 리셋할 것인지의 여부를
            //bool타입의 reset으로 받겠습니다.
            //(페이지가 그대로 머물면서 댓글이 밑에 계속 쌓이기 때문에,
            //상황에 따라서 페이지를 리셋해서 새롭게 그려낼 것인지, 누적해서
            // 쌓을 것인지의 여부를 판단)
            function getList(pageNum, reset) {
                strAdd ='';
                const bno = '${article.bno}';

                //get방식으로 댓글 목록을 요청(비동기)
                fetch('${pageContext.request.contextPath}/reply/getList/'+bno+'/'+pageNum)
                	.then(res => res.json())
                	.then(data => {

                		console.log(data);
                		let total = data.total;
                		let replyList = data.list;
                        
                		//insert, update, delete 작업 후에는
                		//strAdd 변수를 초기화해야함
                		if(reset) {
                			[...$replyList.children].forEach(c=> c.remove());
                			page = 1;
                		}
                		//응답 데이터의 길이가 0과 같거나 더 작으면 함수를 종료.
                		if(replyList.length <= 0) return;
                		
                		//더 볼 댓글이 없으면 더보기 숨기기
                		if(page*5>=total){
                			document.getElementById('moreList').style.display = 'none';
                		}else{
                			document.getElementById('moreList').style.display = 'block';
                		}
                		
                		for(let i=0; i<replyList.length; i++){
                			strAdd += `
                				<div class='reply-wrap'>
	                            <div class='reply-image'>
	                                <img src='${pageContext.request.contextPath}/img/profile.png'>
	                            </div>
	                            <div class='reply-content'>
	                                <div class='reply-group'>
	                                    <strong class='left'>`+replyList[i].replyId+`</strong> 
	                                    <small class='left'>`+(replyList[i].updateDate!=null?parseTime(replyList[i].updateDate)+'(수정됨)':parseTime(replyList[i].replyDate))+`</small>
	                                    <a href='`+replyList[i].rno+`' class='right replyModify'><span class='glyphicon glyphicon-pencil'></span>수정</a>
	                                    <a href='`+replyList[i].rno+`' class='right replyDelete'><span class='glyphicon glyphicon-remove'></span>삭제</a>
	                                </div>
	                                <p class='clearfix'>`+replyList[i].reply+`</p>
	                            </div>
	                        </div>`;
                		}
                		
                		$replyList.insertAdjacentHTML('beforeend',strAdd);
                		
                	});
            }// end getList();


            //수정, 삭제
            $replyList.addEventListener('click', e =>{
               	e.preventDefault();
                if(!e.target.matches('a')) return;
                
                const rno = e.target.getAttribute('href');
                document.getElementById('modalRno').value = rno;
                const content = e.target.parentNode.nextElementSibling.textContent;
                
                const $modal=document.getElementById('replyModal');

                if(e.target.classList.contains('replyModify')){
                    console.log('수정 클릭됨');
                    document.querySelector('.modal-title').textContent = '댓글 수정';
                    document.getElementById('modalReply').style.display = 'inline';
                    document.getElementById('modalReply').value = content;
                    document.getElementById('modalModBtn').style.display = 'inline';
                    document.getElementById('modalDelBtn').style.display = 'none';

                    $('#replyModal').modal('show');
                }else if(e.target.classList.contains('replyDelete')){
                    console.log('삭제 클릭됨');
                    document.querySelector('.modal-title').textContent = '댓글 삭제';
                    document.getElementById('modalReply').style.display = 'none';
                    document.getElementById('modalModBtn').style.display = 'none';
                    document.getElementById('modalDelBtn').style.display = 'inline';
                    $('#replyModal').modal('show');
                } 
                
            }); 

            document.getElementById('modalModBtn').onclick = () =>{
                const reply = document.getElementById('modalReply').value;
                const rno = document.getElementById('modalRno').value;
                const replyPw = document.getElementById('modalPw').value;

                if(reply ===''||replyPw===''){
                    alert('내용 또는 비밀번호를 입력하세요');
                    return;
                }

                const reqObj = {
                method: 'put',
                headers: {
                    'Content-Type':'application/json'
                },
                body: JSON.stringify({
                    'reply' : reply,
                    'replyPw' : replyPw
                })
            };

            fetch('${pageContext.request.contextPath}/reply/'+rno,reqObj)
            	.then(res => res.text())
            	.then(data => {
            		if(data === 'pwFail') {
                        alert('비밀번호가 틀렸습니다.');
            			document.getElementById('modalPw').value = '';
            			document.getElementById('modalPw').focus();
            		}else{
            			alert('정상 수정 되었습니다.');
            			document.getElementById('modalReply').value = '';
            			document.getElementById('modalPw').value = '';
            			$('#replyModal').modal('hide');
            			getList(1,true);
            		}
            	});

            }

            //삭제 이벤트
            document.getElementById('modalDelBtn').onclick = () => {
                
                // 1. 모달창에 rno값, replyPw값을 얻습니다.
                const rno = document.getElementById('modalRno').value;
                const replyPw = document.getElementById('modalPw').value;

                if(replyPw===''){
                    alert('비밀번호를 입력하세요');
                    return;
                }
                    const reqObj = {
                    method: 'delete',
                    headers: {
                        'Content-Type':'application/json'
                    },
                    body: JSON.stringify({
                        'rno' : rno,
                        'replyPw' : replyPw
                    })
                }
                // 2. fetch 함수를 이용해서 DELETE 방식으로 reply/{rno} 요청
                fetch('${pageContext.request.contextPath}/reply/'+rno,reqObj)
                    .then(res => res.text())
                    .then(data => {
                        if(data === 'pwFail') {
                            alert('비밀번호가 틀렷습니다.');
                            document.getElementById('modalPw').value = '';
                            document.getElementById('modalPw').focus();
                        }else{
                            alert('정상 삭제 되었습니다.');
                            document.getElementById('modalReply').value = '';
                            document.getElementById('modalPw').value = '';
                            $('#replyModal').modal('hide');
                            getList(1,true);
                        }
                    });

                // 3. 서버에서는 요청을 받아서 비밀번호를 확인하고, 비밀번호가 맞으면
                // 삭제를 진행하시면 됩니다.

                // 4. 만약 비밀번호가 틀렸다면, 문자열을 반환해서
                // '비밀번호가 틀렷습니다.' 경고창을 띄우세요

                // 삭제 완료되면 모달 닫고 목록 요청 다시 보내세요.

            
            } //end delete event
            
            fuction parseTime(regDateTime) {
            	let year, month, day, hour, minute, second;
            	if(regDateTime.legth === 5){
	            	[year, month, day, hour, minute] = regDateTime;
					second = 0;            		
            	} else{
	            	[year, month, day, hour, minute, second] = regDateTime;
            	}
            	const regTime = new Date(year, month-1, day, hour, minute, second);
            	const date = new Date();
            	const gap = date.getTime() - regTime.getTime()
            	
            	let time;
            	if(gap < 60*60*24*1000) {
            		if(gap < 60* 60 * 1000) {
            			time = "방금전";
            		}else{
            			time = parseInt(gap/(1000*60*60))+'시간 전';
            		}
            	} else if(gap < 60 * 60 * 24 * 30 * 1000) {
            		time = parseInt(gap/(1000*60*60*24)) + '일 전';
            	} else {
            		time = '오래 전'
            	}
            }



    }//window.onload



</script>