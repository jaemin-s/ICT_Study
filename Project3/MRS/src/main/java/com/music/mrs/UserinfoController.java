package com.music.mrs;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.music.mrs.command.UserVO;
import com.music.mrs.user.service.IUserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class UserinfoController {

	@Autowired
	private IUserService service;
	
	@PostMapping("/userinfo")
	public ResponseEntity<Void> userinfo(@RequestBody UserVO data, HttpSession session) {
		
		System.out.println(data.getDisplayName());
		System.out.println(data.getEmail());
		service.insert(data);
		
		data.setUsersId(service.usersIdCall(data));
//		System.out.println(data.getUsersId());
		session.setAttribute("urno", service.usersIdCall(data));
		session.setAttribute("userinfo", data);
		
		return ResponseEntity.ok().build();
	}
	
	
	
}
