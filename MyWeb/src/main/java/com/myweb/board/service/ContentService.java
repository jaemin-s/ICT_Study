package com.myweb.board.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;

public class ContentService implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int bId = Integer.parseInt(request.getParameter("bId"));
		BoardDAO dao = BoardDAO.getInstance();
		Cookie[] cookies = request.getCookies();
		boolean flag = false;
		if(cookies != null) {
			for(Cookie c : cookies) {
				if(c.getName().equals(bId+"cookie")) {
					flag = true;
					break;
				}
			}
		}
		if(!flag) {
			dao.upHit(bId);
		}
		Cookie c = new Cookie(bId+"cookie", "true");

		c.setMaxAge(15);
		response.addCookie(c);

		BoardVO	vo = dao.contentBoard(bId);
		if(vo.getContent()!=null) {
			vo.setContent(vo.getContent().replace("\r\n", "<br>"));
		}
		request.setAttribute("content", vo);

	}

}
