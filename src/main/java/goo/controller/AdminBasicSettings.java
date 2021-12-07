package goo.controller;

import java.util.HashMap;



import java.util.List;
import java.util.Map;
import java.io.*;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import goo.admin.model.AdminService;
import goo.member.model.MemberDTO;
import goo.siteSettings.model.SiteSettingsDTO;
import goo.siteSettings.model.SiteSettingsService;
import goo.admin.model.*;

@Controller
public class AdminBasicSettings {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private SiteSettingsService siteSettingsService;

	@RequestMapping("/admin_basic_settings.do")
	public String adminBasicSettings() {
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
	public String siteSettings() {
		
		return "admin/basic_settings/admin_site_settings";
	}
	
	@RequestMapping("/admin_settings.do")
	public ModelAndView admin_settings(@RequestParam(value = "cp",defaultValue = "1")int cp) {
		int listSize=5;
		int pageSize=5;
		int totalAdmin = adminService.totalAdmin();
		String pageStr=goo.page.PageModule.makePage("admin_settings.do", totalAdmin, listSize, pageSize, cp);
		System.out.println("admin_settings OK");
		List<MemberDTO> list1=adminService.allAdminMemberInfo(cp,listSize);
		List<AdminDTO> list2=adminService.allAdminInfo(cp,listSize);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("cp", cp);
		mav.addObject("size", list2.size());
		mav.addObject("listSize", listSize);
		mav.addObject("pageStr", pageStr);
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
		int result1 = adminService.adminInsert1(mdto);
		ModelAndView mav = new ModelAndView();
		if(result1>0) {
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
		int result1 = adminService.adminUpdate1(mdto);
		ModelAndView mav = new ModelAndView();
		if(result1>0) {
			int result2 = adminService.adminUpdate2(adto);
			if(result2>0) {
				mav.addObject("msg", "관리자정보 수정완료");
			}else {
				mav.addObject("msg", "관리자정보 수정실패");
			}
		}else {
			mav.addObject("msg", "관리자정보 수정실패");
		}
		mav.addObject("goPage", "admin_settings.do");
		mav.setViewName("admin/basic_settings/msg");
		return mav;
	}
	
	@RequestMapping("/admin_delete")
	@ResponseBody
	public Map<String, Object> adminDelete(@RequestParam(("member_idx"))int member_idx) {
		System.out.println("adminDelete OK");
		Map<String, Object> map = new HashMap<String, Object>();
		int totalAdmin = adminService.totalAdmin();
		int code=0;
		
		System.out.println("관리자 수="+totalAdmin);
		if(totalAdmin>1) {
			int result1 = adminService.adminDelete1(member_idx);
			
			if(result1>0) {
				int result2 = adminService.adminDelete2(member_idx);
				if(result2>0) {
					System.out.println("삭제 OK");
					map.put("msg", "삭제완료");
					code=1;
				}else {
					map.put("msg", "ERROR");
					code=0;
				}
			}else {
				map.put("msg", "ERROR");
				code=0;
			}
		}else if(totalAdmin==1){
			System.out.println("관리자가 1명만 등록 되어있는 경우 삭제가 되지 않습니다.");
			map.put("msg", "관리자가 1명만 등록 되어있는 경우 삭제가 되지 않습니다.");
			code =2;
		}
		map.put("code", code);
		return map;
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
	
	@RequestMapping("/faviconUpload.do")
	@ResponseBody
	public Map<String,Object> faviconUpload(SiteSettingsDTO	sdto){
		System.out.println("faviconUpload ok");
		String favicon=sdto.getFavicon();
		int result = siteSettingsService.faviconUpload(favicon);
		
		Map<String,Object> map = new HashMap<String, Object>();
		if(result>0) {
			map.put("msg","성공");
		}else {
			map.put("msg","실패");
		}
		
		map.put("favicon", favicon);
		return map;
	}
	
	
	/**실제 파일 복사 관련 메서드*/
	public void copyInto(MultipartFile upload) {
		
		System.out.println("올릴파일명:"+upload.getOriginalFilename());
		
		try {
			byte[] bytes=upload.getBytes();
			//복사본정보
			File outFile=new File("C:\\Users\\nojiw\\Desktop\\노지원\\upload/"+upload.getOriginalFilename());
			FileOutputStream fos=new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
