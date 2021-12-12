package goo.controller;

import java.util.HashMap;




import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.*;

import org.apache.http.protocol.HTTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
import goo.formmail.model.FormmailDTO;
import goo.formmail.model.FormmailService;
import goo.inquiry.model.InquiryDTO;
import goo.inquiry.model.InquiryService;
import goo.member.model.MemberDTO;
import goo.memberout.model.MemberOutDAO;
import goo.review.model.ReviewDTO;
import goo.siteSettings.model.SiteSettingsDAO;
import goo.siteSettings.model.SiteSettingsDTO;
import goo.admin.model.*;

@Controller
public class AdminBasicSettings {
	
	@Autowired
	private AdminService adminService;
	@Autowired
	private SiteSettingsDAO siteSettingsDao;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private FormmailService formmailService;
	@Autowired
	InquiryService inquiryService;
	
	private static final int EMAIL_JOIN_FORMMAIL_NO = 1;
	public static final String FAVICON_PATH="C:\\Users\\nojiw\\git\\final_git1\\src\\main\\webapp\\resource\\assets\\img\\";
	
	@RequestMapping("/admin_basic_settings.do")
	public ModelAndView adminBasicSettings(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")==null||!session.getAttribute("sessionMemberType").equals("A")) {
			mav.addObject("msg", "관리자 계정으로 로그인해주세요");
			mav.addObject("goPage", "index.do");
			mav.setViewName("admin/basic_settings/msg");
		}else {
			mav.setViewName("admin/basic_settings/admin_basic_settings");
		}
		
