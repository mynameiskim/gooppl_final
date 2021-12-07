package goo.controller;


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

@Controller
public class PaymentController {
	
	@Autowired
	private OwnerService ownerService;
	@Autowired
	private Ad_inquiryService ad_inquiryService;
	@Autowired
	private Payment_infoService payment_infoService;

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
	@ResponseBody
	public String user_payment_ok(
			HttpSession session,
			@RequestParam("imp_uid")String imp_uid,
			@RequestParam("owner_idx")int owner_idx,
			@RequestParam("merchant_uid")String merchant_uid,
			@RequestParam("amount")int amount,
			@RequestParam("status")String status) {
		System.out.println("넘어왔따!!");
		
		int member_idx = (Integer) session.getAttribute("sessionMember_idx");
		System.out.println("imp_uid:"+imp_uid+"\n owner_idx:"+owner_idx+"\n member_idx:"+member_idx+"\n merchant_uid:"+merchant_uid+"\n amount:"+amount+"\n status:"+status);
		ModelAndView mav = new ModelAndView();
		System.out.println("dto 값 넣기 전");
		Payment_infoDTO dto = new Payment_infoDTO(imp_uid, owner_idx, member_idx, merchant_uid, amount, status);
		System.out.println("dto 값 넣은 후 디비 입력 전");
		int result = payment_infoService.savePayInfo(dto);
		System.out.println("db 값 넣음");
		String msg=result>0?"디비 입력완료":"디비 입력실패";
		System.out.println("결제결과:"+msg);
		return msg;
	}
}
