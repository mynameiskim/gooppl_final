package goo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import goo.review.model.ReviewDTO;
import goo.review.model.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;

	@RequestMapping("/comunity.do")
	public ModelAndView showComunity() {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/comunity");
		return mav;
	}
	/** 리뷰게시판 목록 */
	@RequestMapping("/reivew.do")
	public ModelAndView reivewList(
			@RequestParam(value="cp",defaultValue = "1" )int cp) {
		int listSize=4;
		int pageSize=4;
		int totalCnt=reviewService.getTotalCnt();
		List<ReviewDTO> list = reviewService.reviewList(cp,listSize);
		String pageStr=goo.page.PageModule.makePage("review.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr",pageStr);
		mav.setViewName("review/review_list");
		return mav;
	}
	
	
	@RequestMapping(value = "/reviewWrite.do", method = RequestMethod.GET)
	public String reviewWriteForm() {
		return "review/review_writeform";
	}
	/** 리뷰 등록 */
	@RequestMapping(value = "/writeReviewSubmit.do" , method = RequestMethod.POST)
	public ModelAndView reviewWriteSubmit(ReviewDTO dto) {
		int result = reviewService.writeReview(dto);
		String msg = result>0?"등록 하였습니다.":"등록에 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("review/reviewMsg");
		return mav;
	}
	
	
	
	
	
}
