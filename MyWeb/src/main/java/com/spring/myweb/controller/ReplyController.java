package com.spring.myweb.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.myweb.command.ReplyVO;
import com.spring.myweb.reply.service.IReplyService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/reply")
@Slf4j
public class ReplyController {
	
	@Autowired
	private IReplyService service;

	//댓글 등록
	@PostMapping("/regist")
	public String replyRegist(@RequestBody ReplyVO vo) {
		service.replyRegist(vo);
		return "regSuccess";
	}
	
	@GetMapping("/getList/{bno}/{pageNum}")
	public Map<String, Object> getList(@PathVariable int bno, @PathVariable int pageNum) {
		
		/*
		 1. getList 메서드가 글 번호, 페이지 번호를 경로레서 떼 옵니다.
		 2. Mapper 인터페이스에 복수의 값을 전달하기 위해 Map을 쓸지, @param을 쓸 지 선택.
		 3. ReplyMapper.xml에 sql문을 페이징 쿼리로 작성
		 4. 클라이언트 측으로 DB에서 조회한 댓글 목록을 보낼 때,
		 페이징을 위한 댓글의 총 개수도 함께 보내줘야 합니다.
		 복수개의 값을 리턴하기 위해서 리턴 타입을 Map으로 줄 지, VO형식으로 중 지를 결정합니다.
		 */
		
		List<ReplyVO> list = service.getList(bno, pageNum);
		int total = service.getTotal(bno);
		return null;
		
	}
}
