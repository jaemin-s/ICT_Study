<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	// 클라이언트 쪽에서 요청과 함께 전송된 쿠키를 가져요는 방법.
    	Cookie[] cookies = request.getCookies();
    	boolean flag = false;
    	if(cookies != null){
	    	for(Cookie c : cookies){
	    		if(c.getName().equals("id_cookie")){
	    			out.print("<h3>아이디 쿠키가 존재합니다!</h3>");
	    			String value = c.getValue();
	    			out.print("쿠키의 값: "+value);
	    			flag = true;
	    			break;
	    		}
	    	}
	    	if(!flag){
	    		out.print("<h3>아이디 쿠키가 사라졌거나 존재하지 않습니다.</h3>");
	    	}
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href="cookie_check_all.jsp">모든 쿠키 확인하기</a>
	
</body>
</html>