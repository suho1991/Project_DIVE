package kr.jungang.dive.user.controller;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/user/*")
public class UserController {
	@GetMapping("/mainPage")
	public void mainPage() {
		log.info("Main Page");
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN, 'ROLE_MEMBER')")
	@GetMapping("/memberPage")
	public void memberPage() {
		log.info("Member Page");
	}
	
	@Secured({"ROLE_ADMIN"})
	@GetMapping("/adminPage")
	public void adminPage() {
		log.info("Admin Page");
	}
}
