package com.music.mrs.reply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.music.mrs.command.ReplyVO;
import com.music.mrs.command.UserVO;
import com.music.mrs.reply.mapper.IReplyMapper;
import com.music.mrs.util.PageVO;

@Service
public class ReplyService implements IReplyService {

	@Autowired
    private IReplyMapper mapper;
	
	@Override
	public void replyRegist(int rmno,ReplyVO vo,UserVO uservo) {
		mapper.replyRegist(rmno,vo,uservo);
	}

	@Override
	public List<ReplyVO> getList(int rmno,int pageNum) {
	
		PageVO vo = new PageVO();
		vo.setPageNum(pageNum); //화면에서 전달된 페이지 번호
		vo.setCpp(10); //댓글은 한 화면에 5개씩.
		
		Map<String, Object> data = new HashMap<>();
		data.put("paging", vo); //페이지 쿼리를 위한 pageNum과 cpp
		data.put("rmno", rmno); //몇 번 글의 댓글을 가져올지에 대한 정보
		
		return mapper.getList(data);
	}
	
	@Override
	public ReplyVO getrno(int rno) {
		return mapper.getrno(rno);
	}
	
	@Override
	public int getTotal(int bno) {
		return mapper.getTotal(bno);
	}

	@Override
	public void update(ReplyVO reply,int urno) {
		int updatedRows = mapper.update(reply,urno);
		if (updatedRows == 0) {
	        throw new RuntimeException("Update failed");
	    }

	}

	@Override
	public void delete(int rno,int urno) {
		 int deletedRows = mapper.delete(rno, urno);
		 if (deletedRows == 0) {
		        throw new RuntimeException("Delete failed");
		    }
	}

}
