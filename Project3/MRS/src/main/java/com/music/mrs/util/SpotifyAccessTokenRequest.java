package com.music.mrs.util;

import java.io.IOException;
import java.net.URI;

import javax.annotation.PostConstruct;

import org.apache.hc.core5.http.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import se.michaelthelin.spotify.SpotifyApi;
import se.michaelthelin.spotify.exceptions.SpotifyWebApiException;
import se.michaelthelin.spotify.model_objects.credentials.AuthorizationCodeCredentials;
import se.michaelthelin.spotify.requests.authorization.authorization_code.AuthorizationCodeRequest;
import se.michaelthelin.spotify.requests.authorization.authorization_code.AuthorizationCodeUriRequest;

//SpotifyAuthController 클래스:
//이 클래스는 Spring MVC 컨트롤러로, 웹 애플리케이션의 사용자 인증과 관련된 역할을 담당합니다.
///login 엔드포인트는 사용자 인증을 위한 Spotify 인증 URL을 생성하고, 사용자를 해당 URL로 리다이렉트합니다.
///callback 엔드포인트는 사용자 인증 후에 Spotify에서 전달된 코드를 받아 액세스 토큰을 요청하고 처리합니다.
///success와 /error 엔드포인트는 인증 성공 및 실패 시 처리를 담당합니다.
//이 클래스는 웹 애플리케이션에서 사용자 인증 과정을 처리하고, 인증 결과를 화면에 표시하거나 다른 기능과 연동하여 활용할 수 있습니다.
//-------------
//SpotifyAuthController에서 /login 엔드포인트를 호출하면 사용자는 Spotify 인증 페이지로 리다이렉트됩니다.
//사용자가 인증을 완료하면 Spotify는 /callback 엔드포인트로 리디렉션합니다.
//SpotifyAuthController의 /callback 엔드포인트는 전달된 코드를 이용해 SpotifyAccessTokenRequest 클래스의 requestAccessToken() 메서드를 호출하여 액세스 토큰을 얻습니다.
//액세스 토큰을 얻은 후 SpotifyAuthController는 필요한 처리를 수행하고, 예를 들어 /success 엔드포인트로 리다이렉트하여 인증 성공 메시지를 표시할 수 있습니다.
//SpotifyAuthController에서 SpotifyAccessTokenRequest 클래스를 활용

@Component
public class SpotifyAccessTokenRequest {

    @Value("${client.id}")
    private String clientId;

    @Value("${client.secret}")
    private String clientSecret;

    @Value("${redirect.uri}")
    private String redirectUri;

    private SpotifyApi spotifyApi;

    @PostConstruct
    public void initialize() {
        // SpotifyApi 객체를 생성하고 클라이언트 ID, 클라이언트 시크릿, 콜백 URI를 설정합니다.
        spotifyApi = new SpotifyApi.Builder()
                .setClientId(clientId)
                .setClientSecret(clientSecret)
                .setRedirectUri(URI.create(redirectUri))
                .build();
    }

    public void requestAccessToken() {
        // 사용자 인증을 위한 인증 코드를 얻기 위해 로그인 URL을 생성합니다.
        AuthorizationCodeUriRequest authorizationCodeUriRequest = spotifyApi.authorizationCodeUri()
                .state("x4xkmn9pu3j6ukrs8n")
                .scope("user-read-private,user-read-email,user-modify-playback-state,app-remote-control")
                .show_dialog(true)
                .build();

        URI authorizationCodeUri = authorizationCodeUriRequest.execute();
        System.out.println("Please authorize the application by clicking the following link:");
        System.out.println(authorizationCodeUri.toString());

        // 사용자가 인증 후에 리디렉션되는 URI를 입력합니다.
        String code = "http://localhost/mrs/";

        // 액세스 토큰 요청을 생성하고 실행합니다.
        AuthorizationCodeRequest authorizationCodeRequest = spotifyApi.authorizationCode(code)
                .build();

        try {
            AuthorizationCodeCredentials authorizationCodeCredentials = authorizationCodeRequest.execute();
            String accessToken = authorizationCodeCredentials.getAccessToken();
            String refreshToken = authorizationCodeCredentials.getRefreshToken();
            int expiresIn = authorizationCodeCredentials.getExpiresIn();

            System.out.println("Access Token: " + accessToken);
            System.out.println("Refresh Token: " + refreshToken);
            System.out.println("Expires In: " + expiresIn);
            
            // TODO: 액세스 토큰을 저장하고 필요한 처리를 수행합니다.
            // 예시: 다른 클래스로 액세스 토큰을 전달하거나, 데이터베이스에 저장하는 등의 작업을 수행합니다.
            
        
        } catch (IOException | SpotifyWebApiException | ParseException e) {
            e.printStackTrace();
        }
    }
}