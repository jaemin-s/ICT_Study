<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="icon" type="image/x-icon" />
<!-- 메인 화면 -->
<section class="main">
	<%@ include file="include/side.jsp"%>

	<div class="main-right" id="main-right">

		<ul>
			<!-- 검색 기능  -->
			<div class="search">
	    		<input type="text" id="searchQuery" placeholder="Enter search query">
	    		<button id="searchBtn">Search</button>
			</div>
			<!-- 사용 설명 -->
			<div class="manual">
				<button class="manual-btn">사용 메뉴얼 ⬇</button>
				<p class="hidden-manual">1. 노래 추천을 받으려면 아래 그림을 클릭하세요.<br>2. 클릭 후, 추천 목록이 표시될 것입니다.<br>3. 원하는
					곡의 제목을 클릭하면 해당 곡과 관련된 곡들이 재생됩니다.<br>4. 프리미엄 구독을 하시면 댓글 페이지에 접속할 수
					있습니다.<br><br>즐거운 음악 청취 시간 되세요!</p>
			</div>
			<!-- 로고 이미지 -->
			<div class="main-logo-img">
				<img id=""
					src="${pageContext.request.contextPath }/img/logo_whi.png" alt="#">
			</div>

			<!-- 노래 모음 설명 -->
			<li class="choose">
				<!-- 추천 테이블 -->
				<div class="choose-text">them by feeling</div> <!-- 추천 테이블 이미지 -->
				<div class="flex-box">
					<div id="choose-imgs" class="choose-img">
						<img data-keyword="happy" 
							src="${pageContext.request.contextPath }/img/happy.png" alt="#">
						<img data-keyword="wantSing" 
							src="${pageContext.request.contextPath }/img/sing.png" alt="#">
						<img data-keyword="love" 
							src="${pageContext.request.contextPath }/img/love.png" alt="#">
						<img data-keyword="fresh" 
							src="${pageContext.request.contextPath }/img/refresh.png"	alt="#">
						<img data-keyword="sad" 
							src="${pageContext.request.contextPath }/img/sad.png" alt="#">
						<img data-keyword="rest" 
							src="${pageContext.request.contextPath }/img/trip.png" alt="#">
						<img data-keyword="solo" 
							src="${pageContext.request.contextPath }/img/lonely.png" alt="#">
						<img data-keyword="exercise" 
							src="${pageContext.request.contextPath }/img/exercise.png" alt="#">
						<img data-keyword="nowHot" 
							src="${pageContext.request.contextPath }/img/popular.png" alt="#">
						<img data-keyword="calmness"
							src="${pageContext.request.contextPath }/img/windless.png" alt="#"> 
						<img data-keyword="party" 
							src="${pageContext.request.contextPath }/img/party.png" alt="#"> 
						<img class="weather" data-keyword="sunny" 
							src="${pageContext.request.contextPath }/img/sunny.png" alt="#">
					</div>
					<div id="result-list" class="hidden result-list">
						<button class="hidden-button">X</button>
		                <div class="list-head flex">
		                    <div class="result-image">앨범</div>
		                    <div class="result-title">곡명</div>
		                    <div class="result-artists">가수</div>
		                </div>
		                <ul class="list-body"></ul>
		            </div>
				</div>

			</li>
		</ul>

	</div>

	<%@ include file="include/detail.jsp"%>
