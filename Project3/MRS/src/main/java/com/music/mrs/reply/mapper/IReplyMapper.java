package com.music.mrs.reply.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import com.music.mrs.command.ReplyVO;
import com.music.mrs.command.UserVO;

public interface IReplyMapper {
	
	// 댓글 등록
    void replyRegist(@Param("rmno") int rmno,@Param("vo") ReplyVO vo,@Param("uservo") UserVO uservo);
    
    // 목록 요청
    List<ReplyVO> getList(Map<String, Object> data);
    
    int getTotal(int bno);
    
    //댓글 번호 얻어오기
    ReplyVO getrno(int rno);
    
    // 댓글 수정
    int update(@Param("reply") ReplyVO reply,@Param("urno") int urno);
    
    // 댓글 삭제
    int delete(@Param("rno") int rno,@Param("urno") int urno);
}
