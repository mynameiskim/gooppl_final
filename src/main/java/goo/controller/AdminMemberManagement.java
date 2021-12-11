package goo.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;

import goo.admin.model.AdminService;
import goo.formmail.model.FormmailDTO;
import goo.formmail.model.FormmailService;
import goo.member.model.*;
import goo.memberout.model.MemberOutDAO;
import goo.memberout.model.MemberOutDTO;
import goo.memberout.model.MemberOutService;

@Controller
public class AdminMemberManagement {

	@Autowired
	private MemberService memberService;
	@Autowired
	private FormmailService formmailService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private MemberOutService memberOutService;
	@Autowired
	private MemberOutDAO memberOutDao;
	@Autowired
	private MemberDAO memberDao;
	
	@RequestMapping("/admin_member_management.do")
	public String memberManagement() {
		return "/admin/member_management/admin_member_management";
	}
	
	@RequestMapping("/admin_member_list.do")
	public ModelAndView memberList(@RequestParam(value = "cp",defaultValue = "1")int cp,@RequestParam(value = "search_type",defaultValue = "")String search_type
			,@RequestParam(value = "search",defaultValue = "")String search,@RequestParam(value = "start_date",defaultValue = "")String start_date
			,@RequestParam(value = "end_date",defaultValue = "")String end_date) {
		ModelAndView mav = new ModelAndView();
		if(!start_date.equals("")&&!end_date.equals("")){
			LocalDate s_date = LocalDate.parse(start_date, DateTimeFormatter.ISO_DATE);
			LocalDate e_date = LocalDate.parse(end_date, DateTimeFormatter.ISO_DATE);
			
			if(e_date.isBefore(s_date)) {
				mav.addObject("msg", "올바르지 않은 형식입니다.끝나는 날짜가 시작하는 날짜보다 이전 날짜입니다. 다시 입력해주세요.");
				mav.addObject("display", "display : none;");
			}else if(s_date.isBefore(e_date)) {
				if(!start_date.equals("")&&end_date.equals("")) {
					end_date = start_date;
				}else if(!end_date.equals("")&&start_date.equals("")) {
					start_date = end_date;
				}
				int listSize=5;
				int pageSize=5;
				int totalMember = memberService.totalMember();
				int searchTotalMember = memberDao.searchTotalMember(search_type, search,start_date,end_date);
				List<MemberDTO> list = memberService.memberList(cp,listSize,search_type,search,start_date,end_date);
				String pageStr=goo.page.PageModule.adminMakePage("admin_member_list.do", searchTotalMember>0?searchTotalMember:1, listSize, pageSize, cp ,search_type , search ,start_date, end_date);
				
				
				if(!search.equals("")||!start_date.equals("")||!end_date.equals("")) {
					mav.addObject("search_num", searchTotalMember);
					if(!search.equals("")) {
						if(search_type.equals(search_type)) {
							mav.addObject(search_type+"_selected","selected");
						}
					}
				}else {
					mav.addObject("search_num", 0);
				}
				
				mav.addObject("start_date", start_date);
				mav.addObject("end_date", end_date);
				mav.addObject("search", search);
				mav.addObject("size", list.size());
				mav.addObject("cp", cp);
				mav.addObject("listSize", listSize);
				mav.addObject("list", list);
				mav.addObject("pageStr", pageStr);
				mav.addObject("totalMember", totalMember);
			}
		}else {
			if(!start_date.equals("")&&end_date.equals("")) {
				end_date = start_date;
			}else if(!end_date.equals("")&&start_date.equals("")) {
				start_date = end_date;
			}
			int listSize=5;
			int pageSize=5;
			int totalMember = memberService.totalMember();
			int searchTotalMember = memberDao.searchTotalMember(search_type, search,start_date,end_date);
			List<MemberDTO> list = memberService.memberList(cp,listSize,search_type,search,start_date,end_date);
			String pageStr=goo.page.PageModule.adminMakePage("admin_member_list.do", searchTotalMember>0?searchTotalMember:1, listSize, pageSize, cp ,search_type , search ,start_date, end_date);
			
			
			if(!search.equals("")||!start_date.equals("")||!end_date.equals("")) {
				mav.addObject("search_num", searchTotalMember);
				if(!search.equals("")) {
					if(search_type.equals(search_type)) {
						mav.addObject(search_type+"_selected","selected");
					}
				}
			}else {
				mav.addObject("search_num", 0);
			}
			
			mav.addObject("start_date", start_date);
			mav.addObject("end_date", end_date);
			mav.addObject("search", search);
			mav.addObject("size", list.size());
			mav.addObject("cp", cp);
			mav.addObject("listSize", listSize);
			mav.addObject("list", list);
			mav.addObject("pageStr", pageStr);
			mav.addObject("totalMember", totalMember);
		}
		mav.setViewName("admin/member_management/admin_member_list");
		return mav;
	}
	

