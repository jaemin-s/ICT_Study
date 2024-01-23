<h1>Spotify API를 활용한 음악추천서비스</h1> 
<p>사용자의 정보에 따라 음악을 추천하는 서비스를 제공합니다.</p>
<p>Premium 구독시 스트리밍 및 댓글 작성 가능합니다.</P>
<h2> 구성</h2>
<h3> API</h3>
<ul>
<li>초단기예보(공공데이터) : 날씨 정보</li>
<li>Spotify Data API : 노래 정보 및 재생상태 컨트롤</li>
<li>Spotify SDK API : 음악 재생 기능</li>
</ul>

<h3> function </h3>
<ul>
<li>getPlaybackState() : 재생상태 받아오기, return playerbackState</li>
<li>getAvailableDevices() : diveces 받아오기, return divece_id(String)</li>
<li>startResumePlayback(urisArray) : 특정 곡들 재생 준비, void, player/play</li>
<li>skipToNext() : 다음 곡 재생, void</li>
<li>skipToPrevious() : 이전 곡 재생, void</li>
<li>seekToPosition(position) : 재생 시간 이동, void, default : 0ms</li>
<li>playerRepeat() : 반복 재생모드 순환 track >> context >> off >> track</li>
<li>setPlaybackVolum(vol) : 볼륨 설정, void, default : 0</li>
<li>togglePlaybackShuffle() : 랜덤 모드 토글, void</li>
<li>getTheUsersQueue() : 재생중인 목록 확인, currntly_playing,queue</li>
<li>searchForItem(query) : 검색, return data</li>
<li>recommendations(seedArtists,seedTracks) : 곡과 가수로 추천곡 받기</li>
</ul>


  




















-