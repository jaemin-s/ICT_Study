package com.music.mrs;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.music.mrs.rcmd.service.IRcmdService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/rcmd")
@Slf4j
public class RcmdController {
	
	@Autowired
	private IRcmdService service;
	
	@GetMapping("/code")
	public String getCode(String code, Model model, HttpSession session) {
		model.addAttribute("code",code);
		System.out.println(code);
		log.info("accessToken: {}",session.getAttribute("accessToken"));
		return "/home";
	}
	
	@GetMapping("/spotifyTest")
	public void spotifyTest() {
	}
	
	@RequestMapping("/searchKeyword/{keyword}")
	public String searchKeyword(@PathVariable String keyword,HttpSession session) {
		log.info("keyword: {}",keyword);
		log.info(session.getAttribute("accessToken").toString());
		service.searchKeyword(keyword, session.getAttribute("accessToken").toString());
		return null;
	}

}
//https://accounts.spotify.com/authorize?client_id=61195beb56f14da19d09a1b3b6216b90&redirect_uri=http://localhost:8181/mrs/rcmd/code&response_type=code