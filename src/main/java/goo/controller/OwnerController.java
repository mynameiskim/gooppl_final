package goo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import goo.owner.model.*;
import goo.area.model.*;
import goo.sigungu.model.*;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

@Controller
public class OwnerController {

	@Autowired
	ServletContext sc;
	@Autowired
	private OwnerService ownerService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private SigunguService sigunguService;
	
	/**광고주 정보 입력창으로 가기 위한 명령어*/
	@RequestMapping("/adInfo.do")
	public ModelAndView adInfo(
			HttpSession session,
	      @RequestParam(value = "areacode", defaultValue="1") int areacode,
	      @RequestParam(value = "sigungucode", defaultValue="1") int sigungucode
	      ) {
	   System.out.println("addInfo1도착");
	   int member_idx = (Integer) session.getAttribute("sessionMember_idx");
	   System.out.println("member_idx:"+member_idx);
	   ModelAndView mav = new ModelAndView();
	   List<AreaDTO> arealist = areaService.areaList();
	   List<SigunguDTO> sigungulist = sigunguService.sigunguList();
	   mav.addObject("member_idx", member_idx);
	   mav.addObject("arealist", arealist);
	   mav.addObject("sigungulist", sigungulist);
	   mav.setViewName("ad/addAdInfo");
	   return mav;
	}
	
	/**사업자번호 중복체크*/
	@RequestMapping("/ckBusinessNum.do")
	@ResponseBody
	public int ckBusinessNum(String business_number) throws Exception{
		int result = ownerService.ckBusinessNum(business_number);
		return result;
	}
	
	/**광고주 신청 상태 확인*/
	@RequestMapping("/ckOwnerAppli.do")
	@ResponseBody
	public Map<String, Object> ckOwnerAppli(@RequestParam("member_idx")int member_idx) {
		System.out.println("ckOwnerAppli2.do 들어왔다");
		Map<String, Object> map = new HashMap<String, Object>();
		int code=0;
		OwnerDTO dto = ownerService.ckOwnerInfo(member_idx);
		if(dto == null) {
			code = 1;
		}else {
			code = 0;
			System.out.println("dto 있따");
		}
		map.put("code", code);
		return map;
	}
	
	/**업로드 폴더 생성 관련 메서드*/
	public String userFolderExist(int member_idx) {
		
		//이미지 경로
		String realPath = sc.getRealPath("\\resource\\img\\owner");
		String imgUrl=realPath+"\\"+member_idx;
		
		File f=new File(imgUrl);
		if(!f.exists()) {
			f.mkdir();
		}
		
		
		//해당 폴더에 이미지가 있으면 삭제
		File files[] = f.listFiles();
		if(!(files==null||files.length==0)) {
			for(int i=0; i<files.length; i++) {
				files[i].delete();
			}
		}
		System.out.println("realPath: "+imgUrl);
		
		return imgUrl;
	}
	
	/**광고 이미지 파일 복사 관련 메서드*/
	public String copyInto(String imgUrl, int member_idx, MultipartFile upload) {
		
		String dbUrl = null;
		
		 try {
		     //원본
			 byte[] bytes = upload.getBytes();
			
			 //복사본 정보
			 File outFile = new File(imgUrl+"\\"+upload.getOriginalFilename());
			 FileOutputStream fos = new FileOutputStream(outFile);
			 System.out.println("outFile: "+outFile);
			 
			 String contextPath = sc.getContextPath();
			 dbUrl = contextPath + "\\resource\\img\\owner\\" + member_idx + "\\" + upload.getOriginalFilename();
			 
			 System.out.println("db에 들어갈 경로:"+dbUrl);
			 
			 fos.write(bytes);
			 fos.close();
		 } catch (IOException e) {
		 	 e.printStackTrace();
		 	dbUrl = "";
		 }
		 return dbUrl;
	}
	
	
	/**광고주 정보 등록 관련 명령어*/
	@RequestMapping("/addOwnerInfo.do")
	@ResponseBody
	public  Map<String, Object> addOwnerInfo(
			@ModelAttribute("dto")OwnerDTO dto,
			@RequestParam("upload")MultipartFile upload) {
		System.out.println("정보등록 진입");
		Map<String, Object> map = new HashMap<String, Object>();
		int code = 0;
		int member_idx = dto.getMember_idx();
		System.out.println("member_idx:"+member_idx);
		String imgUrl = userFolderExist(member_idx);
		System.out.println("imgUrl:"+ imgUrl+"member_idx:"+ member_idx);
		String firstimg = copyInto(imgUrl, member_idx, dto.getUpload());
		System.out.println(firstimg);
		dto.setFirstimg(firstimg);
		dto.setState("대기");
		System.out.println("광고 정보 수정 전:"+dto.getAd_content());
		dto.setAd_content(dto.getAd_content().replaceAll("<br>","\r\n"));
		dto.setAd_content(dto.getAd_content().replaceAll("<br/>","\r\n"));
		System.out.println("광고 정보 수정 후:"+dto.getAd_content());
		System.out.println("db 등록 전");
		int result = ownerService.addOwnerInfo(dto);
		System.out.println("db 등록 후");
		if(result>0) {
			System.out.println("신청 완료");
			map.put("msg", "신청이 완료되었습니다.");
			code = 1;
		}else {
			System.out.println("신청 실패");
			map.put("msg", "신청에 실패했습니다.");
			code = 0;
		}
		map.put("code", code);
		return map;
	}
	
