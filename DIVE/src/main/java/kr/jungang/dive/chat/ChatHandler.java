package kr.jungang.dive.chat;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class ChatHandler extends TextWebSocketHandler {
	//모든 세션 저장
	private static List<WebSocketSession> sessionList = new ArrayList<>();
	
	//클라이언트 접속시 실행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		log.info("{} 연결", session.getId());
		System.out.println("afterConnectionEstablished: " + session);
	}

	//메시지를 보냈을 때 실행되는 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String name = session.getPrincipal().getName();
		String msg = message.getPayload();
		log.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		//전송된 메시지 List를 모든 세션에 전송(브로드 캐스팅)
		for(WebSocketSession webSocketSession : sessionList) {
			webSocketSession.sendMessage(new TextMessage( name + "|" + msg));
		}
		System.out.println("handleTextMessage: " + session + ":" + message);
	}

	//클라이언트 접속이 해제되었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		log.info("{} 연결끊김", session.getId());
		System.out.println("afterConnectionClosed: " + session + ":" + status);
	}
	
}
