package com.myweb.user.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.user.model.UserDAO;
import com.myweb.user.model.UserVO;

public class DeleteService implements IUserService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		UserDAO dao = UserDAO.getInstance();
		String id = ((UserVO)request.getSession().getAttribute("user")).getUserId();
		response.setContentType("text/html; charset=UTF-8");
		String htmlCode;
		PrintWriter out = null;
		if (dao.userCheck(id, request.getParameter("check_pw"))==1) {
			dao.deleteUser(id);
			request.getSession().removeAttribute("user");
			htmlCode =  "<script>\r\n"
                    + "alert('회원탈퇴가 정상 처리되었습니다.');\r\n"
                    + " location.href='/MyWeb';\r\n"
                    + "</script>";
		}else {
			htmlCode =  "<script>\r\n"
                    + "alert('비밀번호가 틀렸습니다.');\r\n"
                    + " history.back();\r\n"
                    + "</script>";
		}
		try {
			out = response.getWriter();
			
			out.print(htmlCode);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

}
