package goo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminMemberManagement {

	@RequestMapping("/admin_member_management.do")
	public String member_management() {
		return "/admin/member_management/admin_member_management";
	}
	
}
