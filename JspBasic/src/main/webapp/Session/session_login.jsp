<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
    
    	String userId = (String)session.getAttribute("user_id");
    	String userNick = (String)session.getAttribute("user_nick");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%if(userId!=null && userNick!=null) { %>
		<p>이미 로그인 중입니다.</p>
		<a href="session_welcome.jsp">바로가기</a>
	<%} else { %>
	<form action="session_login_con.jsp" method="post">
	    <input type="text" name="id" size="10" placeholder="ID"> <br>
	    <input type="password" name="pw" size="10" placeholder="PW"> <br>
	    <input type="text" name="nick" size="10" placeholder="별명"> <br>
	    <input type="submit" value="로그인">
	</form>
	<%} %>
</body>
</html>