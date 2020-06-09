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
	<form action="/user/sendEmail" method="post">
			이메일 :
			<input type="email" name="email" placeholder="  이메일주소를 입력하세요. ">
			<button type="submit" name="submit">이메일 인증받기 (이메일 보내기)</button>
	</form>
</body>
</html>