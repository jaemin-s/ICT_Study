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

	<c:set var="age" value="${param.age}"/>
	
	# 이름: ${param.name} <br>
	# 나이: ${age} <br>
	
	<c:choose>
		<c:when test="${age >= 20}">
			<c:choose>
				<c:when test="${age>=40}">
					<h3>당신은 장년층입니다.</h3>
				</c:when>
				<c:otherwise>
					<h3>당신은 청년입니다.</h3>
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:when test="${age>=17}">
			<h2>당신은 고등학생입니다.</h2>
		</c:when>
		<c:when test="${age>=14}">
			<h2>당신은 중학생입니다.</h2>
		</c:when>
		<c:when test="${age>=8}">
			<h2>당신은 초등학생입니다</h2>
		</c:when>
		<c:otherwise>
			<h2>당신은 미취학 아동입니다.</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>