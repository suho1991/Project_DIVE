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
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	let socket = null;
	function connect() {
		let ws = new WebSocket("ws://localhost:8080/chat/websocket"); //웹소켓 객체생성
		socket = ws;

		//웹소켓 연결
		ws.onopen = function() {
			console.log('Info: connection opened!');
		};

		//메시지 전송
		ws.onmessage = function(event) {
			console.log(event.data + '\n');
		};

		//웹소켓 연결 끊음
		ws.onclose = function(event) {
			console.log('Info: connection closed!');
			//setTimeout(function() {connect();}, 1000); //연결이 끊기면 해당 시간마다 다시 연결한다
		};

		//웹소켓 에러 발생
		ws.onerror = function(error) {
			console.log('error' + error);
		};

	}
</script>
<script>
	$(document).ready(function() {
		$('#btnSend').on('click', function(event) {
			event.preventDefault();
			if (socket.readyState !== 1) {
				return;
			}

			let msg = $('#msg').val();
			console.log(msg);
			socket.send(msg);
		});
		
		connect();
	});
</script>
</head>
<body>
	<h1>Chat App</h1>
	<div>
		<input type="text" id="msg" placeholder="메시지를 입력하세요." />
		<button id="btnSend">Send Message</button>
	</div>
</body>
</html>