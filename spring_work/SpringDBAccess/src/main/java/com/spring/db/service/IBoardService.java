package com.spring.db.service;

import java.util.List;

import com.spring.db.model.BoardVO;

public interface IBoardService {
	
	//글 등록
	void insertB(BoardVO vo);
	//글 전체 조히ㅗ
	List<BoardVO> sellectAllB();
	//글 하나 조회
	BoardVO sellectOneB(int bno);
	//글 수정
	void updateB(BoardVO vo);
	//글 삭제
	void deleteB(int bno);
	
}
