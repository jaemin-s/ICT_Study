package com.music.mrs;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import se.michaelthelin.spotify.SpotifyApi;
import se.michaelthelin.spotify.model_objects.credentials.AuthorizationCodeCredentials;
import se.michaelthelin.spotify.requests.authorization.authorization_code.AuthorizationCodeRefreshRequest;

@RestController
public class TokenController {
	
	@Value("${client.id}")
	private String clientId;

	@Value("${client.secret}")
	private String clientSecret;

	@Value("${redirect.uri}")
	private String redirectUri;
	
	@PostMapping("/refreshToken")
	public ResponseEntity<Map<String, Object>> refreshAccessToken(@RequestParam("refreshToken") String refreshToken) {
	    try {
	    	// SpotifyApi 객체 생성
	    	SpotifyApi spotifyApi = new SpotifyApi.Builder()
	    	        .setClientId(clientId)
	    	        .setClientSecret(clientSecret)
	    	        .build();

	        // 액세스 토큰 갱신 요청
	        AuthorizationCodeRefreshRequest refreshRequest = spotifyApi.authorizationCodeRefresh()
	                .refresh_token(refreshToken)
	                .build();

	        // 액세스 토큰 갱신 실행
	        AuthorizationCodeCredentials refreshedCredentials = refreshRequest.execute();
	        String newAccessToken = refreshedCredentials.getAccessToken();
	        String newRefreshToken = refreshedCredentials.getRefreshToken();
	        int newExpiresIn = refreshedCredentials.getExpiresIn();

	        // 응답 맵 생성
	        Map<String, Object> response = new HashMap<>();
	        response.put("accessToken", newAccessToken);
	        response.put("refreshToken", newRefreshToken);
	        response.put("expiresIn", newExpiresIn);

	        return ResponseEntity.ok(response);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    }
	}
	
}
