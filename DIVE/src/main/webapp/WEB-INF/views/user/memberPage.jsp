<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>MEMBER</h1>
	<p>
	안녕하세요 <sec:authentication property="principal.user.id" /> 고객님!
	</p>
	<sec:authorize access="isAnonymous()">
		<a href="/user/userLogin">Login</a>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<a href="/user/userLogout">Logout</a>
	</sec:authorize>
</body>
</html>