		return mav;
	}
	
	@RequestMapping("/admin_site_info.do")
	public ModelAndView site_info(@RequestParam(value = "goo_id", required = false)String goo_id,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")==null||!session.getAttribute("sessionMemberType").equals("A")) {
			mav.addObject("msg", "관리자 계정으로 로그인해주세요");
			mav.addObject("goPage", "index.do");
			mav.setViewName("admin/basic_settings/msg");
		}else {
			AdminDTO dto=adminService.adminInfo(goo_id);
			mav.addObject("dto", dto);
			mav.setViewName("admin/basic_settings/admin_site_info");
		}
		
		
		return mav;
	}
	
	@RequestMapping("/admin_site_settings.do")
	public ModelAndView siteSettings(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")==null||!session.getAttribute("sessionMemberType").equals("A")) {
			mav.addObject("msg", "관리자 계정으로 로그인해주세요");
			mav.addObject("goPage", "index.do");
			mav.setViewName("admin/basic_settings/msg");
		}else {
			mav.setViewName("admin/basic_settings/admin_site_settings");
		}
		return mav;
	}
	
	@RequestMapping("/admin_settings.do")
	public ModelAndView admin_settings(@RequestParam(value = "cp",defaultValue = "1")int cp,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")==null||!session.getAttribute("sessionMemberType").equals("A")) {
			mav.addObject("msg", "관리자 계정으로 로그인해주세요");
			mav.addObject("goPage", "index.do");
			mav.setViewName("admin/basic_settings/msg");
		}else {
			int listSize=5;
			int pageSize=5;
			int totalAdmin = adminService.totalAdmin();
			String pageStr=goo.page.PageModule.makePage("admin_settings.do", totalAdmin, listSize, pageSize, cp);
			System.out.println("admin_settings OK");
			List<MemberDTO> list1=adminService.allAdminMemberInfo(cp,listSize);
			List<AdminDTO> list2=adminService.allAdminInfo(cp,listSize);
			
			mav.addObject("cp", cp);
			mav.addObject("size", list2.size());
			mav.addObject("listSize", listSize);
			mav.addObject("pageStr", pageStr);
			mav.addObject("list1", list1);
			mav.addObject("list2", list2);
			mav.setViewName("admin/basic_settings/admin_settings");
		}
		
		return mav;
	}
	
	@RequestMapping("/admin_member_config.do")
	public ModelAndView member_config(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")==null||!session.getAttribute("sessionMemberType").equals("A")) {
			mav.addObject("msg", "관리자 계정으로 로그인해주세요");
			mav.addObject("goPage", "index.do");
			mav.setViewName("admin/basic_settings/msg");
		}else {
			mav.setViewName("admin/basic_settings/admin_member_config");
		}
		return mav;
	}
	
	@RequestMapping(value = "/admin_insert.do",method = RequestMethod.GET)
	public ModelAndView addAdminPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")==null||!session.getAttribute("sessionMemberType").equals("A")) {
			mav.addObject("msg", "관리자 계정으로 로그인해주세요");
			mav.addObject("goPage", "index.do");
			mav.setViewName("admin/basic_settings/msg");
		}else {
			mav.setViewName("admin/basic_settings/add_admin");
		}
		return mav;
	}
	
	@RequestMapping(value = "/admin_insert.do",method = RequestMethod.POST)
	public ModelAndView addAdmin(MemberDTO mdto,AdminDTO adto,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")==null||!session.getAttribute("sessionMemberType").equals("A")) {
			mav.addObject("msg", "관리자 계정으로 로그인해주세요");
			mav.addObject("goPage", "index.do");
			mav.setViewName("admin/basic_settings/msg");
		}else {
			System.out.println("admin_insert.do ok");
			System.out.println(mdto.getGoo_id());
			System.out.println(adto.getAdmin_phone());
			int result1 = adminService.adminInsert1(mdto);
			if(result1>0) {
				mdto= adminService.adminMemberInfo(mdto.getGoo_id());
				int member_idx=mdto.getMember_idx();
				adto.setMember_idx(member_idx);
				System.out.println("adto.getMember_idx="+adto.getMember_idx());
				System.out.println("adto.getAdmin_addr="+adto.getAdmin_addr());
				int result2 = adminService.adminInsert2(adto);
				if(result2>0) {
					mav.addObject("msg", "관리자 등록완료");
					
					FormmailDTO fdto = formmailService.emailTokenFormmail(EMAIL_JOIN_FORMMAIL_NO);
					/* 이메일 보내기 */
			        String setFrom = "w12310@naver.com";
			        String toMail = mdto.getGoo_id();
			        String title = fdto.getForm_title();
			        String content = fdto.getForm_content();
			        title = title.replace("{{NICKNAME}}", mdto.getNickname());
			        content = content.replace("{{NICKNAME}}", mdto.getNickname());
			        
			        try {
			            
			            MimeMessage message = mailSender.createMimeMessage();
			            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			            helper.setFrom(setFrom);
			            helper.setTo(toMail);
			            helper.setSubject(title);
			            helper.setText(content,true);
			            mailSender.send(message);
			            
			        }catch(Exception e) {
			            e.printStackTrace();
			        }
					
				}else {
					mav.addObject("msg", "관리자 등록실패");
				}
			}else {
				mav.addObject("msg", "관리자 등록실패");
			}
			mav.addObject("goPage", "admin_settings.do");
			mav.setViewName("admin/basic_settings/msg2");
		}
		
		return mav;
	}
	
	@RequestMapping("/admin_update.do")
	public ModelAndView admin_update(MemberDTO mdto,AdminDTO adto,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")==null||!session.getAttribute("sessionMemberType").equals("A")) {
			mav.addObject("msg", "관리자 계정으로 로그인해주세요");
			mav.addObject("goPage", "index.do");
			mav.setViewName("admin/basic_settings/msg");
		}else {
			System.out.println("admin_update OK");
			System.out.println(mdto.getMember_idx());
			System.out.println(adto.getMember_idx());
			String goPage = "admin_settings.do";
			int result1 = adminService.adminUpdate1(mdto);
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
			mav.addObject("goPage", goPage);
			mav.setViewName("admin/basic_settings/msg");
		}
		
		return mav;
	}
	
	@RequestMapping("/admin_delete")
	@ResponseBody
	public Map<String, Object> adminDelete(@RequestParam(("member_idx"))int member_idx,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		if(session.getAttribute("sessionId")==null||!session.getAttribute("sessionMemberType").equals("A")) {
			mav.addObject("msg", "관리자 계정으로 로그인해주세요");
			mav.addObject("goPage", "index.do");
			mav.setViewName("admin/basic_settings/msg");
		}else {
			System.out.println("adminDelete OK");
			
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
		}
		
		return map;
	}
	
	@RequestMapping("/admin_details.do")
	public ModelAndView adminDetails(@RequestParam(value = ("goo_id"),required = false) String goo_id,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")==null||!session.getAttribute("sessionMemberType").equals("A")) {
			mav.addObject("msg", "관리자 계정으로 로그인해주세요");
			mav.addObject("goPage", "index.do");
			mav.setViewName("admin/basic_settings/msg");
		}else {
			System.out.println("admin_details ok");
			System.out.println(goo_id);
			MemberDTO mdto=adminService.adminMemberInfo(goo_id);
			AdminDTO adto=adminService.adminInfo(goo_id);
			System.out.println(goo_id);
			mav.addObject("mdto", mdto);
			mav.addObject("adto", adto);
			mav.setViewName("admin/basic_settings/admin_details");
		}
		
		return mav;
	}
	
	@RequestMapping("/site_settings_update.do")
	public ModelAndView siteSettingsUpdate(SiteSettingsDTO sdto,@RequestParam(value ="faviconFile", required = false )MultipartFile faviconFile
			,HttpServletRequest req,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")==null||!session.getAttribute("sessionMemberType").equals("A")) {
			mav.addObject("msg", "관리자 계정으로 로그인해주세요");
			mav.addObject("goPage", "index.do");
			mav.setViewName("admin/basic_settings/msg");
		}else {
			System.out.println(faviconFile);
			System.out.println(sdto.getWeb_browser_title());
			
			String realPath = req.getRealPath("/");
			String contextPath = req.getContextPath();
			
			System.out.println("realPath="+realPath);
			String favicon="";
			if(!faviconFile.getOriginalFilename().equals("")) {
				faviconCopyInto(faviconFile,realPath);
				favicon = contextPath+"/resource/assets/img/"+faviconFile.getOriginalFilename();
				sdto.setFavicon(favicon);
			}else {
				sdto.setFavicon(favicon);
			}
			int result = siteSettingsDao.siteSettingsUpdate(sdto);
			
			if(result>0) {
				mav.addObject("msg", "수정 완료");
			}else {
				mav.addObject("msg", "수정 실패");
			}
			mav.addObject("goPage", "admin_site_settings.do");
			mav.setViewName("admin/basic_settings/msg");
		}
		return mav;
	}

	/**실제 파일 복사 관련 메서드*/
	public File faviconCopyInto(MultipartFile upload,String realPath) {
		
		System.out.println("올릴파일명:"+upload.getOriginalFilename());
		File faviconFile=null;
		try {
			byte[] bytes=upload.getBytes();
			//복사본정보
			faviconFile= new File(realPath+"/resource/assets/img/"+upload.getOriginalFilename());
			FileOutputStream fos=new FileOutputStream(faviconFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return faviconFile;
	}
	
	/*@@@@@@@@@문의 관리@@@@@@@@@*/
	@RequestMapping("/admin_inquiry.do")
	public ModelAndView admin_inquiryList(@RequestParam(value = "cp",defaultValue = "1")int cp,HttpSession session){
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("sessionId")==null||!session.getAttribute("sessionMemberType").equals("A")) {
			mav.addObject("msg", "관리자 계정으로 로그인해주세요");
			mav.addObject("goPage", "index.do");
			mav.setViewName("admin/basic_settings/msg");
		}else {
			int totalInquiry = inquiryService.totalInquiry();
			int listSize=10;
			int pageSize=10;
			Map map = new HashMap(); 
			map.put("cp", cp);
			map.put("listSize", listSize);
			List<InquiryDTO> inquiryDTO = inquiryService.getInquiryList(map);
			String pageStr=goo.page.PageModule.makePage("admin_inquiry.do",totalInquiry , listSize, pageSize, cp);
			mav.addObject("cp", cp);
			mav.addObject("size", inquiryDTO.size());
			mav.addObject("listSize", listSize);
			mav.addObject("list", inquiryDTO);
			mav.addObject("pageStr", pageStr);
			mav.addObject("totalInquiry", totalInquiry);
			mav.setViewName("admin/basic_settings/admin_inquiry");
		}
		
		return mav;
	}
	
	/**문의 답변*/
	@RequestMapping("/admin_inquiry_details.do")
	public ModelAndView admin_inquiry_details(@RequestParam(("inquiry_idx")) int inquiry_idx) {
		InquiryDTO dto = inquiryService.inquiryInfo(inquiry_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("admin/basic_settings/admin_inquiry_details");
		return mav;
	}
	
	@RequestMapping("/admin_inquiry_update.do")
	@ResponseBody
	public int admin_inquiry_update(String inquiry_answer,int inquiry_idx) {
		Map map = new HashMap();
		map.put("inquiry_answer", inquiry_answer);
		map.put("inquiry_idx", inquiry_idx);
		int result = inquiryService.inquiryUpdate(map);
		
		return result;
	}
}
