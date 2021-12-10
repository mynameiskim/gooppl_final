package goo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import goo.owner.model.*;
import goo.payment_info.model.*;
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
	@Autowired
	private Payment_infoService payment_infoService;
	
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
	@ResponseBody
	public Map<String, Object> adInquiry(HttpSession session,Ad_inquiryDTO idto) {
		Map<String, Object> map = new HashMap<String, Object>();
		int code=0;
		int member_idx = (Integer) session.getAttribute("sessionMember_idx");
		int owner_idx = idto.getOwner_idx();
		String ad_inquiry_state = ad_inquiryService.ckAdInquiry(member_idx);
		String refund_inquiry_state = ad_inquiryService.ckCancelInquiry(member_idx);
		AdDTO adto = adService.getAdInfo(owner_idx);
		if(idto.getInquiry_type().equals("광고신청")) {
			if(adto!=null) {
				map.put("msg", "이미 광고가 올라간 상태입니다.");
				code = 0;
			}else {
				if(ad_inquiry_state==null||ad_inquiry_state=="") {
					
					idto.setInquiry_state("대기");
					int result = ad_inquiryService.adInquiry(idto);
					if(result>0) {
						map.put("msg", "문의가 등록되었습니다.");
						code = 1;
					}else {
						map.put("msg", "ERROR");
						code = 2;
					}
				}else if(ad_inquiry_state.equals("대기")) {
					map.put("msg", "이미 등록된 광고 신청 문의가 있습니다.");
					code = 0;
				}else if(ad_inquiry_state.equals("광고승인")) {
					map.put("msg", "이미 승인된 광고입니다. 결제를 완료해주세요");
					code = 0;
				}
			}
		}else {
			Payment_infoDTO pdto = payment_infoService.admin_getPayInfo(owner_idx);
			if(pdto==null) {
				map.put("msg", "환불할 결제 내역이 없습니다.");
				code = 0;
			}else if((pdto.getStatus()).equals("cancelled")){
				map.put("msg", "이미 환불된 결제입니다.");
				code = 0;
			}else if((pdto.getStatus()).equals("paid")){
				if(refund_inquiry_state.equals("대기")) {
					map.put("msg", "이미 등록된 광고 취소 문의가 있습니다.");
					code = 0;
				}else {
					idto.setInquiry_state("대기");
					int result = ad_inquiryService.adInquiry(idto);
					if(result>0) {
						map.put("msg", "문의가 등록되었습니다.");
						code = 1;
					}else {
						map.put("msg", "ERROR");
						code = 2;
					}
				}
			}
		}
		map.put("code", code);
		return map;
	}
}
