package goo.controller;

import java.io.*;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

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
	
	
	
	@RequestMapping(value="/uploadSummernoteImageFile.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		System.out.println(fileRoot);
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernote/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
}	