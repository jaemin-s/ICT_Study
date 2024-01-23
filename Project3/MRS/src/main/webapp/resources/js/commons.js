   	      //  클릭시 페이지 넘어가는것처럼 보이게 하기
            const $mainBtn = document.querySelector(".mainBtn");
            const $videoBtn = document.querySelector(".videoBtn");
            const $mainPage = document.getElementById("main-right");
            const $videoPage = document.getElementById("video-right");
            const $videoImg = document.querySelector(".cover-img");

            $mainBtn.onclick = function() {
                console.log("메인페이지 클릭");
                console.log("메인: " + $mainPage.style.dispaly);
                console.log($videoPage.style.dispaly);
                $mainPage.style.display = "block";
                $mainBtn.style.color = "rgb(191, 23, 23)";
                $videoPage.style.display = "none";
                $videoBtn.style.color = "black";
            }

            $videoBtn.onclick = function() {
                console.log("비디오페이지 클릭");
                if($videoImg.getAttribute('src') === '') {
                	alert('노래를 먼저 선택해주세요');
					return;
                }
                $mainPage.style.display = "none";
                $mainBtn.style.color = "black";
                $videoPage.style.display = "flex";
                $videoBtn.style.color = "rgb(191, 23, 23)";
                
            }
			
           
	      