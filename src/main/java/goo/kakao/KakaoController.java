package goo.kakao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.RandomStringUtils;
import org.codehaus.jackson.JsonNode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import goo.member.model.MemberDTO;

import java.io.IOException;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import java.util.*;
import com.github.scribejava.core.model.OAuth2AccessToken;

import goo.member.model.MemberService;



@Controller
public class KakaoController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/kakaoCallback.do", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView(); 
		// 결과값을 node에 담아줌
		JsonNode node = KakaoApi.getAccessToken(code);
		// accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token");
		// 사용자의 정보
		JsonNode userInfo = KakaoApi.getKakaoUserInfo(accessToken);
		String kemail = null;
		String knickname=null;
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		kemail = kakao_account.path("email").asText();
		knickname = properties.path("nickname").asText();
		String kakao_id = "kakao_"+kemail;
		System.out.println(kakao_id);
		
		//로그인
		int kakao_id_check_result = memberService.kakaoidCheck(kakao_id);
        
        if(kakao_id_check_result>0) {
        	MemberDTO dtos = memberService.getMemberInfo(kakao_id);
        	System.out.println(dtos.getNickname());
        	session.setAttribute("sessionNickname",dtos.getNickname()); //세션 생성
	        String pro_nick = dtos.getNickname().substring(0,1);
			session.setAttribute("sessionNickname",dtos.getNickname());
			session.setAttribute("sessionMember_idx",dtos.getMember_idx());
			session.setAttribute("profileNick", pro_nick);
			session.setAttribute("sessionMemberType",dtos.getMember_type());
			session.setAttribute("sessionJoinType","kakao");
			mav.addObject("login_result", "yes");
			mav.setViewName("redirect:/index.do");
	        
        }else {
        	String kakaopwd = RandomStringUtils.randomAlphanumeric(10);
        	Map hmp = new HashedMap();
        	hmp.put("kakaoid", kakao_id);
    		hmp.put("nickname", knickname);
    		hmp.put("kakaopwd", kakaopwd);
        	int kakao_id_join_result = memberService.kakaoJoin(hmp);
        	if(kakao_id_join_result==1) {
        		MemberDTO dtos = memberService.getMemberInfo(kakao_id);
    	        String pro_nick = dtos.getNickname().substring(0,1);
    	        session.setAttribute("sessionNickname",dtos.getNickname());
    	        session.setAttribute("sessionMember_idx",dtos.getMember_idx());
    			session.setAttribute("profileNick", pro_nick);
    			session.setAttribute("sessionMemberType",dtos.getMember_type());
    			session.setAttribute("sessionJoinType","kakao");
    			mav.addObject("login_result", "yes");
    			mav.setViewName("redirect:/index.do");
        	}else {
        		mav.addObject("msg","회원가입 오류! 관리자에게 문의하세요.");
        		mav.setViewName("memberMsg");
        	}
        }
        return mav;
		// end kakaoLogin()
	}

	

	
}

