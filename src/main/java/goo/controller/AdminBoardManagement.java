package goo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import goo.admin.model.AdminService;
import goo.inquiry.model.InquiryDTO;
import goo.inquiry.model.InquiryService;
import goo.member.model.MemberDTO;
import goo.owner.model.OwnerDTO;
import goo.review.model.ReviewDTO;

@Controller
public class AdminBoardManagement {
	
	@Autowired
	AdminService adminService;
	@Autowired
	InquiryService inquiryService;
	
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
	
	
	/*@@@@@@@@@문의 관리@@@@@@@@@*/
	@RequestMapping("/admin_inquiry.do")
	public ModelAndView admin_inquiryList(@RequestParam(value = "cp",defaultValue = "1")int cp){
		ModelAndView mav = new ModelAndView();
		
		int totalInquiry = inquiryService.totalInquiry();
		int listSize=10;
		int pageSize=10;
		Map map = new HashMap(); 
		map.put("cp", cp);
		map.put("listSize", listSize);
		List<InquiryDTO> inquiryDTO = inquiryService.getInquiryList(map);
		String pageStr=goo.page.PageModule.makePage("admin_inquiry.do",totalInquiry , listSize, pageSize, cp);
		mav.addObject("cp", cp);
		mav.addObject("size", inquiryDTO.size());
		mav.addObject("listSize", listSize);
		mav.addObject("list", inquiryDTO);
		mav.addObject("pageStr", pageStr);
		mav.addObject("totalInquiry", totalInquiry);
		mav.setViewName("admin/board_management/admin_inquiry");
		return mav;
	}
	
	/**문의 답변*/
	@RequestMapping("/admin_inquiry_details.do")
	public ModelAndView admin_inquiry_details(@RequestParam(("inquiry_idx")) int inquiry_idx) {
		InquiryDTO dto = inquiryService.inquiryInfo(inquiry_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("admin/board_management/admin_inquiry_details");
		return mav;
	}
	
	@RequestMapping("/admin_inquiry_update.do")
	@ResponseBody
	public int admin_inquiry_update(String inquiry_answer,int inquiry_idx) {
		Map map = new HashMap();
		map.put("inquiry_answer", inquiry_answer);
		map.put("inquiry_idx", inquiry_idx);
		int result = inquiryService.inquiryUpdate(map);
		
		return result;
	}
}
