package goo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminStatistics {
	
	@RequestMapping("/admin_statistics.do")
	public String statistics() {
		return "/admin/statistics/admin_statistics";
	}
}
