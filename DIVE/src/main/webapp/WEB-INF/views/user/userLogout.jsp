<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Member Logout Page</h1>

	<form action="/user/userLogout" method="POST">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div>
			<button>Logout</button>
		</div>
		
	</form>
</body>
</html>