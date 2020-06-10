let socket = null;
function connect() {
	socket = new SockJS("http://172.30.1.15:8080/chat"); // 웹소켓 객체생성
	socket.onopen = onOpen;
	socket.onmessage = onMessage;
	socket.onclose = onClose;
	socket.onerror = onError;
}

function disconnect() {
	socket.close();
}

function onOpen(event) { // 서버에 연결되면 실행
	console.log('Info: connection opened!');
	appendMessage("연결되었습니다.");
}

function onMessage(event) { // 서버에서 메시지를 받으면 실행
	let data = event.data;
	console.log(data + '\n');
	appendMessage(data);
}

function onClose(event) { // 연결이 종료되면 실행
	console.log('Info: connection closed!');
	appendMessage("연결이 종료되었습니다.");
	// setTimeout(function() {connect();}, 1000); //연결이 끊기면 해당 시간마다 다시 연결한다
}

function send() {
	let msg = $('#msg').val();
	socket.send(msg);
	$('#msg').val('');
}

function appendMessage(msg) {
	$('.chatbox').append(
			'<div class="my-bubble bubble"><pre>' + msg + '</pre></div>');
	$('.chatbox').animate({
		scrollTop : $('.chatbox').get(0).scrollHeight
	}, 100);
}

function onError(error) { // 웹소켓 에러 발생
	console.log('error' + error);
}
$(document).ready(function() {
	
$('#sendBtn').click(function() {
	send();
});

$('#exitBtn').click(function() {
	disconnect();
});

//keydown으로 인식할 경우 입력값이 늦게 반영된다.
$('textarea').keyup(function() {
  var text = $('textarea').val();

  // enter입력으로 send 버튼과 동일한 효과 주기 위한 코드
  if(event.key === 'Enter') {
      //shift+enter 입력시 개행의 효과를 주기 위한 코드
      //event.shift의 값은 boolean 형이다.
      if(!event.shiftKey) {
          if(text.length > 1) {
              send();
          } else {
              $('textarea').val('');
          }
      }                
  }
  // 입력값이 없을 때 비활성화된 버튼을 키 입력시 활성화하기 위한 코드
  $('#send').attr('disabled', false);
});
});