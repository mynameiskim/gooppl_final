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
import goo.ad_inquery.model.*;
import goo.payment_info.model.*;
import goo.ad.model.*;

@Controller
public class PaymentController {
	
	@Autowired
	private OwnerService ownerService;
	@Autowired
	private Ad_inquiryService ad_inquiryService;
	@Autowired
	private Payment_infoService payment_infoService;
	@Autowired
	private AdService adService;

	@RequestMapping("/user_payment.do")
	public ModelAndView user_payment(HttpSession session) {
		int member_idx = (Integer) session.getAttribute("sessionMember_idx");
		OwnerDTO odto = ownerService.ckOwnerInfo(member_idx);
		Ad_inquiryDTO adto = ad_inquiryService.ad_paymentInfo(member_idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("odto", odto);
		mav.addObject("adto", adto);
		mav.setViewName("ad/userPayment_info");
		return mav;
	}
	
	/**결제 명령어*/
	@RequestMapping("/user_payment_ok.do")
	@ResponseBody
	public String user_payment_ok(
			HttpSession session,
			@RequestParam("imp_uid")String imp_uid,
			@RequestParam("owner_idx")int owner_idx,
			@RequestParam("merchant_uid")String merchant_uid,
			@RequestParam("amount")int amount,
			@RequestParam("status")String status,
			@RequestParam("ad_period")int ad_period) {
		
		int member_idx = (Integer) session.getAttribute("sessionMember_idx");
		int ad_ck = adService.ckAd_info(owner_idx);
		
		int ad_result = 0;
		Payment_infoDTO pdto = new Payment_infoDTO(imp_uid, owner_idx, member_idx, merchant_uid, amount, status);
		System.out.println("결제 상태 여기까지는 옴");
		if(ad_ck>0) {
			System.out.println("원래 광고 정보가 있었따");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("imp_uid", imp_uid);
			map.put("owner_idx", owner_idx);
			ad_result = adService.pay_Update_ad_info(imp_uid, owner_idx);
		}else {
			System.out.println("광고 처음 신청하는 사람");
			AdDTO adto = new AdDTO(owner_idx, imp_uid, ad_period, "광고중");
			ad_result = adService.startAD(adto);
		}
		int result = payment_infoService.savePayInfo(pdto);
		int inquiry_result = ad_inquiryService.payOk_InquiryDel(owner_idx);
		if(result>0&&inquiry_result>0) {
			 session.removeAttribute("ad_inquiry_state");
		}
		System.out.println("db 값 넣음");
		String msg=result>0?"디비 입력완료":"디비 입력실패";
		System.out.println("결제결과:"+msg);
		return msg;
	}
	
	
	
	
}
