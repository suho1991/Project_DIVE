<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>Member Login Page</h1>
	<h3>
		<c:out value="${error}"></c:out>
	</h3>
	<h3>
		<c:out value="${logout}"></c:out>
	</h3>

	<form action="/login" method="POST">
		<div>
			<input type="text" name="username" value="member" />	
		</div>
		<div>
			<input type="password" name="password" value="member" />	
		</div>
		<div>
			<input type="submit" value="Login">
		</div>
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</body>
</html>