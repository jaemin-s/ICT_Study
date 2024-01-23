package com.myweb.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.commons.PageCreator;
import com.myweb.board.commons.PageVO;
import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;

public class GetListService implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		PageVO paging = new PageVO();
		BoardDAO dao = BoardDAO.getInstance();
		
		if(request.getParameter("cpp")!= null) {
			paging.setCpp(Integer.parseInt(request.getParameter("cpp")));
			paging.setPage(Integer.parseInt(request.getParameter("page")));
		}
		
		List<BoardVO> bList = dao.listBoard(paging);
		
		PageCreator pc = new PageCreator();
		pc.setPaging(paging);
		pc.setArticleTotalCount(dao.countArticles());
		
		request.setAttribute("boardList", bList);
		request.setAttribute("pc", pc);
	}

}
