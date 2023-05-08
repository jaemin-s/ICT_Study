package com.myweb.board.model;

import java.util.*;

public interface IBoardDAO {
	
	//글 등록
	void regist(String writer, String title, String content);
	
	//글 전체 목록
	List<BoardVO> listBoard();
	
	//글 상세보기
	BoardVO contentBoard(int boardId);
	
	//글 수정(제목, 내용)
	void updateBoard(String title, String content, int boardId);
	
	//글 삭제
	void deleteBoard(int boardId);
}
