package com.spring.db.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.db.model.BoardVO;
import com.spring.db.repository.IBoardMapper;

@Service
public class BoardService implements IBoardService {
	
//	@Autowired
//	@Qualifier("boardDAO")
//	private IBoardDAO dao;
	@Autowired
	private IBoardMapper mapper;

	@Override
	public void insertB(BoardVO vo) {
		mapper.insertArticle(vo);
	}

	@Override
	public List<BoardVO> sellectAllB() {
		return mapper.getArticles();
		
	}

	@Override
	public BoardVO sellectOneB(int bno) {
		return mapper.getArticle(bno);
	}

	@Override
	public void updateB(BoardVO vo) {
		mapper.updateArticle(vo);
	}

	@Override
	public void deleteB(int bno) {
		mapper.deleteArtcle(bno);

	}

}
