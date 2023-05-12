package com.spring.db.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.db.model.ScoreVO;

@Service
public interface IScoreService {
	
	//점수 등록 기능
	void insertScore(ScoreVO vo);
	
	//점수 전체 조회 기능
	List<ScoreVO> selectAllScore();
	
	//점수 삭제 기능
	void deleteScore(int num);
	
	//점수 개별 조회 기능
	ScoreVO selectOne(int num);
}
