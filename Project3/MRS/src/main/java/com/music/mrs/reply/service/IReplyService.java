package com.music.mrs.reply.service;

import java.util.List;
import java.util.Map;

import com.music.mrs.command.ReplyVO;
import com.music.mrs.command.UserVO;

public interface IReplyService {

	// 댓글 등록
    void replyRegist(int mno,ReplyVO vo,UserVO uservo);
    
    // 목록 요청
    List<ReplyVO> getList(int rmno,int pageNum);
    //댓글 총합
    int getTotal(int bno);
    
    //댓글 번호 얻어오기
    ReplyVO getrno(int rno);
    
    // 댓글 수정
    void update(ReplyVO reply,int urno);
    
    // 댓글 삭제
    void delete(int rno,int urno);

    
	
}
