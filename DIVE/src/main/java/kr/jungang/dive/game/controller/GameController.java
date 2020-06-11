package kr.jungang.dive.game.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@AllArgsConstructor
@RequestMapping("/game")
public class GameController {
	@GetMapping("/miniGame")
	public void miniGame() {
		log.info("Hello, MiniGame!");
	}
	
	@GetMapping("/lotto")
	public void lotto() {
		log.info("Hello, Lotto!");
	}
}
