package goo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import goo.admin.model.*;
import goo.member.model.*;
import goo.owner.model.*;
import goo.siteSettings.model.*;

@Controller
public class AdminAdManagement {
	
	@Autowired
	private OwnerService ownerService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private AdminService adminService;

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
	public Map<String, Object> admin_ownerAppli_del(@RequestParam(("owner_idx"))int owner_idx) {
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
	
	/***/
	@RequestMapping("/admin_owner_detail.do")
	public ModelAndView admin_owner_detail(@RequestParam(("owner_idx")) int owner_idx) {
		System.out.println("owner details ok");
		System.out.println("광고주번호:"+owner_idx);
		OwnerDTO dto = ownerService.ownerInfo(owner_idx);
		System.out.println("owner sql문 돌아감");
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("admin/ad_management/admin_owner_details");
		return mav;
	}
}
