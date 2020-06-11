<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 변경</title>
<link rel="stylesheet" href="/resources/css/findMyId.css">
<script src="/resources/js/findMyId.js"></script>
</head>
<body>
	<form action="/user/changePassword" method="post">
			ID:
			<input type="text" name="userId" value="${userId}">
			신규 비밀번호:
			<input type="password" name="password" placeholder=" 패스워드를 입력하세요. ">
			<button type="submit" name="submit">변경</button>
			<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
	</form>
</body>
</html>