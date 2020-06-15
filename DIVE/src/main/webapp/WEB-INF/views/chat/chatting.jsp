<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chatting</title>
<link rel="stylesheet" href="/resources/css/chat.css">
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="/resources/js/chat.js"></script>
<script>
	connect();
</script>
</head>
<body>
	<div class="chat-container">
		<div class="chat-header">
			<button id="close" class="header-btn"></button>
			<button id="minimize" class="header-btn"></button>
			<button id="maximize" class="header-btn"></button>

			<img id="profile-pic" src="../../resources/images/person.png"
				width="50" height="50"> <span id="username">프로젝트 가즈아</span> 
		</div>

		<div class="chatbox">
			<!-- User Session Info Hidden -->
			<input type="hidden" value='${userId}' id="sessionUserId">
			<div id="chatMessageArea"></div>
		</div>

		<div class="text-box">
			<textarea id="msg" placeholder="대화내용이 들어갑니다."></textarea>
			<input type="button" id="sendBtn" value="전송" /> <input type="button"
				id="exitBtn" value="나가기" />
			<div class="clearfix"></div>
		</div>
	</div>
</body>
</html>