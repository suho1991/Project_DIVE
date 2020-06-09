package kr.jungang.dive.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
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
	//@Setter(onMethod_ = @Autowired)
	//private JavaMailSender mailSender;

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
		return "redirect:/user/userLogin";
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
		return "redirect:/user/myPage";
	}

	@GetMapping("/findMyId")
	public void findMyId() {
		log.info("아이디 찾기");
	}

	@PostMapping("/findMyId")
	public void findMyId(UserDTO userDTO, Model model) {
		model.addAttribute("user", userService.findMyId(userDTO.getName(), userDTO.getEmail()));
	}
/*
	@GetMapping("/changePassword")
	public void changePassword() {
		log.info("패스워드 변경");
	}

	// 이메일 인증 페이지 맵핑 메소드
	@GetMapping("/certifyEmail")
	public void certifyEmail() {
		log.info("인증번호 확인");
	}
	
	//이메일 보내기
	@GetMapping("/sendEmail")
	public void sendEmail() {
		log.info("인증메일 전송");
	}

	// mailSending 코드
	@RequestMapping(value = "/user/sendEmail", method = RequestMethod.POST)
	public ModelAndView mailSending(HttpServletRequest request, String email, HttpServletResponse response_email)
			throws IOException {

		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)

		String setfrom = "admin@dive.com";
		String tomail = request.getParameter("email"); // 받는 사람 이메일
		String title = "회원가입 인증 이메일 입니다."; // 제목
		String content =

				System.getProperty("line.separator") + // 한줄씩 줄간격을 두기위해 작성

				System.getProperty("line.separator") +

				"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다" +

				System.getProperty("line.separator") +

				System.getProperty("line.separator") +

				" 인증번호는 " + dice + " 입니다. " +

				System.getProperty("line.separator") +

				System.getProperty("line.separator") +

				"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		ModelAndView mv = new ModelAndView(); // ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
		mv.setViewName("/user/certifyEmail"); // 뷰의이름
		mv.addObject("dice", dice);

		System.out.println("mv : " + mv);

		response_email.setContentType("text/html; charset=UTF-8");
		PrintWriter out_email = response_email.getWriter();
		out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		out_email.flush();

		return mv;

	}

	// 이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
	// 내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
	// 틀리면 다시 원래 페이지로 돌아오는 메소드
	@RequestMapping(value = "/user/certifyEmail{dice}", method = RequestMethod.POST)
	public ModelAndView certifyEmail(String certifyEmail, @PathVariable String dice,
			HttpServletResponse response_equals) throws IOException {

		System.out.println("마지막 : certifyEmail : " + certifyEmail);

		System.out.println("마지막 : dice : " + dice);

		// 페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음

		ModelAndView mv = new ModelAndView();

		mv.setViewName("/user/certifyEmail");

		mv.addObject("e_mail", certifyEmail);

		if (certifyEmail.equals(dice)) {

			// 인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함

			mv.setViewName("/user/changePassword");

			mv.addObject("e_mail", certifyEmail);

			// 만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
			// 한번더 입력할 필요가 없게 한다.

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하였습니다. 패스워드 변경 페이지로 이동합니다.');</script>");
			out_equals.flush();

			return mv;

		} else if (certifyEmail != dice) {

			ModelAndView mv2 = new ModelAndView();

			mv2.setViewName("/user/certifyEmail");

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
			out_equals.flush();

			return mv2;
		}
		return mv;
	}
*/
}
