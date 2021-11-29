package goo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import goo.ad.model.*;

@Controller
public class AdController {
	
	@Autowired
	private AdService adService;

	@RequestMapping("/adInfo.do")
	public String adInfo() {
		return "ad/addAdInfo";
	}
	
	@RequestMapping("/ad_test.do")
	public ModelAndView adTest(AdDTO dto) {
		int result = adService.adTest(dto);
		String msg = result>0?"광고 신청 완료":"광고 신청 실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName("ad/adMsg");
		return mav;
	}
}
