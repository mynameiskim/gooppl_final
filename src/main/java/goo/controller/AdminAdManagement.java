package goo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import goo.admin.model.*;
import goo.area.model.AreaDTO;
import goo.area.model.AreaService;
import goo.member.model.*;
import goo.owner.model.*;
import goo.payment_info.model.*;
import goo.sigungu.model.SigunguDTO;
import goo.sigungu.model.SigunguService;
import goo.siteSettings.model.*;
import goo.ad.model.*;
import goo.ad_inquery.model.*;

@Controller
public class AdminAdManagement {
	
	@Autowired
	private OwnerService ownerService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private Ad_inquiryService ad_inquiryService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private SigunguService sigunguService;
	@Autowired
	private Payment_infoService payment_infoService;
	@Autowired
	private AdService adService;

	@RequestMapping("/admin_ad_management.do")
	public String ad_management() {
		return "/admin/ad_management/admin_ad_management";
	}
	
	/**광고주 신청 리스트*/
	@RequestMapping("/admin_ownerAppli.do")
	public ModelAndView ckOwnerAppli(@RequestParam(value = "cp",defaultValue = "1")int cp) {
		int listSize=5;
		int pageSize=5;
		int totalOwnerAppli = ownerService.totalOwnerAppli();
		System.out.println("총 신청 수:"+totalOwnerAppli);
		String pageStr = goo.page.PageModule.makePage("admin_ownerAppli.do", totalOwnerAppli, listSize, pageSize, cp);
		System.out.println("admin_ownerAppli OK");
		List<OwnerDTO> list = ownerService.allOwnerAppliInfo(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("cp", cp);
		mav.addObject("size", list.size());
		mav.addObject("listSize", listSize);
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("admin/ad_management/admin_ownerAppli");
		return mav;
	}
	
	/**광고주 신청 자세히보기*/
	@RequestMapping("/admin_ownerAppli_details.do")
	public ModelAndView admin_ownerAppli_details(@RequestParam(("owner_idx")) int owner_idx) {
		System.out.println("ownerAppli details ok");
		System.out.println("광고주번호:"+owner_idx);
		OwnerDTO dto = ownerService.ownerInfo(owner_idx);
		System.out.println("ownerAppli sql문 돌아감");
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("admin/ad_management/admin_ownerAppli_details");
		return mav;
	}
	
	/**광고주 신청 승인*/
	@RequestMapping("/admin_ownerAppli_ok")
	@ResponseBody
	public Map<String, Object> admin_ownerAppli_ok(
			@RequestParam(("owner_idx"))int owner_idx,
			@RequestParam(("member_idx"))int member_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		int code=0;
		
			int appliResult = ownerService.admin_ownerAppli_ok(owner_idx);

			if(appliResult>0) {
				int memberResult = memberService.admin_ownerAppli_typeChange(member_idx);
				if(memberResult>0) {
					System.out.println("승인완료");
					map.put("msg", "승인완료");
					code=1;
				}else {
					map.put("msg", "ERROR");
					code=0;
				}
			}else {
				map.put("msg", "ERROR");
				code=0;
			}
		map.put("code", code);
		return map;
	}
	
	/**광고주 신청 거절*/
	@RequestMapping("/admin_ownerAppli_del")
	@ResponseBody
	public Map<String, Object> admin_ownerAppli_del(@RequestParam("owner_idx")int owner_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		int code=0;
		
		int result = ownerService.admin_ownerAppli_del(owner_idx);
			
		if(result>0) {
			map.put("msg", "요청거절완료");
			code=1;
		}else {
			map.put("msg", "ERROR");
			code=0;
		}
		map.put("code", code);
		return map;
	}
	
	/**광고주 회원 리스트*/
	@RequestMapping("/admin_allOwner.do")
	public ModelAndView admin_allOwner(@RequestParam(value = "cp",defaultValue = "1")int cp) {
		int listSize=5;
		int pageSize=5;
		int totalOwner = ownerService.totalOwner();
		System.out.println("총 광고주 수:"+totalOwner);
		String pageStr = goo.page.PageModule.makePage("admin_allOwner.do", totalOwner, listSize, pageSize, cp);
		List<OwnerDTO> list = ownerService.admin_allOwner(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("cp", cp);
		mav.addObject("size", list.size());
		mav.addObject("listSize", listSize);
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("admin/ad_management/admin_owner");
		return mav;
	}
	
	/**광고주 회원 상세정보*/
	@RequestMapping("/admin_owner_detail.do")
	public ModelAndView admin_owner_detail(@RequestParam(("owner_idx")) int owner_idx) {
		System.out.println("owner details ok");
		System.out.println("광고주번호:"+owner_idx);
		OwnerDTO dto = ownerService.ownerInfo(owner_idx);
		System.out.println("owner sql문 돌아감");
		ModelAndView mav=new ModelAndView();
		List<AreaDTO> arealist = areaService.areaList();
		List<SigunguDTO> sigungulist = sigunguService.sigunguList();
		mav.addObject("dto", dto);
		mav.addObject("arealist",arealist);
		mav.addObject("sigungulist",sigungulist);
		mav.setViewName("admin/ad_management/admin_owner_details");
		return mav;
	}
	
//	/**광고주 정보 수정*/
//	@RequestMapping("/admin_ownerUpdate.do")
//	public ModelAndView admin_ownerUpdate(OwnerDTO dto) {
//		
//		int code=0;
//		System.out.println(dto.getOwner_idx());
//		System.out.println(dto.getMember_idx());
//		System.out.println(dto.getTitle());
//		System.out.println(dto.getBusiness_number());
//		System.out.println(dto.getName());
//		System.out.println(dto.getEmail());
//		System.out.println(dto.getBusiness_tel());
//		System.out.println(dto.getTel());
//		System.out.println(dto.getContenttype());
//		System.out.println(dto.getAddr());
//		System.out.println(dto.getDetailed_addr());
//		System.out.println(dto.getAd_content());
//		System.out.println(dto.getMapx()+"__"+dto.getMapy());
//		System.out.println(dto.getAreacode());
//		System.out.println(dto.getSigungucode());
//		System.out.println(dto.getState());
//		ModelAndView mav = new ModelAndView();
//		if(dto.getFirstimg()==null) {
//			System.out.println("이미지가 널이래");
//			OwnerDTO tempDto = ownerService.ownerInfo(dto.getOwner_idx());
//			System.out.println("원래 이미지:"+tempDto.getFirstimg());
//			dto.setFirstimg(tempDto.getFirstimg());
//		}
//		int result = ownerService.admin_ownerUpdate(dto);
//			if(result>0) {
//				System.out.println("수정완료");
//				mav.addObject("msg","수정완료");
//				
//			}else {
//				System.out.println("수정실패");
//				mav.addObject("msg","수정실패");
//			}
//			mav.addObject("goPage","admin_Allowner.do");
//			mav.setViewName("admin/basic_settings/msg");
//			return mav;
//	}
//	
	
	
	/**광고주 정보 삭제*/
	@RequestMapping("/admin_owner_del.do")
	@ResponseBody
	public Map<String, Object> admin_owner_del(
			@RequestParam(("owner_idx"))int owner_idx,
			@RequestParam(("member_idx"))int member_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		int code=0;
		
		int result = ownerService.admin_ownerAppli_del(owner_idx);
		int memberResult = memberService.admin_changeOwnerType(member_idx);
			
		if(result>0) {
			map.put("msg", "삭제완료");
			code=1;
		}else {
			map.put("msg", "ERROR");
			code=0;
		}
		map.put("code", code);
		return map;
	}
	
	/**광고 신청 문의*/
	@RequestMapping("/admin_adAppli.do")
	public ModelAndView admin_adAppliList(@RequestParam(value = "cp",defaultValue = "1")int cp) {
		int listSize=5;
		int pageSize=5;
		int totalAdInquiry = ad_inquiryService.admin_totalAdInquiry();
		System.out.println("총 광고문의 수:"+totalAdInquiry);
		String pageStr = goo.page.PageModule.makePage("admin_adAppli.do", totalAdInquiry, listSize, pageSize, cp);
		List<Ad_inquiryDTO> list = ad_inquiryService.admin_adInquiry(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("cp", cp);
		mav.addObject("size", list.size());
		mav.addObject("listSize", listSize);
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("admin/ad_management/admin_adInquiry");
		return mav;
	}
	
	@RequestMapping("/admin_adCancel.do")
	public ModelAndView admin_adCancelList(@RequestParam(value = "cp",defaultValue = "1")int cp) {
		
		
		int listSize=5;
		int pageSize=5;
		int totalAdDelInquiry = ad_inquiryService.admin_totalAdDelInquiry();
		System.out.println("총 환불문의 수:"+totalAdDelInquiry);
		String pageStr = goo.page.PageModule.makePage("admin_adCancel.do", totalAdDelInquiry, listSize, pageSize, cp);
		List<Ad_inquiryDTO> list = ad_inquiryService.admin_adDelInquiry(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("cp", cp);
		mav.addObject("size", list.size());
		mav.addObject("listSize", listSize);
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.setViewName("admin/ad_management/admin_adDelInquiry");
		return mav;
	}
	
	/**광고주 신청 자세히보기*/
	@RequestMapping("/adInquiry_details.do")
	public ModelAndView admin_adInquiry_details(@RequestParam("inquiry_idx") int inquiry_idx) {
		System.out.println("admin_adInquiry_details ok");
		System.out.println("문의번호:"+inquiry_idx);
		Ad_inquiryDTO idto = ad_inquiryService.adInquiry_Info(inquiry_idx);
		int owner_idx = idto.getOwner_idx();
		OwnerDTO odto = ownerService.ownerInfo(owner_idx);
		System.out.println("adInquiry sql문 돌아감");
		ModelAndView mav=new ModelAndView();
		mav.addObject("idto", idto);
		mav.addObject("odto", odto);
		mav.setViewName("admin/ad_management/admin_adInquiry_details");
		return mav;
	}
	
	/**광고 신청 승인*/
	@RequestMapping("/admin_adInquiry_ok.do")
	@ResponseBody
	public Map<String, Object> adInquiry_ok(@RequestParam("inquiry_idx") int inquiry_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		int code=0;
		
		int inquiryResult = ad_inquiryService.admin_adInquiry_ok(inquiry_idx);

		if(inquiryResult>0) {
			System.out.println("광고승인완료");
			map.put("msg", "승인완료");
			System.out.println("승인완료 메세지 확인");
			code=1;
		}else {
			map.put("msg", "ERROR");
			code=0;
		}
		map.put("code", code);
		System.out.println("여기까지 옴");
		return map;
	}
	
	
	/**광고 신청 거절*/
	@RequestMapping("/admin_adInquiry_del.do")
	@ResponseBody
	public Map<String, Object> adInquiry_del(@RequestParam(("inquiry_idx"))int inquiry_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		int code=0;
		
		int result = ad_inquiryService.admin_adInquiry_del(inquiry_idx);
			
		if(result>0) {
			map.put("msg", "광고 승인 거절");
			code=1;
		}else {
			map.put("msg", "ERROR");
			code=0;
		}
		map.put("code", code);
		return map;
	}
	
	
	
	/**광고주 신청 자세히보기*/
	@RequestMapping("/admin_adInquiryDel_details.do")
	public ModelAndView admin_adInquiryDel_details(@RequestParam(("inquiry_idx")) int inquiry_idx) {
		System.out.println("admin_adDelInquiry_details ok");
		System.out.println("문의번호:"+inquiry_idx);
		Ad_inquiryDTO idto = ad_inquiryService.adInquiry_Info(inquiry_idx);
		int owner_idx = idto.getOwner_idx();
		OwnerDTO odto = ownerService.ownerInfo(owner_idx);
		Payment_infoDTO pdto = payment_infoService.admin_getPayInfo(owner_idx);
		
		System.out.println("adInquiry sql문 돌아감");
		ModelAndView mav=new ModelAndView();
		mav.addObject("idto", idto);
		mav.addObject("odto", odto);
		mav.addObject("pdto", pdto);
		mav.setViewName("admin/ad_management/admin_adDelInquiry_details");
		return mav;
	}
	
	/**광고 환불 문의 승인*/
	@RequestMapping("/admin_delInquiry_Ok.do")
	@ResponseBody
	public Map<String, Object> admin_delInquiry_Ok(
			@RequestParam("inquiry_idx") int inquiry_idx,
			@RequestParam("imp_uid")String imp_uid) {
		Map<String, Object> map = new HashMap<String, Object>();
		int code=0;
		
		int inquiryResult = ad_inquiryService.admin_delInquiry_Ok(inquiry_idx);
		int changePayInfoResult = payment_infoService.admin_changePayInfo_cancel(imp_uid);
		int refund_Ad_infoResult = adService.admin_refundAd_Del(imp_uid);
		
		int result = inquiryResult + changePayInfoResult + refund_Ad_infoResult;
		
		if(result==3) {
			System.out.println("광고환불완료");
			map.put("msg", "환불이 완료되었습니다.");
			System.out.println("환불 완료 확인 메세지");
			code=1;
		}else if(result<3) {
			if(inquiryResult==0) {
				map.put("msg", "환불 문의 삭제 실패");
				System.out.println("환불 문의 삭제 실패");
				code=2;
			}else if(changePayInfoResult==0) {
				map.put("msg", "결제 정보 수정 실패");
				System.out.println("승인완료 메세지 확인");
				code=2;
			}else if(refund_Ad_infoResult==0) {
				map.put("msg", "광고 상태 수정 실패");
				System.out.println("승인완료 메세지 확인");
				code=2;
			}
		}else {
			map.put("msg", "ERROR");
			code=0;
		}
		map.put("code", code);
		System.out.println("여기까지 옴");
		return map;
	}
	
	/**광고 환불 신청 거절*/
	@RequestMapping("/admin_delInquiry_Delete.do")
	@ResponseBody
	public Map<String, Object> admin_delInquiry_Delete(@RequestParam(("inquiry_idx"))int inquiry_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		int code=0;
		
		int result = ad_inquiryService.admin_delInquiry_Delete(inquiry_idx);
			
		if(result>0) {
			map.put("msg", "환불 거절 완료");
			code=1;
		}else {
			map.put("msg", "ERROR");
			code=0;
		}
		map.put("code", code);
		return map;
	}
	
	
	/**광고 환불 (관리자)*/
	@RequestMapping("/admin_refund_Ok.do")
	@ResponseBody
	public Map<String, Object> admin_refund_Ok(
			@RequestParam("imp_uid")String imp_uid) {
		Map<String, Object> map = new HashMap<String, Object>();
		int code=0;
		
		int changePayInfoResult = payment_infoService.admin_changePayInfo_cancel(imp_uid);
		int refund_Ad_infoResult = adService.admin_refundAd_Del(imp_uid);
		
		int result = changePayInfoResult + refund_Ad_infoResult;
		
		if(result==2) {
			System.out.println("광고환불완료");
			map.put("msg", "환불이 완료되었습니다.");
			System.out.println("환불 완료 확인 메세지");
			code=1;
		}else if(result<2) {
			if(changePayInfoResult==0) {
				map.put("msg", "결제 정보 수정 실패");
				System.out.println("승인완료 메세지 확인");
				code=2;
			}else if(refund_Ad_infoResult==0) {
				map.put("msg", "광고 상태 수정 실패");
				System.out.println("승인완료 메세지 확인");
				code=2;
			}
		}else {
			map.put("msg", "ERROR");
			code=0;
		}
		map.put("code", code);
		System.out.println("여기까지 옴");
		return map;
	}
	
	
	
	/**환불 명령어*/
	@RequestMapping("/user_paymenthh_ok.do")
	@ResponseBody
	public String user_paymentjj_ok(
			HttpSession session,
			@RequestParam("imp_uid")String imp_uid,
			@RequestParam("owner_idx")int owner_idx,
			@RequestParam("merchant_uid")String merchant_uid,
			@RequestParam("amount")int amount,
			@RequestParam("status")String status,
			@RequestParam("ad_period")int ad_period) {
		
		int member_idx = (Integer) session.getAttribute("sessionMember_idx");
		
		Payment_infoDTO pdto = new Payment_infoDTO(imp_uid, owner_idx, member_idx, merchant_uid, amount, status);
		AdDTO adto = new AdDTO(owner_idx, imp_uid, ad_period, "광고중");
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
	
	/**결제 내역 리스트*/
	@RequestMapping("/admin_paymentStatus.do")
	public ModelAndView admin_payment_list(@RequestParam(value = "cp",defaultValue = "1")int cp) {
		int listSize=5;
		int pageSize=5;
		int totalPayment = payment_infoService.totalPayment();
		System.out.println("전체:"+totalPayment);
		String pageStr = goo.page.PageModule.makePage("admin_paymentStatus.do", totalPayment, listSize, pageSize, cp);
		System.out.println("admin_payment_list OK");
		List<Payment_infoDTO> list = payment_infoService.allPayment_Info(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("cp", cp);
		mav.addObject("size", list.size());
		mav.addObject("listSize", listSize);
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.addObject("totalPayment", totalPayment);
		mav.setViewName("admin/ad_management/admin_payment_list");
		return mav;
	}
	
	/**결제 정보 자세히보기*/
	@RequestMapping("/admin_payment_details.do")
	public ModelAndView admin_adInquiryDel_details(@RequestParam(("imp_uid")) String imp_uid) {
		System.out.println("admin_payment_details ok");
		System.out.println("imp_uid:"+ imp_uid);
		
		Payment_infoDTO pdto = payment_infoService.getPaymentDetail(imp_uid);
		
		int owner_idx = pdto.getOwner_idx();
		OwnerDTO odto = ownerService.ownerInfo(owner_idx);
		
		System.out.println("payment_info sql문 돌아감");
		ModelAndView mav=new ModelAndView();
		mav.addObject("odto", odto);
		mav.addObject("pdto", pdto);
		mav.setViewName("admin/ad_management/admin_payment_detail");
		return mav;
	}
	
	/**광고 내역 리스트*/
	@RequestMapping("/admin_adStatus.do")
	public ModelAndView admin_ad_list(@RequestParam(value = "cp",defaultValue = "1")int cp) {
		int listSize=5;
		int pageSize=5;
		int totalAd = adService.total_AdInfo();
		System.out.println("전체:"+totalAd);
		String pageStr = goo.page.PageModule.makePage("admin_adStatus.do", totalAd, listSize, pageSize, cp);
		System.out.println("admin_ad_list OK");
		List<AdDTO> list = adService.all_AdInfo(cp, listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("cp", cp);
		mav.addObject("size", list.size());
		mav.addObject("listSize", listSize);
		mav.addObject("pageStr", pageStr);
		mav.addObject("list", list);
		mav.addObject("totalAd", totalAd);
		mav.setViewName("admin/ad_management/admin_adStatus_management");
		return mav;
	}
	
	/**광고 정보 자세히보기*/
	@RequestMapping("/admin_ad_info.do")
	public ModelAndView admin_ad_info(@RequestParam(("ad_idx")) int ad_idx) {
		System.out.println("admin_ad_info_details ok");
		System.out.println("ad_idx:"+ ad_idx);
		
		AdDTO adto = adService.ad_info(ad_idx);
		int owner_idx = adto.getOwner_idx();
		
		OwnerDTO odto = ownerService.ownerInfo(owner_idx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("odto", odto);
		mav.addObject("adto", adto);
		mav.setViewName("admin/ad_management/admin_adStatus_details");
		return mav;
	}
	
	/**광고 상태 올리기*/
	@RequestMapping("/admin_adState_up.do")
	@ResponseBody
	public Map<String, Object> admin_adState_up(
			@RequestParam("owner_idx") int owner_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		int code=0;
		
		int result = adService.admin_adState_up(owner_idx);
		
		if(result>0) {
			System.out.println("광고올림");
			map.put("msg", "광고 상태 수정완료");
			code=1;
		}else {
			map.put("msg", "ERROR");
			code=0;
		}
		map.put("code", code);
		return map;
	}
	
	/**광고 상태 내리기*/
	@RequestMapping("/admin_adState_down.do")
	@ResponseBody
	public Map<String, Object> admin_adState_down(
			@RequestParam("owner_idx") int owner_idx) {
		Map<String, Object> map = new HashMap<String, Object>();
		int code=0;
		
		int result = adService.admin_adState_down(owner_idx);
		
		if(result>0) {
			System.out.println("광고내리기 완료");
			map.put("msg", "광고 상태 수정완료");
			code=1;
		}else {
			map.put("msg", "ERROR");
			code=0;
		}
		map.put("code", code);
		System.out.println("여기까지 옴");
		return map;
	}
}
