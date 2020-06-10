<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/js/chat.js"></script>
</head>
<body>
	<h1>Chat App</h1>
	<div>
		<a onclick="window.open ( '/chat/chatting', 'name', 'width = 400, height = 569, scrollbars=no, resizable=no, toolbars=no, menubar=no')">
		<input type="button" id="enterBtn" value="입장" /></a>
	</div>
</body>
</html>