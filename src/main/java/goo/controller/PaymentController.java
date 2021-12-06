package goo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import goo.owner.model.*;
import goo.ad_inquery.model.*;

@Controller
public class PaymentController {
	
	@Autowired
	private OwnerService ownerService;
	@Autowired
	private Ad_inquiryService ad_inquiryService;

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
	
	@RequestMapping("/user_payment_ok.do")
	public ModelAndView user_payment_ok(
			HttpSession session,
			@RequestParam("imp_uid")String imp_uid,
			@RequestParam("merchant_uid")String merchant_uid,
			@RequestParam("amount")int amount) {
		
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