</section>
<script src="https://sdk.scdn.co/spotify-player.js"></script>
<script type="text/javascript">
	
	let title = '';
	let artist = '';
	
	document.querySelector('.hidden-button').onclick = function() {
		document.querySelector('#result-list').classList.toggle('hidden');
		document.querySelector('#choose-imgs').classList.toggle('flextoggle');
	}
	
	document.getElementById('choose-imgs').addEventListener('click',e=>{
		
		if (!document.querySelector('#choose-imgs').classList.contains('flextoggle')) {
			document.querySelector('#choose-imgs').classList.toggle('flextoggle');
		}
		if (document.querySelector('#result-list').classList.contains('hidden')) {
			document.querySelector('#result-list').classList.toggle('hidden');
		}

		 let MyUrl = "";
	        if(e.target.dataset.keyword === "happy"){ 
	        	// 행복
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=4gzpq5DPGxSnKTe4SA8HAU&seed_genres=pop&seed_tracks=75JFxkI2RXiU7L9VXzMkle";
	        }else if(e.target.dataset.keyword === "wantSing"){
	        	// 불러볼까?
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=40&market=KR&seed_artists=57YbQhFBBDksLzX08lqVnw&seed_genres=겨울&seed_tracks=7vnec3moFU8rMbHFUq9Ue7";
	        	
	        }else if(e.target.dataset.keyword === "sad"){ 
	        	// 슬픈
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&market=KR&seed_artists=3MaRWfwKpbYnkYHC5gRKYo&seed_genres=슬픈&seed_tracks=7oT5JOWwxnwcZRI6NLzhWs";
	        	
	        }else if(e.target.dataset.keyword === "nowHot"){ 
	        	// 요즘 인기
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=4SpbR6yFEvexJuaBpgAU5p&seed_genres=인기 있는&K-POP&seed_tracks=51vRumtqbkNW9wrKfESwfu";
	        	
	        }else if(e.target.dataset.keyword === "love"){ 
	        	// 사랑
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=6zn0ihyAApAYV51zpXxdEp&seed_genres=love&seed_tracks=47CcHKISaUPsK4QkO9ERFc";
	        	
	        }else if(e.target.dataset.keyword === "solo"){ 
	        	// 외로운
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=50&market=KR&seed_artists=4dB2XmMpzPxsMRnt62TbF5&seed_genres=ballad&seed_tracks=10if3nqm7OS7qrV45v9GOg";
	        	
	        }else if(e.target.dataset.keyword === "calmness"){ 
	        	// 잔잔한
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=7c1HgFDe8ogy5NOZ1ANCJQ&seed_genres=잔잔한&발라드&seed_tracks=2YduGtSyKz5Mizcc9mTeFC";
	        	
	        }else if(e.target.dataset.keyword === "fresh"){ 
	        	// 상큼한, 발랄한
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=0du5cEVh5yTK9QJze8zA0C&seed_genres=k-pop&seed_tracks=32OlwWuMpZ6b0aN2RZOeMS";
	        	
	        }else if(e.target.dataset.keyword === "party"){ 
	        	// 파티하자
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=0du5cEVh5yTK9QJze8zA0C&seed_genres=k-pop&seed_tracks=32OlwWuMpZ6b0aN2RZOeMS";
	        	
	        }else if(e.target.dataset.keyword === "exercise"){ 
	        	// 운동하자
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=6fOMl44jA4Sp5b9PpYCkzz&seed_genres=edm&pop&seed_tracks=5rLyYxZNzca00ENADO9m54";
	        	
	        }else if(e.target.dataset.keyword === "rest"){ 
	        	// 여행 가자
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=2el9LgZHLeQnXHABBkgb7M&seed_genres=trip&seed_tracks=4L1MHK27ifT30Ndicpr7js";
	        	
	        }else if(e.target.dataset.keyword === "sunny") {
	        	// 화창한 날
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=3HqSLMAZ3g3d5poNaI7GOU&seed_genres=K-POP%26%ED%99%94%EC%B0%BD%ED%95%9C&seed_tracks=5xrtzzzikpG3BLbo4q1Yul&min_energy=0&max_energy=1";
	        		        		
	        } else if (e.target.dataset.keyword === "cloudy") {
	        	// 흐린 날
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=60&market=KR&seed_artists=50Zu2bK9y5UAtD0jcqk5VX&seed_genres=우울한&발라드&seed_tracks=5xX7oEKHN0H9VOjezo2ZaA";
	        		        		
	        } else if (e.target.dataset.keyword === "rain") {
	        	// 비 오는 날
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=4gzpq5DPGxSnKTe4SA8HAU&seed_genres=pop&seed_tracks=75JFxkI2RXiU7L9VXzMkle";
	        		        		
	        } else if (e.target.dataset.keyword === "snow") {
	        	// 눈 오는 날		
	        	MyUrl = "https://api.spotify.com/v1/recommendations?limit=10&min_popularity=80&market=KR&seed_artists=4iHNK0tOyZPYnBU7nGAgpQ&seed_genres=WINTER&SNOW&CALROL&seed_tracks=0bYg9bo50gSsH3LtXe2SQn";
	        }

		
		fetch( MyUrl , {headers : {"Authorization" : `Bearer ${accessToken}`}
			}).then(res => res.json())
			.then(data => {
				[...document.querySelector('#result-list .list-body').children].forEach(child => child.remove());
				[...data.tracks].forEach(track => {
					document.querySelector('#result-list .list-body').insertAdjacentHTML('beforeend',
							 `<li class="flex">
                            <div class="result-image" data-url="`+track.album.images[0].url+`"><img src="`+track.album.images[0].url+`"></img></div>
                            <div class="result-title" data-track-id="`+track.id+`" data-track-uri="`+track.uri+`">`+track.name+`</div>
                            <div class="result-artists" data-artists-id="`+track.artists[0].id+`">`+track.artists[0].name+`</div>
                         </li>`);
				});
			});

	});//이미지 클릭 끝
	    
	//검색 결과 선택시 
	document.querySelector('ul.list-body').addEventListener('click',e=>{
		if(e.target.classList.contains('result-title')){
			let targetId = e.target.dataset.trackId;
			let uris = [e.target.dataset.trackUri];
		
			recommendations(e.target.nextElementSibling.dataset.artistsId,e.target.dataset.trackId)
			.then(trackList => {
				for (let i = 0; i<19; i++){
					if(trackList.length<i) break;
					uris.push(trackList[i].uri);
				}
				startResumePlayback(uris);
				player.getCurrentState().then(state=>{
					console.log(state.paused);
					if(state.paused){
						player.togglePlay();
					}
				});
			});
		}
	});
	
