package goo.controller;




import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import goo.ad_inquery.model.Ad_inquiryService;
import goo.formmail.model.FormmailDTO;
import goo.formmail.model.FormmailService;
import goo.inquiry.model.InquiryDTO;
import goo.inquiry.model.InquiryService;
import goo.map_t.model.Gooppl_mapDTO;
import goo.map_t.model.Gooppl_mapService;
import goo.mapinfo.model.MapInfoDTO;
import goo.mapinfo.model.MapInfoService;
import goo.member.model.MemberService;
import goo.placedetail.model.Gooppl_PlaceDetailService;
import goo.review.model.ReviewDTO;
import goo.review.model.ReviewService;
import goo.payment_info.model.Payment_infoService;
import goo.owner.model.*;

@Controller
public class MainController {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService memberService;
	@Autowired
	private FormmailService formmailService;
	@Autowired
	private Ad_inquiryService ad_inquiryService;
	@Autowired
	private Gooppl_mapService gooppl_mapService;
	@Autowired
	private MapInfoService mapInfoService;
	@Autowired
	private Gooppl_PlaceDetailService gooppl_PlaceDetailService;
	@Autowired
	private Payment_infoService payment_infoService;
	@Autowired
	private OwnerService ownerService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private InquiryService InquiryService;
	
	private static final int EMAIL_AUTH_FORMMAIL_NO = 2;
	private static final int EMAIL_PWD_FIND_FORMMAIL_NO = 3;
	
	@RequestMapping("/mypage.do")
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionMember_idx")==null || session.getAttribute("sessionMember_idx").equals("")) {
			mav.setViewName("redirect:/index.do");
			mav.addObject("open_login", 1);
			return mav;
		}else {
			int member_idx = (Integer) session.getAttribute("sessionMember_idx");
			String ad_inquiry_state = ad_inquiryService.ckAdInquiry(member_idx);
			session.setAttribute("ad_inquiry_state", ad_inquiry_state);
			
			OwnerDTO odto = ownerService.ckOwnerInfo(member_idx);
			
			List<Gooppl_mapDTO> mapDTO = gooppl_mapService.getMap(member_idx);
			int totalPlaceCount[] = new int[mapDTO.size()];
			String firstImg[] = new String[mapDTO.size()];
			List<ReviewDTO> reviewDTO = reviewService.getReview(member_idx);
			               
			for(int i=0;i<mapDTO.size();i++) {
				
				totalPlaceCount[i] = mapInfoService.getTotalPlace(mapDTO.get(i).getMap_idx());
				firstImg[i] = gooppl_PlaceDetailService.getFirstImg(mapDTO.get(i).getMap_idx());
				
			}
			
			List<InquiryDTO> list = InquiryService.inquiryList(member_idx);
			
			mav.addObject("odto", odto);
			mav.addObject("mapDTO",mapDTO);
			mav.addObject("reviewDTO",reviewDTO);
			mav.addObject("totalPlaceCount", totalPlaceCount);
			mav.addObject("firstImg",firstImg);
			mav.addObject("list", list);
			mav.setViewName("member/mypage");
			return mav;
		}
	}
	
	@RequestMapping("/newPwd.do")
	public ModelAndView goupdatePwd(@RequestParam("goo_id")String goo_id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("goo_id",goo_id);
		mav.setViewName("member/newPwd");
		return mav;
	}
	@RequestMapping(value="/pwdChange.do",method=RequestMethod.POST)
	@ResponseBody
	public int pwdChange(@RequestParam("pwd")String pwd,@RequestParam("goo_id")String goo_id) {
		Map hmp = new HashedMap();
		hmp.put("pwd", pwd);
		hmp.put("goo_id",goo_id);
		int result = memberService.pwdChange(hmp);
		return result;
		
	}
	@RequestMapping(value="/pwdFind.do",method=RequestMethod.GET)
	@ResponseBody
	public String pwdFind(String email) {
		int result = memberService.gooidCheck(email);
		if(result>0) {
			FormmailDTO fdto = formmailService.emailTokenFormmail(EMAIL_PWD_FIND_FORMMAIL_NO);
			
			/* 이메일 보내기 */
	        String setFrom = "w12310@naver.com";
	        String toMail = email;
	        String title = fdto.getForm_title();
	        String content = fdto.getForm_content();
	        content = content.replace("{{GOO_ID}}", email);
	                
			
	        
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
			
		}
		return Integer.toString(result);
	}
	
	@RequestMapping(value="/pwdCheck.do",method=RequestMethod.POST)
	@ResponseBody
	public int pwdCheck(String input_pwd_check,HttpSession session) {
		int sessionMember_idx = (Integer) session.getAttribute("sessionMember_idx");
		Map hmp = new HashedMap();
		hmp.put("member_idx", sessionMember_idx);
		hmp.put("input_pwd_check", input_pwd_check);
		int result = memberService.pwdCheck(hmp);
		
		return result;
	}
	@RequestMapping(value="/profileUpdate.do",method=RequestMethod.GET)
	@ResponseBody
	public int profileUpdate(String nickname,HttpSession session)throws Exception {
		
		int member_idx = (Integer) session.getAttribute("sessionMember_idx");
		Map hmp = new HashedMap();
		hmp.put("member_idx", member_idx);
		hmp.put("nickname", nickname);
		int result = memberService.profileUpdate(hmp);
		session.setAttribute("sessionNickname", nickname);
		String pro_nick = nickname.substring(0,1);
		session.setAttribute("profileNick", pro_nick);
		return result;
	}
	
	//email 인증 관련 
	@RequestMapping(value="/mailCheck.do",method=RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email,HttpSession session) throws Exception{
		
		FormmailDTO fdto = formmailService.emailTokenFormmail(EMAIL_AUTH_FORMMAIL_NO);
		System.out.println("이메일 데이터 전송확인");
		System.out.println("인증번호 : " + email);
		String emailToken = RandomStringUtils.randomAlphanumeric(10);
		System.out.println(emailToken);
		
		/* 이메일 보내기 */
        String setFrom = "w12310@naver.com";
        String toMail = email;
        String title = fdto.getForm_title();
        String content = fdto.getForm_content();
        content = content.replace("{{EMAILTOKEN}}", emailToken);
                
		
        
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
        
        return emailToken;
		
	}
	
	@RequestMapping(value="/inquiryWrite.do",method=RequestMethod.GET)
	public ModelAndView inquiryWriteForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionMember_idx") == null || session.getAttribute("sessoinMemeber_idx") == "") {
			mav.addObject("open_login",1);
			mav.setViewName("redirect:/index.do");
			return mav;
		}else {
			mav.setViewName("member/inquiryWrite");
			return mav;
		}
	}
	
	@RequestMapping(value="inquiryWrite.do",method=RequestMethod.POST) 
	@ResponseBody
	public int inquiryWrite(HttpSession session,@RequestParam("inquiry_subject")String inquiry_subject , @RequestParam("inquiry_content")String inquiry_content) {
		int member_idx = (Integer) session.getAttribute("sessionMember_idx");
		Map hmp = new HashMap();
		hmp.put("member_idx", member_idx);
		hmp.put("inquiry_subject", inquiry_subject);
		hmp.put("inquiry_content", inquiry_content);
		int result = InquiryService.addInquiry(hmp);
		return result;
	}
	
}
