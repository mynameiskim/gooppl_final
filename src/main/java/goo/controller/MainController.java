package goo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "member/mypage";
	}
}
