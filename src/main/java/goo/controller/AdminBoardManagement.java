package goo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminBoardManagement {
	
	@RequestMapping("/admin_board_management.do")
	public String board_management() {
		return "/admin/board_management/admin_board_management";
	}
	
}
