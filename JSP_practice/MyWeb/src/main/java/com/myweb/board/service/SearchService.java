package com.myweb.board.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;

public class SearchService implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String category = request.getParameter("category");
		String keyword = request.getParameter("search");
		List<BoardVO> bList = BoardDAO.getInstance().searchBoard(category, keyword);
		PrintWriter out;
		response.setContentType("text/html; charset=UTF-8");
		try {
			out = response.getWriter();
			if(bList.size()==0) {
				String htmlCode = "<script>\r\n"
	                    + "alert('검색 결과가 없습니다.');\r\n"
	                    + " location.href='/MyWeb/list.board';\r\n"
	                    + "</script>";
				out.print(htmlCode);
				out.flush();
				out.close();
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("boardList", bList);

	}

}
