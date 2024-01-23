package com.myweb.board.model;

import java.util.*;

import com.myweb.board.commons.PageVO;

public interface IBoardDAO {
	
	//글 등록
	void regist(String writer, String title, String content);
	
	//글 목록 보기
	List<BoardVO> listBoard(PageVO paging);
	
	//글 상세보기
	BoardVO contentBoard(int boardId);
	
	//글 수정(제목, 내용)
	void updateBoard(String title, String content, int boardId);
	
	//글 삭제
	void deleteBoard(int boardId);
	
	//글 검색
	List<BoardVO> searchBoard(String category,String keyword);
	
	//조회수 추가
	void upHit(int bId);
	
	//총 게시물 수 조회
	int countArticles();
}
