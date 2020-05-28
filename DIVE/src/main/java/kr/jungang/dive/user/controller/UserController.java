package kr.jungang.dive.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.jungang.dive.user.domain.UserDTO;
import kr.jungang.dive.user.service.UserService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@AllArgsConstructor
@RequestMapping("/user/*")
public class UserController {
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwEncoder;
	@Setter(onMethod_ = @Autowired)
	private UserService userService;

	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
	@GetMapping("/memberPage")
	public void memberPage() {
		log.info("Member Page");
	}

	@Secured({ "ROLE_ADMIN" })
	@GetMapping("/adminPage")
	public void adminPage() {
		log.info("Admin Page");
	}

	@GetMapping("/signUp")
	public void signUpPage() {
		log.info("SignUp Page");
	}

	@PostMapping("/signUp")
	public String createUser(UserDTO createUser, RedirectAttributes rttr) {
		createUser.setPassword(pwEncoder.encode(createUser.getPassword()));
		userService.createUser(createUser);
		rttr.addFlashAttribute("result", createUser.getId());
		return "redirect:/";
	}

	@GetMapping("/findById")
	public String findById(@RequestParam("id") String id, Model model) {
		model.addAttribute("user", userService.findById(id));
		return "user/myPage";
	}

	@GetMapping("/updateUser")
	public void updateUser(@RequestParam("id") String id, Model model) {
		model.addAttribute("user", userService.findById(id));
	}
	
	@PostMapping("/updateUser")
	public String updateUser(UserDTO updateUser, RedirectAttributes rttr) {
		updateUser.setPassword(pwEncoder.encode(updateUser.getPassword()));
		userService.updateUser(updateUser);
		rttr.addFlashAttribute("result", updateUser.getId());
		return "redirect:/user/mypage";
	}
}
