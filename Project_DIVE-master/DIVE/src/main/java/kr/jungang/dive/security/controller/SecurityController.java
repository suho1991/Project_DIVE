package kr.jungang.dive.security.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class SecurityController {
	
	@GetMapping("/user/userLogin")
	public void userLogin(String error, String logout, Model model) {
		log.info("error" + error);
		log.info("logOut" + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account..");
		}
		if(logout != null) {
			model.addAttribute("logout", "Bye!");
		}
	}
	
	@GetMapping("/user/accessError")
	public void accessDenied(Authentication authentication, Model model) {
		model.addAttribute("msg", "Access Denied!");
		log.info("Error");
	}
	
	@GetMapping("/user/userLogout")
	public void userLogout() {
		log.info("Logout!");
	}
}
