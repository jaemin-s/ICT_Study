package com.spring.db.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.db.model.BoardVO;
import com.spring.db.repository.IBoardDAO;

@Service
public class BoardService implements IBoardService {
	
	@Autowired
	private IBoardDAO dao;

	@Override
	public void insertB(BoardVO vo) {
		dao.insertArticle(vo);
	}

	@Override
	public List<BoardVO> sellectAllB() {
		return dao.getArticles();
		
	}

	@Override
	public BoardVO sellectOneB(int bno) {
		return dao.getArticle(bno);
	}

	@Override
	public void updateB(BoardVO vo) {
		dao.updateArticle(vo);
	}

	@Override
	public void deleteB(int bno) {
		dao.deleteArtcle(bno);

	}

}
