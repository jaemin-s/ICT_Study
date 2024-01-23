<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
		request.setCharacterEncoding("utf-8");
    
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	
    	if(id.equals("abc1234")){
    		if(pw.equals("aaa1111")){
    			response.sendRedirect("res_welcome.jsp");
    		} else {
    			response.sendRedirect("res_pw_fail.jsp");
    		}
    	} else {
    			response.sendRedirect("res_id_fail.jsp");
    	}
    %>
