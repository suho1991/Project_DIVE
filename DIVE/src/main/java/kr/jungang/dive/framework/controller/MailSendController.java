package kr.jungang.dive.framework.controller;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MailSendController {
	
	@Autowired
	private JavaMailSender mailSender;

	@ResponseBody
	@RequestMapping(value="/mail/sendEmail")
	public String sendMail() {
		try {
			//메일 내용 설정
			//파일 첨부 또는 HTML로 구성된 경우 MimeMessage를 사용함
			MimeMessage message = mailSender.createMimeMessage();
			//파일 첨부 시 헬퍼 사용
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			
			//메일 제목 설정
			messageHelper.setSubject("[DIVE]에서 보내는 안내 메일입니다.");
			
			//메일 내용
			String htmlStr = "<h1>가입을 축하합니다!<br />당신의 보물을 찾아보세요.</h1>";
			
			//내용 설정(subType(="HTML")을 설정해 주지않으면 HTML로 인식하지 않아서 태그들까지 전송됨)
			messageHelper.setText(htmlStr, true);
			
			//받는사람 설정
			//new InternetAddress 사용하면 메일주소가 아닌 사용자 이름으로 보낼 수 있음
			messageHelper.setTo(new InternetAddress("parkminjun0314@gmail.com", "박민준 고객님", "UTF-8"));
			
			//파일 객체 생성(절대경로(absolute root))
			DataSource dataSource = new FileDataSource("/resources/images/dive.png");
			messageHelper.addAttachment(MimeUtility.encodeText("dive", "UTF-8", "B"), dataSource);
			
			mailSender.send(message);
		} catch (MessagingException e) {
	        e.printStackTrace();
	    } catch (UnsupportedEncodingException e) {
	        e.printStackTrace();
	    }
		return "send OK";
	}
	
}
