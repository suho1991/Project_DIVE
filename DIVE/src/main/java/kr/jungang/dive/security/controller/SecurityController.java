package kr.jungang.dive.security.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class SecurityController {
	
	@GetMapping("/user/userLogin")
	public void userLogin(String error, String logout, Model model) {
		log.info("Login Page!");
		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if(error != null) {
			model.addAttribute("error", "error");
		}
		if(logout != null) {
			model.addAttribute("logout", "logout");
		}
	}
	
	@GetMapping("/user/accessError")
	public void accessDenied(Authentication authentication, Model model) {
		log.info("Error");

		model.addAttribute("msg", "Access Denied!");
	}
	
}
