package goo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import goo.owner.model.*;
import goo.area.model.*;
import goo.sigungu.model.*;

import java.io.*;
import java.util.List;

@Controller
public class OwnerController {

	@Autowired
	private OwnerService ownerService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private SigunguService sigunguService;
	
	/**광고주 정보 입력창으로 가기 위한 명령어*/
	@RequestMapping("/adInfo.do")
	public ModelAndView adInfo(
	      @RequestParam("member_idx")int member_idx,
	      @RequestParam(value = "areacode", defaultValue="1") int areacode,
	      @RequestParam(value = "sigungucode", defaultValue="1") int sigungucode
	      ) {
	   ModelAndView mav = new ModelAndView();
	   List<AreaDTO> arealist = areaService.areaList();
	   List<SigunguDTO> sigungulist = sigunguService.sigunguList();
	   mav.addObject("member_idx", member_idx);
	   mav.addObject("arealist", arealist);
	   mav.addObject("sigungulist", sigungulist);
	   mav.setViewName("ad/addAdInfo");
	   return mav;
	}
	
	/**광고주 신청 상태 확인*/
	@RequestMapping("/ckOwnerAppli.do")
	public ModelAndView ckOwnerAppli(@RequestParam("member_idx")int member_idx) {
		OwnerDTO dto = ownerService.ckOwnerInfo(member_idx);
		ModelAndView mav = new ModelAndView();
		if(dto == null) {
			mav.setViewName("adInfo.do?member_idx="+member_idx);
		}else {
			if(dto.getState().equals("대기")) {
				mav.addObject("msg", "관리자 승인 대기 중입니다.");
				mav.addObject("goUrl", "mypage.do");
				mav.setViewName("ad/adMsg");
			}
		}
		return mav;
	}
	
	/**광고 이미지 파일 복사 관련 메서드*/
	public String copyInto(int member_idx, MultipartFile upload) {
	 
		 //이미지 경로
		 String imgUrl = "C:\\Users\\USER\\Desktop\\finalImg\\"+ upload.getOriginalFilename();
		 
		 try {
		     //원본
			 byte[] bytes = upload.getBytes();
			
			 //복사본 정보
			 File outFile = new File(imgUrl);
			 FileOutputStream fos = new FileOutputStream(outFile);
			 fos.write(bytes);
			 fos.close();
		 } catch (IOException e) {
		 	 e.printStackTrace();
			 imgUrl = "";
		 }
		 return imgUrl;
	}
	
	/**광고주 정보 등록 관련 명령어*/
	@RequestMapping("/addOwnerInfo.do")
	public ModelAndView addOwnerInfo(OwnerDTO dto) {
		System.out.println("정보등록 진입");
		String firstimg = copyInto(dto.getMember_idx(), dto.getUpload());
		dto.setFirstimg(firstimg);
		dto.setState("대기");
		int result = ownerService.addOwnerInfo(dto);
		String msg = result>0?"신청이 완료되었습니다.":"신청에 실패했습니다.";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName("ad/adMsg");
		return mav;
	}
	
}
