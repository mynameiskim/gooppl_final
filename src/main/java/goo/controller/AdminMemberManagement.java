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

import goo.admin.model.AdminService;
import goo.formmail.model.FormmailDTO;
import goo.formmail.model.FormmailService;
import goo.member.model.*;

@Controller
public class AdminMemberManagement {

	@Autowired
	private MemberService memberService;
	@Autowired
	private FormmailService formmailService;
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/admin_member_management.do")
	public String memberManagement() {
		return "/admin/member_management/admin_member_management";
	}
	
	@RequestMapping("/admin_member_list.do")
	public ModelAndView memberList(@RequestParam(value = "cp",defaultValue = "1")int cp) {
		int listSize=5;
		int pageSize=5;
		int totalMember = memberService.totalMember();
		List<MemberDTO> list = memberService.memberList(cp,listSize);
		System.out.println(list.size());
		String pageStr=goo.page.PageModule.makePage("admin_member_list.do", totalMember, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("size", list.size());
		mav.addObject("cp", cp);
		mav.addObject("listSize", listSize);
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.addObject("totalMember", totalMember);
		mav.setViewName("admin/member_management/admin_member_list");
		return mav;
	}
	
	@RequestMapping("/member_info.do")
	public ModelAndView memberInfo(@RequestParam("member_idx")int member_idx) {
		MemberDTO mdto = memberService.memberInfo(member_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("mdto", mdto);
		mav.setViewName("admin/member_management/member_info");
		return mav;
	}
	
	//회원 삭제
	@RequestMapping("/member_delete.do")
	@ResponseBody
	public Map<String, Object> memberDelete(@RequestParam("member_idx")int member_idx){
		System.out.println("memberDelete ok");
		int result = adminService.memberDelete(member_idx);
		int code = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(result>0) {
			System.out.println("삭제성공 ok");
			map.put("msg", member_idx+"번 회원을 삭제했습니다.");
			code = 1;
		}else {
			System.out.println("삭제실패 ok");
			map.put("msg", "ERROR");
			code = 0;
		}
		
		map.put("code", code);
		return map;
	}
	
	@RequestMapping("/member_update.do")
	public  ModelAndView memberUpdate(MemberDTO mdto){
		int result = adminService.memberUpdate(mdto);
		
		ModelAndView mav = new ModelAndView();
		if(result>0) {
			System.out.println("수정성공 ok");
			mav.addObject("msg", mdto.getMember_idx()+"번 회원의 닉네임이 수정되었습니다.");
		}else {
			System.out.println("수정실패 ok");
			mav.addObject("msg", "ERROR");
		}
		mav.addObject("goPage", "admin_member_list.do");
		mav.setViewName("admin/basic_settings/msg");
		return mav;
	}
	
	//폼메일
	@RequestMapping("/admin_formmail_settings.do")
	public ModelAndView formmailSettings(@RequestParam("form_type")String form_type) {
		int result = formmailService.selectedUpdate(form_type);
		if(result>0) {
			System.out.println("selected 수정완료");
		}else {
			System.out.println("selected 수정실패");
		}
		FormmailDTO fdto = formmailService.formType(form_type);
		List<FormmailDTO> list = formmailService.formmail();
		ModelAndView mav = new ModelAndView();
		mav.addObject("fdto", fdto);
		mav.addObject("list", list);
		mav.setViewName("admin/member_management/admin_formmail_settings");
		return mav;
	}
	
	@RequestMapping("/form_update.do")
	@ResponseBody
	public Map<String, Object> formUpdate(FormmailDTO fdto){
		System.out.println(fdto.getForm_no());
		System.out.println(fdto.getForm_type()+"/"+fdto.getForm_title());
		System.out.println(fdto.getForm_content());
		int result = formmailService.formUpdate(fdto);
		int code = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(result>0) {
			map.put("msg", fdto.getForm_type()+" 폼메일이 수정되었습니다.");
			code = 1;
		}else if(result==0) {
			map.put("msg", "ERROR");
			code = 0;
		}
		map.put("code", code);
		return map;
	}
	
	@RequestMapping("/admin_member_out.do")
	public ModelAndView memberOut() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/member_management/admin_member_out");
		return mav;
	}
}