let sky,pty; //하늘상태, 강수형태
	
	//공공데이터 날씨
		 window.onload = () => {
			
			const rsRow = [...document.querySelectorAll('#resultRow *')];
			//현재 날짜를 받아오는 함수
			//const getCurrentDateTime = () =>  {
			 	const now = new Date();	
				const year = now.getFullYear();
				let month = now.getMonth() + 1;
				let day = now.getDate();
				let hour = now.getHours();
				let minute = now.getMinutes();
			//}
			//월과 일이 한 자리 수인 경우 앞에 0을 추가합니다.
			if(month < 10) {
				month = '0' + month;
			}
			if(day < 10) {
				day = '0' + day;
			}
			if(minute < 10) {
				minute = '0' + minute;
			}
			let currentDate = year + month + day;
			let currentTime = hour +""+ minute;
			// let date = new date();
			// 현재 날짜와 시간
			let key = 'g4G7rydHK7S6Nlfpzy%2F7pdkQrtYexqJA3K%2FYEzlsVbzhB00JsplN4%2F1JcIi%2F1GVcGFNDehAgvKYqsHky7QDp4w%3D%3D';
			let nX = '59';
			let nY = '126';
			
			
			let url = `https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst`;
  			let queryParams = `?serviceKey=`+key+`&pageNo=1&numOfRows=25&dataType=JSON&base_date=`+currentDate+`&base_time=1000&nx=`+nX+`&ny=`+nY;
					fetch(url+queryParams).then(res => res.json())
				.then(data => {
					let rs = data.response.body.items.item;
					
					pty=rs[6].fcstValue; //강수 형태
					sky=rs[18].fcstValue;
					if(rsRow.length >= 5) {
						rsRow[0].textContent=currentDate;
						rsRow[1].textContent=currentTime;
						rsRow[2].textContent=sky;
						rsRow[3].textContent=pty;
					}
					
					// 음악 재생 로직 추가
					playMusic(sky,pty);
				});
					
					function playMusic(sky, pty) {   
						let MyUrl = "";
						if (pty === "1" || pty === "2" || pty === "5" || pty === "6") {
							document.querySelector(".weather").dataset.keyword = "rain";
							document.querySelector(".weather").src = "${pageContext.request.contextPath }/img/rain.png"
						} else if(sky === "1"){
							document.querySelector(".weather").dataset.keyword = "sunny";
							document.querySelector(".weather").src = "${pageContext.request.contextPath }/img/sunny.png"
						} else if(sky === "3" || sky === "4"){
							document.querySelector(".weather").dataset.keyword = "cloudy";
							document.querySelector(".weather").src = "${pageContext.request.contextPath }/img/cloudy.png"
						}else if(pty === "3"){
							document.querySelector(".weather").dataset.keyword = "snow";
							document.querySelector(".weather").src = "${pageContext.request.contextPath }/img/winter.png"
						}
						
					} 
				
				if(${accessToken != null}) {
					/* 닉네임 받아와서 사용 */
						fetch('https://api.spotify.com/v1/me', {headers : {"Authorization" : `Bearer ${accessToken}`}})
							.then(res => res.json())
							.then(data => {
								display_name = data.display_name;
								display_email = data.email;
								product = data.product
								document.querySelector('.menu>h1').textContent = display_name + ' 님';
								document.querySelector('.menu>h1').name = display_name;
								document.querySelector('input[name=product]').value = product;
								const jsonData = JSON.stringify(data);

								fetch('${pageContext.request.contextPath}/userinfo', {
									method: 'POST',
									headers: {
										'Content-Type': 'application/json'
									},
									body: jsonData
								}).then(e=>{
									if(${accessToken != null}) {
										console.log(document.querySelector('input[name=product]').value);
										if (document.querySelector('input[name=product]').value != 'premium') {
											alert("free모드는 노래 추천만 가능합니다.\npremium사용 시 모든 기능 작동합니다.");
											document.querySelector(".videoBtn").style.display = "none";
											document.querySelector(".controller-controls").style.pointerEvents = "none";
											document.querySelector(".imgDiv").style.pointerEvents = "none";
											document.querySelector('#result-list .list-body').style.pointerEvents = "none";
											document.querySelector(".premium-btn").style.display = "block";
										}else{
											document.querySelector(".premium-btn").style.display = "none";
										}
									}
								});
								
							});
				}
				

		 }
	//검색 기능	 
	 let search = document.getElementById('searchQuery');
	 let $sbtn = document.getElementById('searchBtn');
		
		document.getElementById('searchBtn').addEventListener('click', e => {
			if (search.value.trim() === '') {
			    alert("검색어를 작성해주세요.");
			    return;
			}
			document.querySelector('#choose-imgs').classList.add('flextoggle');
			document.querySelector('#result-list').classList.remove('hidden');
			  searchForItem(search.value).then(data => {
			    [...document.querySelector('#result-list .list-body').children].forEach(child => child.remove());
				[...data.tracks.items].forEach(item => {
					document.querySelector('#result-list .list-body').insertAdjacentHTML('beforeend',
						`<li class="flex">
	                        <div class="result-image" data-url="`+item.album.images[0].url+`"><img src="`+item.album.images[0].url+`"></img></div>
	                        <div class="result-title" data-track-id="`+item.id+`" data-track-uri="`+item.uri+`">`+item.name+`</div>
	                        <div class="result-artists" data-artists-id="`+item.artists[0].id+`">`+item.artists[0].name+`</div>
	                     </li>`);		
				});
			  });
			});
		search.addEventListener('keydown', e => {
	        if(e.keyCode === 13) {            
	            $sbtn.click();
	        }
	    });

	document.querySelector('.manual-btn').onclick = function() {
	document.querySelector('.manual p').classList.toggle('hidden-manual');
	if(document.querySelector('.manual p').classList.contains('hidden-manual')) {
		document.querySelector('.manual-btn').textContent = '사용 메뉴얼 ⬇';
	}else if(!document.querySelector('.manual p').classList.contains('hidden-manual')) {
		document.querySelector('.manual-btn').textContent = '사용 메뉴얼 ⬆';
	}
}
	
</script>