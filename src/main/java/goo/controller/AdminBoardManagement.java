package goo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import goo.admin.model.AdminService;
import goo.member.model.MemberDTO;
import goo.review.model.ReviewDTO;

@Controller
public class AdminBoardManagement {
	
	@Autowired
	AdminService adminService;
	
	
	@RequestMapping("/admin_board_management.do")
	public String board_management() {
		return "/admin/board_management/admin_board_management";
	}
	
	
	@RequestMapping("/admin_review.do")
	public ModelAndView admin_review(@RequestParam(value = "cp",defaultValue = "1")int cp,@RequestParam(value = "search_type",defaultValue = "")String search_type
			,@RequestParam(value = "search",defaultValue = "")String search,@RequestParam(value = "start_date",defaultValue = "")String start_date
			,@RequestParam(value = "end_date",defaultValue = "")String end_date) {
		if(!start_date.equals("")&&end_date.equals("")) {
			end_date = start_date;
		}else if(!end_date.equals("")&&start_date.equals("")) {
			start_date = end_date;
		}
		int listSize=5;
		int pageSize=5;
		int totalReview = adminService.adminReviewTotal();

		ModelAndView mav = new ModelAndView();

		List<ReviewDTO> list = adminService.adminReview(cp,listSize);
		String pageStr=goo.page.PageModule.makePage("admin_review.do", totalReview, listSize, pageSize, cp);
		mav.addObject("size", list.size());
		mav.addObject("cp", cp);
		mav.addObject("listSize", listSize);
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.addObject("totalReview", totalReview);
		mav.setViewName("admin/board_management/admin_review");
		
		return mav;
	}
}
