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
<title>아이디 찾기</title>
<link rel="stylesheet" href="/resources/css/findMyId.css">
<script src="/resources/js/findMyId.js"></script>
</head>
<body>
	<form action="/mail/certifyEmail" method="post">
		ID: <input type="text" name="userId" value="${userId}"> 인증번호
		입력 : <input type="number" name="certifyDice"
			placeholder="  인증번호를 입력하세요. "> <input type="hidden"
			name="dice" value="${dice}">
		<button type="submit" name="submit">인증번호 전송</button>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
</body>
</html>