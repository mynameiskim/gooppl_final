package goo.naver;

import java.io.IOException;                       
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.RandomStringUtils;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.util.*;
import com.github.scribejava.core.model.OAuth2AccessToken;

import goo.member.model.MemberDTO;
import goo.member.model.MemberService;

@Controller
public class NaverController {
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    @Autowired
	private MemberService memberService;

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/naverCallback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException, ParseException {
        System.out.println("여기는 callback");
        ModelAndView mav = new ModelAndView();
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        model.addAttribute("result", apiResult);
        System.out.println("result"+apiResult);
        
        /** apiResult json 구조 
         * {"resultcode":"00", "message":"success", "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
         *  **/

      //2. String형식인 apiResult를 json형태로 바꿈
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(apiResult);
        JSONObject jsonObj = (JSONObject) obj;
      //3. 데이터 파싱
      //Top레벨 단계 _response 파싱
        JSONObject response_obj = (JSONObject)jsonObj.get("response");
      //response의 nickname값 파싱
        String naver_nickname = (String)response_obj.get("nickname");
        String naver_email = (String) response_obj.get("email");
        String naver_id = (String) response_obj.get("id");
        String naver_name = (String) response_obj.get("name");
      //4.파싱 닉네임 세션으로 저장  
        int naver_id_check_result = memberService.naveridCheck(naver_id);
        
        if(naver_id_check_result>0) {
        	MemberDTO dtos = memberService.getMemberInfo(naver_id);
        	System.out.println(dtos.getNickname());
        	session.setAttribute("sessionNickname",dtos.getNickname()); //세션 생성
	        String pro_nick = dtos.getNickname().substring(0,1);
	        mav.addObject("result", apiResult);
			session.setAttribute("sessionNickname",dtos.getNickname());
			session.setAttribute("profileNick", pro_nick);
			session.setAttribute("sessionMemberType",dtos.getMember_type());
			session.setAttribute("sessionJoinType","naver");
			mav.addObject("login_result", "yes");
			mav.setViewName("redirect:/index.do");
	        
        }else {
        	String naverpwd = RandomStringUtils.randomAlphanumeric(10);
        	Map hmp = new HashedMap();
        	hmp.put("naverid", naver_id);
    		hmp.put("name", naver_name);
    		hmp.put("nickname", naver_nickname);
    		hmp.put("naverpwd", naverpwd);
        	int naver_id_join_result = memberService.naverJoin(hmp);
        	if(naver_id_join_result==1) {
        		MemberDTO dtos = memberService.getMemberInfo(naver_id);
    	        mav.addObject("result", apiResult);
    	        String pro_nick = dtos.getNickname().substring(0,1);
    	        session.setAttribute("sessionNickname",dtos.getNickname());
    			session.setAttribute("profileNick", pro_nick);
    			session.setAttribute("sessionMemberType",dtos.getMember_type());
    			session.setAttribute("sessionJoinType","naver");
    			mav.addObject("login_result", "yes");
    			mav.setViewName("redirect:/index.do");
        	}else {
        		mav.addObject("msg","회원가입 오류! 관리자에게 문의하세요.");
        		mav.setViewName("memberMsg");
        	}
        }
        return mav;
        
        
        
        /* 네이버 로그인 성공 페이지 View 호출 */
        
//      JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");
//      String snsId = jsonparse.JsonToString(jsonobj, "id");
//      String name = jsonparse.JsonToString(jsonobj, "name");
//
//      UserVO vo = new UserVO();
//      vo.setUser_snsId(snsId);
//      vo.setUser_name(name);
//
//      System.out.println(name);
//      try {
//          vo = service.naverLogin(vo);
//      } catch (Exception e) {
//          // TODO Auto-generated catch block
//          e.printStackTrace();
//      }

        
//      session.setAttribute("login",vo);
//      return new ModelAndView("user/loginPost", "result", vo);
        
    }
}
