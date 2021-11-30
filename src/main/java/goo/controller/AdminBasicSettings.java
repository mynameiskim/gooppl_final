package goo.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import goo.admin.model.AdminService;
import goo.admin.model.AdminServiceImple;
import goo.member.model.MemberDTO;
import goo.admin.model.*;

@Controller
public class AdminBasicSettings {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private SiteSettingsService siteSettingsService;

	@RequestMapping("/admin_basic_settings.do")
	public String admin() {
		return "admin/basic_settings/admin_basic_settings";
	}
	
	@RequestMapping("/admin_site_info.do")
	public ModelAndView site_info(@RequestParam("goo_id")String goo_id) {
		System.out.println("site_info OK");
		AdminDTO dto=adminService.adminInfo(goo_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("admin/basic_settings/admin_site_info");
		return mav;
	}
	
	@RequestMapping("/admin_site_settings.do")
	public String site_settings() {
		
		return "admin/basic_settings/admin_site_settings";
	}
	
	@RequestMapping("/admin_settings.do")
	public ModelAndView admin_settings() {
		System.out.println("admin_settings OK");
		List<MemberDTO> list1=adminService.allAdminMemberInfo();
		List<AdminDTO> list2=adminService.allAdminInfo();
		ModelAndView mav=new ModelAndView();
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.setViewName("admin/basic_settings/admin_settings");
		return mav;
	}
	
	@RequestMapping(value ="/admin_member_config.do")
	public String member_config() {
		return "admin/basic_settings/admin_member_config";
	}
	
	@RequestMapping(value = "/admin_insert.do",method = RequestMethod.GET)
	public String addAdminPage() {
		return "admin/basic_settings/add_admin";
	}
	
	@RequestMapping(value = "/admin_insert.do",method = RequestMethod.POST)
	public ModelAndView addAdmin(MemberDTO mdto,AdminDTO adto) {
		System.out.println("admin_insert.do ok");
		System.out.println(mdto.getGoo_id());
		System.out.println(adto.getAdmin_phone());
		int result = adminService.adminInsert1(mdto);
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			mdto= adminService.adminMemberInfo(mdto.getGoo_id());
			int member_idx=mdto.getMember_idx();
			adto.setMember_idx(member_idx);
			System.out.println("adto.getMember_idx="+adto.getMember_idx());
			System.out.println("adto.getAdmin_addr="+adto.getAdmin_addr());
			int result2 = adminService.adminInsert2(adto);
			if(result2>0) {
				mav.addObject("msg", "관리자 등록완료");
			}else {
				mav.addObject("msg", "관리자 등록실패");
			}
		}else {
			mav.addObject("msg", "관리자 등록실패");
		}
		mav.setViewName("admin/basic_settings/admin_insert_result_msg");
		return mav;
	}
	
	@RequestMapping("/admin_update.do")
	public ModelAndView admin_update(MemberDTO mdto,AdminDTO adto) {
		System.out.println("admin_update OK");
		System.out.println(mdto.getMember_idx());
		System.out.println(adto.getMember_idx());
		int result1 = adminService.admin_update1(mdto);
		ModelAndView mav = new ModelAndView();
		if(result1>0) {
			int result2 = adminService.admin_update2(adto);
			if(result2>0) {
				mav.addObject("msg", "관리자정보 수정완료");
			}else {
				mav.addObject("msg", "관리자정보 수정실패");
			}
		}else {
			mav.addObject("msg", "관리자정보 수정실패");
		}
		mav.setViewName("admin/basic_settings/admin_update_result_msg");
		return mav;
	}
	
	
	@RequestMapping("/admin_details.do")
	public ModelAndView adminDetails(@RequestParam(("goo_id")) String goo_id) {
		System.out.println("admin_details ok");
		System.out.println(goo_id);
		MemberDTO mdto=adminService.adminMemberInfo(goo_id);
		AdminDTO adto=adminService.adminInfo(goo_id);
		System.out.println(goo_id);
		ModelAndView mav=new ModelAndView();
		mav.addObject("mdto", mdto);
		mav.addObject("adto", adto);
		mav.setViewName("admin/basic_settings/admin_details");
		return mav;
	}
	
}
