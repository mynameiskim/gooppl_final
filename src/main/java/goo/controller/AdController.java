package goo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import goo.ad.model.*;
import goo.area.model.*;
import goo.sigungu.model.*;

@Controller
public class AdController {
   
   @Autowired
   private AdService adService;
   @Autowired
   private AreaService areaService;
   @Autowired
   private SigunguService sigunguService;

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