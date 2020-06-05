package kr.jungang.dive.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/chat/*")
public class ChattingController {
	
	@GetMapping("/intro")
	public void intro() {
		log.debug("Welcome Chat!");
	}
	
	@GetMapping("/chatting")
	public void chatting() {
		log.debug("Welcome Chat!");
	}
}
