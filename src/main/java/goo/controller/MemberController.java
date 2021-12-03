package goo.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import goo.admin.model.AdminService;
import goo.member.model.MemberDTO;
import goo.member.model.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value= "/login.do",method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("dto") MemberDTO dto,HttpSession session) {
		System.out.println("컨트롤러 ok"+dto.getGoo_id());
		ModelAndView mav = new ModelAndView();
		MemberDTO dtos = memberService.loginCheck(dto);
		
		if(dtos==null||(!dtos.getPwd().equals(dto.getPwd()))){
			
			mav.setViewName("redirect:/index.do");
			mav.addObject("login_result", "no");
		}else {
			String pro_nick = dtos.getNickname().substring(0,1);
			session.setAttribute("sessionNickname", dtos.getNickname());
			session.setAttribute("profileNick", pro_nick);
			session.setAttribute("sessionId",dtos.getGoo_id());
			session.setAttribute("sessionMemberType",dtos.getMember_type());
			session.setAttribute("sessionJoinType","goo");
			mav.addObject("login_result", "yes");
			mav.setViewName("redirect:/index.do");
		}
		return mav;
	}
	@RequestMapping(value="/idCheck.do",method=RequestMethod.GET,produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(String email) throws Exception{
		int result = memberService.gooidCheck(email);
		System.out.println(email);
		System.out.println(result);
		return Integer.toString(result);
	}
	
	@RequestMapping(value="/join.do",method=RequestMethod.POST)
	public ModelAndView join(@ModelAttribute("dto") MemberDTO dto,HttpSession session) {
		System.out.println("컨트롤러 ok"+dto.getGoo_id());
		ModelAndView mav = new ModelAndView();
		int result = memberService.gooJoin(dto);
		if(result>0) {
			String pro_nick = dto.getNickname().substring(0,1);
			session.setAttribute("sessionNickname", dto.getNickname());
			session.setAttribute("profileNick", pro_nick);
			session.setAttribute("sessionId",dto.getGoo_id());
			session.setAttribute("sessionMemberType",dto.getMember_type());
			session.setAttribute("sessionJoinType","goo");
			mav.addObject("join_result","ok");
			mav.setViewName("redirect:/index.do");
		}
		return mav;
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/index.do");
		return mav;
	}
	
	
	
}

