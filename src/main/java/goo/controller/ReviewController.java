package goo.controller;

import java.io.*;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;

import goo.review.model.ReviewDTO;
import goo.review.model.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;

	@RequestMapping("/community.do")
	public ModelAndView showComunity(
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionMember_idx")==null||session.getAttribute("sessionMember_idx").equals("")) {
			mav.addObject("open_login", 1);
			mav.setViewName("redirect:/index.do");
			return mav;
		}else {
			mav.setViewName("review/community");
			return mav;
		}
	}
	/** 리뷰게시판 목록 */
	@RequestMapping("/review.do")
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
	public ModelAndView reviewDelete(@RequestParam("review_idx")int review_idx) {
		System.out.println("진입성공");
		int result = reviewService.delReview(review_idx);
		String msg = result>0?"삭제 하였습니다.":"삭제를 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("review/reviewMsg");
		return mav;
	}

	/**	리뷰수정 */
	@RequestMapping("/reviewUpdateForm.do")
	public ModelAndView reviewUpdateForm(@RequestParam(value = "review_idx", defaultValue = "0") int review_idx) {
		ReviewDTO dto = reviewService.reviewContent(review_idx);
		ModelAndView mav=new ModelAndView();
		if (dto == null) {
			mav.addObject("msg","잘못된접근 또는 삭제된 게시글입니다.");
			mav.setViewName("review/reviewMsg");
		} else {
			mav.addObject("dto",dto);
			mav.setViewName("review/review_updateform");
		}
		return mav;
	}
	
	@RequestMapping("/reviewUpdate.do")
	public ModelAndView reviewUpdate(ReviewDTO dto,@RequestParam("review_idx")int review_idx) {
		int result = reviewService.updateReview(dto);
		String msg = result>0?"수정 완료하였습니다.":"수정 실패하였습니다.";
		ModelAndView mav=new  ModelAndView();
		mav.addObject("msg", msg);
		
		
		mav.setViewName("review/reviewMsg");
		return mav;
	}
	
	
	@RequestMapping("/uploadSummernoteImageFile.do")
	@ResponseBody
	public void summer_image(MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("컨트롤러 진입~~!!");
		int review_idx=reviewService.getMaxReview()+1;
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String file_name = file.getOriginalFilename();
		System.out.println("file_name="+file.getOriginalFilename());
		String server_file_name = fileDBName(file_name, review_idx);
		System.out.println("server file : " + server_file_name);
		file.transferTo(new File(review_idx + server_file_name));
		out.println("resources/upload"+server_file_name);
		out.close();
	}
    private String fileDBName(String fileName, int review_idx) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		int date = c.get(Calendar.DATE);

		String homedir = review_idx + year + "-" + month + "-" + date;
		System.out.println(homedir);
		File path1 = new File(homedir);
		if (!(path1.exists())) {
			path1.mkdir();
		}
		Random r = new Random();
		int random = r.nextInt(100000000);

		int index = fileName.lastIndexOf(".");

		String fileExtension = fileName.substring(index + 1);
		System.out.println("fileExtension = " + fileExtension);

		String refileName = "bbs" + year + month + date + random + "." + fileExtension;
		System.out.println("refileName = " + refileName);

		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		System.out.println("fileDBName = " + fileDBName);

		return fileDBName;
	}
	
	
}	