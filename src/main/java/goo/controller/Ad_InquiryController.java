package goo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import goo.owner.model.*;
import goo.ad_inquery.model.*;
import goo.ad.model.*;

@Controller
public class Ad_InquiryController {

	@Autowired
	private Ad_inquiryService ad_inquiryService;
	@Autowired
	private OwnerService ownerService;
	@Autowired
	private AdService adService;
	
	/**광고 문의 페이지 이동*/
	@RequestMapping("/ad_inquiry.do")
	public ModelAndView ad_inquiry(HttpSession session) {
		int member_idx = (Integer) session.getAttribute("sessionMember_idx");
		OwnerDTO dto = ownerService.ckOwnerInfo(member_idx);
		ModelAndView mav = new ModelAndView();
		if(dto==null) {
			mav.addObject("msg","옳바른 경로가 아닙니다.");
			mav.addObject("goUrl","mypage.do");
			mav.setViewName("ad/adMsg");
		}else {
			mav.addObject("member_idx",member_idx);
			mav.addObject("owner_idx", dto.getOwner_idx());
			mav.addObject("title",dto.getTitle());
			mav.addObject("business_number", dto.getBusiness_number());
			mav.addObject("email", dto.getEmail());
			mav.setViewName("ad/ad_inquiry");
		}
		return mav;
	}
	
	/**문의 등록 관련 명령어*/
	@RequestMapping("/adInquiry.do")
	public ModelAndView adInquiry(HttpSession session,Ad_inquiryDTO idto) {
		int member_idx = (Integer) session.getAttribute("sessionMember_idx");
		int owner_idx = idto.getOwner_idx();
		String ad_inquiry_state = ad_inquiryService.ckAdInquiry(member_idx);
		AdDTO adto = adService.getAdInfo(owner_idx);
		ModelAndView mav = new ModelAndView();
		String msg = "";
		if(idto.getInquiry_type().equals("광고신청")) {
			if(adto!=null) {
				msg = "이미 광고중입니다.";
				mav.addObject("msg",msg);
				mav.addObject("goUrl","mypage.do");
				mav.setViewName("ad/adMsg");
			}else {
				if(ad_inquiry_state==null||ad_inquiry_state=="") {
					idto.setInquiry_state("대기");
					int result = ad_inquiryService.adInquiry(idto);
					msg = result>0?"문의가 등록되었습니다.":"문의 등록에 실패했습니다.";
					
					mav.addObject("msg",msg);
					mav.addObject("goUrl","mypage.do");
					mav.setViewName("ad/adMsg");
				}else if(ad_inquiry_state.equals("대기")) {
					msg = "이미 등록된 광고 신청 문의가 있습니다.";
					mav.addObject("msg",msg);
					mav.addObject("goUrl","mypage.do");
					mav.setViewName("ad/adMsg");
				}
			}
		}else {
			idto.setInquiry_state("대기");
			int result = ad_inquiryService.adInquiry(idto);
			msg = result>0?"문의가 등록되었습니다.":"문의 등록에 실패했습니다.";
			
			mav.addObject("msg",msg);
			mav.addObject("goUrl","mypage.do");
			mav.setViewName("ad/adMsg");
		}
		return mav;
	}
}
