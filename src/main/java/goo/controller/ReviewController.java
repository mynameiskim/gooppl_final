package goo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {

	@RequestMapping("/reivew.do")
	public ModelAndView reivewList() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/review_list");
		return mav;
	}
	
	@RequestMapping("/comunity.do")
	public ModelAndView showComunity() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/comunity");
		return mav;
	}
	
	@RequestMapping("/reviewWrite.do")
	public String reviewWriteForm() {
		return "review/review_writeform";
	}
}
