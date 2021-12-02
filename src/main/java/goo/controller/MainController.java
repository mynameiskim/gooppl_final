package goo.controller;



import java.util.logging.Logger;

import javax.mail.internet.MimeMessage;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MainController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "member/mypage";
	}
	
	//email 인증 관련 
	@RequestMapping(value="/mailCheck.do",method=RequestMethod.GET)
	@ResponseBody
	public void mailCheckGET(String email) throws Exception{
		
		System.out.println("이메일 데이터 전송확인");
		System.out.println("인증번호 : " + email);
		
		String emailToken = RandomStringUtils.randomAlphanumeric(10);
		System.out.println(emailToken);
		
		/* 이메일 보내기 */
        String setFrom = "w12310@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "GooPPl을 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 <strong>" + emailToken + "</strong>입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
		
	}
	
}
