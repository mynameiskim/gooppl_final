package goo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import goo.ad.model.*;
import goo.area.model.*;
import goo.sigungu.model.*;

import java.io.*;
import java.util.List;

@Controller
public class AdController {
   
   @Autowired
   private AdService adService;
   
//   
//	@RequestMapping("/ckOwnerAppli.do")
//	public ModelAndView ckOwnerAppli(@RequestParam("member_idx")int member_idx) {
//		int result = memberService.ownerAppli(member_idx);
//		if(result==null) {
//			
//		}else {
//			
//		}
//	}
   
   
   
   
   
   
   
   
   
//   @RequestMapping("/saveOwnerInfo.do")
//	public ModelAndView savePlaceDetail(
//			@RequestParam("member_idx") int member_idx,
//			@RequestParam("title") String title,
//			@RequestParam("business_number") String business_number,
//			@RequestParam("name") String name,
//			@RequestParam("email") String email,
//			@RequestParam("business_tel") String business_tel,
//			@RequestParam("tel") String tel,
//			@RequestParam("contenttype") int contenttype,
//			@RequestParam("addr") String addr,
//			@RequestParam("detailed_addr") String detailed_addr,
//			@RequestParam("ad_content") String ad_content,
//			@RequestParam("mapx") double mapx,
//			@RequestParam("mapy") double mapy,
//			@RequestParam("areacode") int areacode,
//			@RequestParam("sigungucode") int sigungucode
//			) {
//		ModelAndView mav = new ModelAndView();
//		
//		AdDTO dto = new AdDTO(member_idx, title, business_number, name, email, business_tel, tel, contenttype, "imgpath", addr, detailed_addr, ad_content, mapx, mapy, areacode, sigungucode, "대기");
//		int result=adService.addOwnerInfo(dto);
//		mav.addObject("msg", result);
//		mav.setViewName("ad/adMsg");
//		return mav;
//	}
}