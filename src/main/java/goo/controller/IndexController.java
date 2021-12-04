package goo.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import goo.area.model.*;
import goo.kakao.KakaoApi;
import goo.naver.NaverLoginBO;
import goo.sigungu.model.*;

@Controller
public class IndexController {

	private NaverLoginBO naverLoginBO;
	private KakaoApi kakaoApi;
	private String apiResult = null;

	@Autowired
	private AreaService areaService;
	@Autowired
	private SigunguService sigunguService;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@RequestMapping(value = "/index.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView login(Model model, HttpSession session,@RequestParam(value= "login_result",defaultValue="start") String login_result,@RequestParam(value= "join_result",defaultValue="") String join_result) {
		
		ModelAndView mav = new ModelAndView();
		
		String sid=(String)session.getAttribute("sessionId");
		if(sid==null||sid.equals("")) {
			mav.addObject("open_login", 1);
		}else {
			mav.addObject("open_login", 0);
		}
		
		if(login_result.equals("start")) {
			/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			/* 카카오 아이디로 인증 URL을 생성하기 위해 KakaoApi 클래스의 겟오토라이즈션Url 메서드 호출*/
			String kakaoUrl = KakaoApi.getAuthorizationUrl(session);
	
	
			// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
			// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
			System.out.println("네이버:" + naverAuthUrl);
			System.out.println("카카오:" + kakaoUrl);
	
			// 네이버
			mav.addObject("naver_url", naverAuthUrl);
			//카카오
			mav.addObject("kakao_url", kakaoUrl);
			
		}else if(login_result.equals("no")){
			/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			/* 카카오 아이디로 인증 URL을 생성하기 위해 KakaoApi 클래스의 겟오토라이즈션Url 메서드 호출*/
			String kakaoUrl = KakaoApi.getAuthorizationUrl(session);
	
	
			// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
			// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
			System.out.println("네이버:" + naverAuthUrl);
			System.out.println("카카오:" + kakaoUrl);
	
			// 네이버
			mav.addObject("naver_url", naverAuthUrl);
			//카카오
			mav.addObject("kakao_url", kakaoUrl);
			
			mav.addObject("login_result",login_result );
		}else if(login_result.equals("yes")) {
			/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			/* 카카오 아이디로 인증 URL을 생성하기 위해 KakaoApi 클래스의 겟오토라이즈션Url 메서드 호출*/
			String kakaoUrl = KakaoApi.getAuthorizationUrl(session);
	
	
			// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
			// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
			System.out.println("네이버:" + naverAuthUrl);
			System.out.println("카카오:" + kakaoUrl);
	
			// 네이버
			mav.addObject("naver_url", naverAuthUrl);

			//카카오
			mav.addObject("kakao_url", kakaoUrl);
			mav.addObject("login_result",login_result );
		}
		
		if(join_result.equals("ok")) {
			mav.addObject("join_result",join_result );
		}
		
		mav.setViewName("index");
		/* 생성한 인증 URL을 View로 전달 */
		return mav;
	}

	@RequestMapping("/createMap.do")
	public ModelAndView newMap(
			@RequestParam(value = "areacode", defaultValue="1") int areacode,
			@RequestParam(value = "sigungucode", defaultValue="1") int sigungucode,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();

		String session_id=(String)session.getAttribute("sessionId");
		/**
		if(session_id==null||session_id.equals("")) {
			mav.setViewName("redirect:index.do");
		}else {
		*/
			mav.addObject("member_idx", 1);
			List<AreaDTO> arealist = areaService.areaList();
			List<SigunguDTO> sigungulist = sigunguService.sigunguList();
			mav.addObject("arealist", arealist);
			mav.addObject("sigungulist", sigungulist);
			mav.addObject("areacode", areacode);
			mav.addObject("sigungucode", sigungucode);
			mav.setViewName("map/newMap");
		
		
		return mav;
	}

}
