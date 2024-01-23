<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Spotify Web Playback SDK Quick Start</title>
</head>
<body>
    <h1>Spotify Web Playback SDK Quick Start</h1>
    <button id="togglePlay">Toggle Play</button>
    <button id="status">status</button>
    <button id="reconnect">reconnect</button>
    <script src="https://sdk.scdn.co/spotify-player.js"></script>
    <script>
    let player;
      window.onSpotifyWebPlaybackSDKReady = () => {
            const token = `${accessToken}`;
            player = new Spotify.Player({
                name: 'Web Playback SDK Quick Start Player',
                getOAuthToken: cb => { cb(token); },
                volume: 0.5
            });

            // Ready
            player.addListener('ready', ({ device_id }) => {
                console.log('Ready with Device ID', device_id);
            });

            // Not Ready
            player.addListener('not_ready', ({ device_id }) => {
                console.log('Device ID has gone offline', device_id);
            });

            player.addListener('initialization_error', ({ message }) => {
                console.error(message);
            });

            player.addListener('authentication_error', ({ message }) => {
                console.error(message);
            });

            player.addListener('account_error', ({ message }) => {
                console.error(message);
            });

            document.getElementById('togglePlay').onclick = function() {
              player.togglePlay();
            };
            document.getElementById('status').onclick = function() {
            	player.getCurrentState().then(state => {
            	  console.log(state);
           		  if (!state) {
           		    console.error('User is not playing music through the Web Playback SDK');
           		    return;
           		  }

           		  var current_track = state.track_window.current_track;
           		  var next_track = state.track_window.next_tracks[0];

           		  console.log('Currently Playing', current_track);
           		  console.log('Playing Next', next_track);
           		});
            }
			document.getElementById('reconnect').onclick = function(){
				player.connect();
			}
            player.connect();
        }
    </script>
</body>
</html>