package goo.controller;

import java.time.LocalDate;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import goo.admin.model.AdminService;
import goo.formmail.model.FormmailDTO;
import goo.formmail.model.FormmailService;
import goo.member.model.MemberDTO;
import goo.member.model.MemberService;
import goo.memberout.model.MemberOutService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
    private AdminService adminService;
	@Autowired
	private FormmailService formmailService;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired 
	private MemberOutService memberOutService;
	
	private static final int EMAIL_JOIN_FORMMAIL_NO = 1;

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
	          session.setAttribute("sessionMember_idx", dtos.getMember_idx());
	          String member_type = dtos.getMember_type();
	          if(member_type.equals("A")) {
	             LocalDate now = LocalDate.now();
	             session.setAttribute("now", now);
	             adminService.loginRecode(dtos.getMember_idx());
	             
	             mav.setViewName("redirect:/admin_basic_settings.do");
	          }else {
	             session.setAttribute("sessionJoinType","goo");
	             mav.addObject("login_result", "yes");
	             mav.setViewName("redirect:/index.do");
	       
	          }
	      }
	      return mav;
	   }
	@RequestMapping(value="/idCheck.do",method=RequestMethod.GET,produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(String email) throws Exception{
		int result = memberService.gooidCheck(email);
		return Integer.toString(result);
	}
	
	@RequestMapping(value="/join.do",method=RequestMethod.POST)
	public ModelAndView join(@ModelAttribute("dto") MemberDTO dto,HttpSession session) {
		System.out.println("컨트롤러 ok"+dto.getGoo_id());
		ModelAndView mav = new ModelAndView();
		int result = memberService.gooJoin(dto);
		MemberDTO dtos = memberService.getMemberInfo(dto.getGoo_id());
		
		if(result>0) {
			String pro_nick = dtos.getNickname().substring(0,1);
			session.setAttribute("sessionNickname", dtos.getNickname());
			session.setAttribute("profileNick", pro_nick);
			session.setAttribute("sessionId",dtos.getGoo_id());
			session.setAttribute("sessionMemberType",dtos.getMember_type());
			session.setAttribute("sessionMember_idx", dtos.getMember_idx());
			session.setAttribute("sessionJoinType","goo");
			
			FormmailDTO fdto = formmailService.emailTokenFormmail(EMAIL_JOIN_FORMMAIL_NO);
			/* 이메일 보내기 */
	        String setFrom = "w12310@naver.com";
	        String toMail = dto.getGoo_id();
	        String title = fdto.getForm_title();
	        String content = fdto.getForm_content();
	        title = title.replace("{{NICKNAME}}", dto.getNickname());
	        content = content.replace("{{NICKNAME}}", dto.getNickname());
	        
	        try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
			
			mav.addObject("join_result","ok");
			mav.setViewName("redirect:/index.do");
		}
		return mav;
	}
	
	@RequestMapping(value="/memberOut.do",method = RequestMethod.GET)
	public String goMemberOutPage() {
		return "member/memberOut";
	}
	
	@RequestMapping(value="/memberOut.do",method=RequestMethod.POST)
	@ResponseBody
	public int memberOut(String pwd,String out_reason,HttpSession session) {
		int member_idx = (Integer) session.getAttribute("sessionMember_idx");
		String goo_id = (String) session.getAttribute("sessionId");
		Map hmp = new HashedMap();
		hmp.put("member_idx", member_idx);
		hmp.put("input_pwd_check", pwd);
		hmp.put("goo_id", goo_id); 
		hmp.put("out_reason", out_reason);
		int pwdCheck_result = memberService.pwdCheck(hmp);
		
		if(pwdCheck_result>0) {
			memberService.memberOut(member_idx);
			memberOutService.insertMemberOut(hmp);
			session.invalidate();
			return pwdCheck_result;
		}else{
			return pwdCheck_result;
		}
		
	}
	
	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/index.do");
		return mav;
	}
	
}