	/**광고주 정보 수정 페이지 이동 명령어*/
	@RequestMapping("/go_updateOwnerInfo.do")
	public ModelAndView updateOwnerInfo(HttpSession session) {
		System.out.println("owner 정보수정 진입");
		int member_idx = (Integer) session.getAttribute("sessionMember_idx");
		OwnerDTO odto = ownerService.ckOwnerInfo(member_idx);
		List<AreaDTO> arealist = areaService.areaList();
		List<SigunguDTO> sigungulist = sigunguService.sigunguList();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("odto", odto);
		mav.addObject("arealist",arealist);
		mav.addObject("sigungulist",sigungulist);
		mav.setViewName("ad/updateAdInfo");
		return mav;
	}
	
	/**광고주 정보 업데이트 관련 명령어*/
	@RequestMapping("/updateOwnerInfo.do")
	public ModelAndView updateOwnerInfo(@ModelAttribute("dto")OwnerDTO dto)throws IOException{
		System.out.println("정보등록 진입");
		int member_idx = dto.getMember_idx();
		double mapx = dto.getMapx();
		String title = dto.getTitle();
		System.out.println("member_idx:"+member_idx);
		System.out.println("mapx:" + mapx);
		System.out.println("title:"+title);
		String firstimg = null;
		// 파일 업로드 처리
	      MultipartFile uploadFile = dto.getUpload();
	      if (uploadFile.isEmpty()) {
	        
			System.out.println("upload가 널");
			//result = ownerService.update_ownerInfo_withoutFile(dto);
			OwnerDTO originDto = ownerService.ckOwnerInfo(member_idx);
			firstimg = originDto.getFirstimg();
			System.out.println("firstimg  "+firstimg);
		}else {
			String imgUrl = userFolderExist(member_idx);
			System.out.println("imgUrl:"+ imgUrl+"member_idx:"+ member_idx);
			firstimg = copyInto(imgUrl, member_idx, dto.getUpload());
			System.out.println(firstimg);
		}
		dto.setFirstimg(firstimg);
		System.out.println("db 등록 전");
		int result = ownerService.update_ownerInfo_withFile(dto);
		System.out.println("db 등록 후");
		String msg = result>0?"수정이 완료되었습니다.":"수정에 실패했습니다.";
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("goUrl","mypage.do");
		mav.setViewName("ad/adMsg");
		return mav;
	}
	
	/**광고주 정보 업데이트 관련 명령어(관리자)*/
	@RequestMapping("/admin_ownerUpdate.do")
	@ResponseBody
	public Map<String, Object> admin_ownerUpdate(@ModelAttribute("dto")OwnerDTO dto)throws IOException{
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println("admin_owner정보수정 진입");
		int code = 0;
		
		int member_idx = dto.getMember_idx();
		System.out.println("member_idx: "+member_idx);
		String firstimg = null;
		// 파일 업로드 처리
	    MultipartFile uploadFile = dto.getUpload();
	    if (uploadFile.isEmpty()) {
	        
			System.out.println("upload가 널");
			//result = ownerService.update_ownerInfo_withoutFile(dto);
			OwnerDTO originDto = ownerService.ckOwnerInfo(member_idx);
			firstimg = originDto.getFirstimg();
			System.out.println("without_firstimg  "+firstimg);
		}else {
			String imgUrl = userFolderExist(member_idx);
			System.out.println("imgUrl:"+ imgUrl+"member_idx:"+ member_idx);
			firstimg = copyInto(imgUrl, member_idx, dto.getUpload());
			System.out.println("with:"+firstimg);
		}
		dto.setFirstimg(firstimg);
		
		System.out.println("db 등록 전");
		int result = ownerService.update_ownerInfo_withFile(dto);
		System.out.println("db 등록 후");
		if(result>0) {
			map.put("msg", "수정 완료");
			code=1;
		}else {
			map.put("msg", "ERROR");
			code=0;
		}
		map.put("code", code);
		return map;
	}
}
