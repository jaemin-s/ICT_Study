package com.music.mrs.rcmd.service;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class RcmdService implements IRcmdService {

	@Override
	public void searchKeyword(String keyword,String accessToken) {
		String seedArtists = "";
		String seedGenres = "";
		String seedTracks = "";
		String minPopularity = "0";
		if(keyword.equals("happy")) {
			seedArtists = "5TnQc2N1iKlFjYD7CPGvFc";
			seedGenres = "행복 신남";
			seedTracks = "0EhdXt3y460mTRsi97Pyk5";
		}else if(false) {
			
		}else {
			
		}
		String requestUri = "https://api.spotify.com/v1/recommendations";
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + accessToken);
		
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("limit", "10");
		params.add("market", "KR");
		params.add("seed_artists", seedArtists);
		params.add("seed_genres", seedGenres);
		params.add("seed_tracks", seedTracks);
		params.add("min_popularity", minPopularity);
		
		RestTemplate template = new RestTemplate();
		
		HttpEntity<Object> requestEntity = new HttpEntity<Object>(params, headers);
		
		ResponseEntity<Object> responseEntity =
				template.exchange(requestUri, HttpMethod.GET, requestEntity, Object.class);
		
		Object responseData = responseEntity.getBody();
		log.info("data: {}",responseData);
		
	}

}
