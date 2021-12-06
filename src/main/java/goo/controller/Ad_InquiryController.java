package goo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import goo.owner.model.*;
import goo.ad_inquery.model.*;

@Controller
public class Ad_InquiryController {

	@Autowired
	private Ad_inquiryService ad_inquiryService;
	@Autowired
	private OwnerService ownerService;
	
	/**광고 문의 페이지 이동*/
	@RequestMapping("/ad_inquiry.do")
	public ModelAndView ad_inquiry(@RequestParam("member_idx")int member_idx,
			@RequestParam(value = "inquiry_type", defaultValue="광고신청")String inquiry_type) {
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
	public ModelAndView adInquiry(Ad_inquiryDTO dto) {
		System.out.println("광고문의등록 진입");
		dto.setInquiry_state("대기");
		int result = ad_inquiryService.adInquiry(dto);
		String msg = result>0?"문의가 등록되었습니다.":"문의 등록에 실패했습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("goUrl","mypage.do");
		mav.setViewName("ad/adMsg");
		return mav;
	}
}
