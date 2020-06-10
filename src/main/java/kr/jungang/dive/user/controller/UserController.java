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

	@Secured({ "ROLE_ADMIN" })
	@GetMapping("/adminPage")
	public String getAllMember(Model model) {
		log.info("Admin Page");
		model.addAttribute("member", userService.getAllMember());
		return "user/adminPage";
	}
	
	@PostMapping("/adminPage")
	public String updateMemberStatus(UserDTO memberStatus) {
		userService.updateMemberStatus(memberStatus);
		log.info(memberStatus);
		return "redirect:/user/adminPage";
	}

	@GetMapping("/signUp")
	public void signUpPage() {
		log.info("SignUp Page");
	}

	@PostMapping("/signUp")
	public String createUser(UserDTO createUser, RedirectAttributes rttr) {
		createUser.setPassword(pwEncoder.encode(createUser.getPassword()));
		userService.createUser(createUser);
		rttr.addFlashAttribute("result", createUser.getUserId());
		return "redirect:/";
	}

	@PreAuthorize("isAuthenticated()") // 인증 된 상태일 때 연결해 줄 것
	@GetMapping("/findById")
	public String findById(@RequestParam("userId") String userId, Model model) {
		model.addAttribute("user", userService.findById(userId));
		return "user/myPage";
	}

	@PreAuthorize("isAuthenticated()") // 인증 된 상태일 때 연결해 줄 것
	@GetMapping("/updateUser")
	public void updateUser(@RequestParam("userId") String userId, Model model) {
		model.addAttribute("user", userService.findById(userId));
	}

	@PostMapping("/updateUser")
	public String updateUser(UserDTO updateUser, RedirectAttributes rttr) {
		userService.updateUser(updateUser);
		rttr.addFlashAttribute("result", updateUser.getUserId());
		return "redirect:/";
	}
	
	
	
}
