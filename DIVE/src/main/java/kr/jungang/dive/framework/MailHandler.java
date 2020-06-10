package kr.jungang.dive.framework;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler {
	private JavaMailSender mailSender;
    private MimeMessage message; //메일 내용 설정, 파일 첨부 또는 HTML로 구성된 경우 MimeMessage를 사용함
    private MimeMessageHelper messageHelper; //파일 첨부 시 헬퍼 사용
    
    public MailHandler(JavaMailSender mailSender) throws MessagingException {
        this.mailSender = mailSender;
        message = this.mailSender.createMimeMessage();
        messageHelper = new MimeMessageHelper(message, true, "UTF-8");
    }

    //이메일 타이틀 
    public void setSubject(String subject) throws MessagingException {
        messageHelper.setSubject(subject);
    }
    
    //이메일 TEXT 부분 
    public void setText(String htmlContent) throws MessagingException {
        messageHelper.setText(htmlContent, true);
    }
    
    //보내는 사람 이메일 
    public void setFrom(String email, String name) throws UnsupportedEncodingException, MessagingException {
        messageHelper.setFrom(email, name);
    }
    //받는 사람 이메일, new InternetAddress 사용하면 메일주소가 아닌 사용자 이름으로 보낼 수 있음
    public void setTo(String email) throws MessagingException, UnsupportedEncodingException {
        messageHelper.setTo(new InternetAddress(email, "NAME", "UTF-8"));
    }
    
    //파일
    public void addInline(String contentId, DataSource dataSource) throws MessagingException {
        messageHelper.addInline(contentId, dataSource);
    }
    
    public void send() {
        try {
            mailSender.send(message);
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