	@RequestMapping("/admin_member_out.do")
	public ModelAndView memberOutList(@RequestParam(value = "cp",defaultValue = "1")int cp,@RequestParam(value = "search_type",defaultValue = "")String search_type
			,@RequestParam(value = "search",defaultValue = "")String search,@RequestParam(value = "start_date",defaultValue = "")String start_date
			,@RequestParam(value = "end_date",defaultValue = "")String end_date) {
		
		ModelAndView mav = new ModelAndView();
		if(!start_date.equals("")&&!end_date.equals("")){
			LocalDate s_date = LocalDate.parse(start_date, DateTimeFormatter.ISO_DATE);
			LocalDate e_date = LocalDate.parse(end_date, DateTimeFormatter.ISO_DATE);
			
			if(e_date.isBefore(s_date)) {
				mav.addObject("msg", "올바르지 않은 형식입니다.끝나는 날짜가 시작하는 날짜보다 이전 날짜입니다. 다시 입력해주세요.");
				mav.addObject("display", "display : none;");
			}else if(s_date.isBefore(e_date)) {
				if(!start_date.equals("")&&end_date.equals("")) {
					end_date = start_date;
				}else if(!end_date.equals("")&&start_date.equals("")) {
					start_date = end_date;
				}
				System.out.println("memberOutList ok");
				System.out.println("search_type="+search_type);
				System.out.println("search="+search);
				int listSize=5;
				int pageSize=5;
				int totalMemberOut = memberOutDao.totalMemberOut();
				
				System.out.println("controller totalMemberOut ok");
				int searchTotalMemberOut = memberOutDao.searchTotalMemberOut(search_type, search,start_date,end_date);
				System.out.println("searchTotalMemberOut="+searchTotalMemberOut);
				System.out.println("controller searchTotalMemberOut ok");
				List<MemberOutDTO> list = memberOutService.memberOutList(cp,listSize,search_type,search,start_date,end_date);
				System.out.println("list 불러오기 ok");
				String pageStr=goo.page.PageModule.adminMakePage("admin_member_out.do", searchTotalMemberOut>0?searchTotalMemberOut:1, listSize, pageSize, cp ,search_type , search ,start_date, end_date);
				
				mav.addObject("start_date", start_date);
				mav.addObject("end_date", end_date);
				mav.addObject("search", search);
				if(!search.equals("")||!start_date.equals("")||!end_date.equals("")) {
					mav.addObject("search_num", searchTotalMemberOut);
					if(!search.equals("")) {
						if(search_type.equals(search_type)) {
							mav.addObject(search_type+"_selected","selected");
						}
					}
				}else {
					mav.addObject("search_num", 0);
				}
				mav.addObject("cp", cp);
				mav.addObject("listSize", listSize);
				mav.addObject("list", list);
				mav.addObject("pageStr", pageStr);
				mav.addObject("totalMemberOut", totalMemberOut);
			}
		}else {
			if(!start_date.equals("")&&end_date.equals("")) {
				end_date = start_date;
			}else if(!end_date.equals("")&&start_date.equals("")) {
				start_date = end_date;
			}
			System.out.println("memberOutList ok");
			System.out.println("search_type="+search_type);
			System.out.println("search="+search);
			int listSize=5;
			int pageSize=5;
			int totalMemberOut = memberOutDao.totalMemberOut();
			
			System.out.println("controller totalMemberOut ok");
			int searchTotalMemberOut = memberOutDao.searchTotalMemberOut(search_type, search,start_date,end_date);
			System.out.println("searchTotalMemberOut="+searchTotalMemberOut);
			System.out.println("controller searchTotalMemberOut ok");
			List<MemberOutDTO> list = memberOutService.memberOutList(cp,listSize,search_type,search,start_date,end_date);
			System.out.println("list 불러오기 ok");
			String pageStr=goo.page.PageModule.adminMakePage("admin_member_out.do", searchTotalMemberOut>0?searchTotalMemberOut:1, listSize, pageSize, cp ,search_type , search ,start_date, end_date);
			
			mav.addObject("start_date", start_date);
			mav.addObject("end_date", end_date);
			mav.addObject("search", search);
			if(!search.equals("")||!start_date.equals("")||!end_date.equals("")) {
				mav.addObject("search_num", searchTotalMemberOut);
				if(!search.equals("")) {
					if(search_type.equals(search_type)) {
						mav.addObject(search_type+"_selected","selected");
					}
				}
			}else {
				mav.addObject("search_num", 0);
			}
			mav.addObject("cp", cp);
			mav.addObject("listSize", listSize);
			mav.addObject("list", list);
			mav.addObject("pageStr", pageStr);
			mav.addObject("totalMemberOut", totalMemberOut);
		}
		
		mav.setViewName("admin/member_management/admin_member_out");
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
	
	@RequestMapping("/member_out_delete.do")
	@ResponseBody
	public Map<String, Object> memberOutDelete(@RequestParam("out_no")int out_no,@RequestParam("id")String id){
		System.out.println("memberOutDelete ok");
		int result = memberOutDao.memberOutDelete(out_no);
		int result2 = memberOutDao.memberOutDelete2(id);
		int code = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(result>0) {
			if(result2>0) {
				System.out.println("삭제성공 ok");
				map.put("msg", out_no+"번째 탈퇴회원 정보를 삭제했습니다.");
				code = 1;
			}else {
				System.out.println("삭제실패 ok");
				map.put("msg", "ERROR");
				code = 2;
			}
			
		}else {
			System.out.println("삭제실패 ok");
			map.put("msg", "ERROR");
			code = 0;
		}
		
		map.put("code", code);
		return map;
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
	@ResponseBody
	public  Map<String,Object> memberUpdate(MemberDTO mdto){
		int result = adminService.memberUpdate(mdto);
		int code = 0;
		Map<String,Object> map = new HashMap<String,Object>();
		if(result>0) {
			System.out.println("수정성공 ok");
			code = 1;
			map.put("msg", mdto.getMember_idx()+"번 회원의 닉네임이 수정되었습니다.");
		}else {
			System.out.println("수정실패 ok");
			code = 0;
			map.put("msg", "ERROR");
		}
		map.put("code", code);
		return map;
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
	
	@RequestMapping("/mail_form_preview_pop.do")
	public ModelAndView mailFormPreviewPop(FormmailDTO fdto) {
		System.out.println("mailFormPreviewPop ok");
		System.out.println(fdto.getForm_no());
		System.out.println(fdto.getForm_type()+"/"+fdto.getForm_title());
		System.out.println(fdto.getForm_content());
		ModelAndView mav = new ModelAndView();
		FormmailDTO dto = formmailService.formType(fdto.getForm_type());
		formmailService.formUpdate(fdto);
		String preview = fdto.getForm_content();
		mav.addObject("preview",preview);
		formmailService.formUpdate(dto);
		mav.setViewName("admin/member_management/mail_form_preview_pop");
		return mav;
	}
	
	@RequestMapping("/selected.do")
	@ResponseBody
	public Map<String,Object> selected(@RequestParam("selected")int selected){
		System.out.println("selected 진입");
		System.out.println(selected);
		Map<String,Object> map = new HashMap<String, Object>();
		if(selected==1) {
			System.out.println("selected 1");
			map.put("msg", " 회원 = M , 광고주 = O");
		}else {
			map.put("msg", "");
		}
		return map;
	}
	
}
