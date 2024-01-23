<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:set var="total" value="0" />  

	<%-- 
		<c:set> 태그는 변수의 생성과 동시에, 이미 동일한 이름의 데이터가 존재한다면
		기존의 데이터를 지목해서 값을 변경할 때도 사용합니다.
		마치 setAttribute()에서 이미 존재하는 이름을 지목하여 값을 변경하는 것처럼
	--%>

	<c:forEach var="i" begin="1" end="100">
		<c:set var="total" value="${total+i}" />
	</c:forEach>
	
	<h3>total: ${total}</h3>
	
	<hr>
	<c:forEach var="hang" begin="2" end="9" step="2">
		<c:forEach var="dan" begin="1" end="9">
			${hang} x ${dan} = ${hang*dan} <br>
		</c:forEach>
		<hr>
	</c:forEach>
	
	<hr>

	<h2>배열이나 컬렉션 내부의 값을 출력</h2>
	
	<c:set var="arr" value="<%=new int[] {1,3,5,7,9}%>" />
	
	<c:forEach var="n" items="${arr}">
		${n} &nbsp;
	</c:forEach>
	
	<hr>
	
	<c:set var="list" value='<%=Arrays.asList("가","나","다","라","마","바","사") %>' />
	<c:forEach var="str" items="${list}">
		${str} &nbsp;
	</c:forEach>
</body>
</html>