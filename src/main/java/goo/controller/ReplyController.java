package goo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import goo.reply.model.ReplyDTO;
import goo.reply.model.ReplyServiceImple;

@Controller
public class ReplyController {

	@Autowired
	private ReplyServiceImple replyService;
	
	/**
	@RequestMapping("/replyWrite.do")
	public ModelAndView writeReply(@RequestParam("content") String content,@RequestParam("review_idx") int review_idx, HttpSession session) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		String nickname = (String)session.getAttribute("sessionNickname");
		
		if(nickname==""||nickname==null) {
			mav.addObject("result","fail");
			mav.setViewName("redirect:reviewContent.do?review_idx="+review_idx);
		}else {
			ReplyDTO dto = new ReplyDTO();
			dto.setContent(content);
			dto.setNickname(nickname);
			dto.setReview_idx(review_idx);
			
			int result = replyService.writeReply(dto);
			
			mav.setViewName("redirect:reviewContent.do?review_idx="+review_idx);
		}
		return mav;
	}
	*/
	
	@RequestMapping("/replyWrite.do")
	@ResponseBody
	private int writeReply(@RequestParam("content") String content,@RequestParam("review_idx") int review_idx, HttpSession session) throws Exception{
		
		String nickname = (String)session.getAttribute("sessionNickname");
		int result;
		if(nickname==""||nickname==null) {
			result = 0;
		}else {
			ReplyDTO dto = new ReplyDTO();
			dto.setContent(content);
			dto.setNickname(nickname);
			dto.setReview_idx(review_idx);
	
			result = replyService.writeReply(dto);
		}
		
		return result;
	}
	
	@RequestMapping("/getRelplyList.do")
	@ResponseBody
	private List<ReplyDTO> getReplyList(@RequestParam("review_idx")int review_idx) throws Exception{
		
		List<ReplyDTO> list = replyService.replyList(review_idx);
		
		return list;
	}
	
	@RequestMapping("/delRelply.do")
	@ResponseBody
	private int delReply(@RequestParam("ridx")int ridx) throws Exception{
		
		int result = replyService.replyDel(ridx);
		
		return result;
	}
}
