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
	
	
	/** 리뷰 본문 보기 */
	@RequestMapping("/reviewContent.do")
	public ModelAndView reviewContent(@RequestParam(value = "review_idx", defaultValue = "0") int review_idx) {
		ReviewDTO dto = reviewService.reviewContent(review_idx);
		ModelAndView mav=new ModelAndView();
		if (dto == null) {
			mav.addObject("msg","잘못된접근 또는 삭제된 게시글입니다.");
			mav.setViewName("review/reviewMsg");
		} else {
			mav.addObject("dto",dto);
			mav.setViewName("review/review_content");
		}
		return mav;
	}
	/** 리뷰 삭제 */
	@RequestMapping("/reviewDelete.do")
	public ModelAndView reviewDelete(@RequestParam(value="review_idx")int review_idx) {
		int result = reviewService.delReview(review_idx);
		String msg = result>0?"삭제 하였습니다.":"삭제를 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("review/reviewMsg");
		return mav;
	}
	
	
}
