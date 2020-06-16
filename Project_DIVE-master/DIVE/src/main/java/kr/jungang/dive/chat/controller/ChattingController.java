package kr.jungang.dive.chat.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/chat/*")
public class ChattingController {

	@GetMapping("/chatting")
	public ModelAndView chatting(ModelAndView mv) {
		
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		mv.setViewName("/chat/chatting");
		mv.addObject("userId", user.getUsername());
		log.debug("Welcome Chat," + user.getUsername() + "!");

		return mv;
	}
}
