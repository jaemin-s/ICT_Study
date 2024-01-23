package com.music.mrs.spotify.service;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;

@Service
public class SpotifyService implements ISpotifyService {
	
	private void setCode(String code) {
		System.out.println(code);
	}

}
