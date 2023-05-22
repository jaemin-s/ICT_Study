package com.spring.myweb.reply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.myweb.command.ReplyVO;
import com.spring.myweb.reply.mapper.IReplyMapper;
import com.spring.myweb.util.PageVO;

@Service
public class ReplyService implements IReplyService {
	
	@Autowired
	private IReplyMapper mapper;

	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Override
	public void replyRegist(ReplyVO vo) {
		vo.setReplyPw(encoder.encode(vo.getReplyPw()));
		mapper.replyRegist(vo);
	}

	@Override
	public List<ReplyVO> getList(int bno, int pageNum) {
		
		PageVO vo = new PageVO();
		vo.setPageNum(pageNum);
		vo.setCpp(5);
		
		Map<String, Object> data = new HashMap<>();
		data.put("paging", vo); //페이징 쿼리를 위한 pageNum과 cpp 
		data.put("bno", bno);
		
 		return mapper.getList(data);
	}

	@Override
	public int getTotal(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean pwCheck(ReplyVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void update(ReplyVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int rno) {
		// TODO Auto-generated method stub

	}

}
