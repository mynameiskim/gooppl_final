package goo.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("/admin_member_config.do")
	public String member_config() {
		return "admin/basic_settings/admin_member_config";
	}
	
	@RequestMapping("/addAdmin.do")
	public String addAdmin() {
		return "admin/basic_settings/addAdmin";
	}
	
	@RequestMapping("/adminDetails.do")
	public ModelAndView adminDetails(@RequestParam("member_idx")int member_idx,@RequestParam(("goo_id")) String goo_id) {
		System.out.println("adminDetails ok");
		MemberDTO mdto=adminService.adminMemberInfo(goo_id);
		AdminDTO adto=adminService.adminInfo(goo_id);
		System.out.println(member_idx);
		System.out.println(goo_id);
		ModelAndView mav=new ModelAndView();
		mav.addObject("mdto", mdto);
		mav.addObject("adto", adto);
		mav.setViewName("admin/basic_settings/admin_adminDetails");
		return mav;
	}
	
}
