package com.spring.basic.controller;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.basic.model.UserVO;

//자동으로 스프링 컨테이너에 해당 클래스의 빈을 등록하는 아노테이션
//빈을 등록해 놔야 HandlerMapping이 이 클래스의 객체를 검색할 수 있을 것이다
@Controller
@RequestMapping("/request") //컨트롤러에서 공통된 URI를 맵핑
public class RequestController {

	public RequestController() {
		System.out.println("ReauestCon 요청 들어옴");
	}
	
	@RequestMapping("/test") // "/request/test"
	public String testCall() {
		System.out.println("/request/test 요청 들어옴");
		return "test";
	}
	
//	@RequestMapping(value="/request/basic01", method = RequestMethod.GET)
	@GetMapping("/basic01")
	public String req() {
		System.out.println("/request/basic01 요청 들어옴 : GET ");
		return "request/req-ex01";
	}
	
//	@RequestMapping(value="/request/basic01", method = RequestMethod.POST)
	@PostMapping("/basic01")
	public String basic() {
		System.out.println("/request/basic01 요청이 들어옴 : METHOD");
		return "request/req-ex01";
	}
	
	/////////////////////////////
	// void타입이면 요청값이 전달됨
	@GetMapping("/join")
	public void register() {
		System.out.println("/request/join: GET");
	}
	
	/*
	  스프링에서 요청과 함께 전달된 데이터를 처리하는 방식
	  
	  1. 전통적인 jsp/servlet 방식의 파라미터 읽기 처리 방법/
	  - HttpServletRequest 객체를 활용 (우리가 jsp에서 사용하던 방식)
	  
	 */
	/*@PostMapping("/join")
	public void register(HttpServletRequest request) {
		System.out.println("/request/join: POST");
		
		System.out.println("ID: "+ request.getParameter("userId"));
		System.out.println("Pw: "+ request.getParameter("userPw"));
		System.out.println("hobby: "+ Arrays.toString(request.getParameterValues("hobby")));
	}*/
	
	/*
	  2. 
	 */
	/*
	 * @PostMapping("/join") public void register( // @RequestParam("userId") String
	 * id, // @RequestParam("userPw") String pw, // @RequestParam("hobby")
	 * List<String> hobbies) { String userId, //파라미터 변수명과 저장할 변수명이 같으면 생략가능 String
	 * userPw,
	 * 
	 * @RequestParam(value="hobby", required = false, defaultValue =
	 * "no hobby person") List<String> hobby){
	 * 
	 * 
	 * System.out.println("ID: "+ userId); System.out.println("Pw: "+ userPw);
	 * System.out.println("hobby: "+ hobby); }
	 */
	
	/*
	  3. 커맨드 객체를 활용한 파라미터 처리
	  - 파라미터 데이터와 연동되는 VO 클래스가 필요합니다.
	 */
	@PostMapping("/join")
	public void register(UserVO vo) {
		System.out.println(vo);
	}
}
