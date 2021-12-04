package goo.controller;




import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import goo.member.model.MemberService;

@Controller
public class MainController {
	
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("/mypage.do")
	public String mypage() {
		return "member/mypage";
	}
	
	@RequestMapping("/newPwd.do")
	public ModelAndView goupdatePwd(@RequestParam("goo_id")String goo_id) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("goo_id",goo_id);
		mav.setViewName("member/newPwd");
		return mav;
	}
	@RequestMapping(value="/pwdChange.do",method=RequestMethod.POST)
	@ResponseBody
	public int pwdChange(@RequestParam("pwd")String pwd,@RequestParam("goo_id")String goo_id) {
		Map hmp = new HashedMap();
		hmp.put("pwd", pwd);
		hmp.put("goo_id",goo_id);
		int result = memberService.pwdChange(hmp);
		return result;
		
	}
	
	
	@RequestMapping(value="/pwdCheck.do",method=RequestMethod.POST)
	@ResponseBody
	public int pwdCheck(String input_pwd_check,HttpSession session) {
		int sessionMember_idx = (Integer) session.getAttribute("sessionMember_idx");
		Map hmp = new HashedMap();
		hmp.put("member_idx", sessionMember_idx);
		hmp.put("input_pwd_check", input_pwd_check);
		int result = memberService.pwdCheck(hmp);
		
		return result;
	}
	@RequestMapping(value="/profileUpdate.do",method=RequestMethod.GET)
	@ResponseBody
	public int profileUpdate(String nickname,HttpSession session)throws Exception {
		
		int member_idx = (Integer) session.getAttribute("sessionMember_idx");
		Map hmp = new HashedMap();
		hmp.put("member_idx", member_idx);
		hmp.put("nickname", nickname);
		int result = memberService.profileUpdate(hmp);
		session.setAttribute("sessionNickname", nickname);
		String pro_nick = nickname.substring(0,1);
		session.setAttribute("profileNick", pro_nick);
		return result;
	}
	
	//email 인증 관련 
	@RequestMapping(value="/mailCheck.do",method=RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email,HttpSession session) throws Exception{
		
		System.out.println("이메일 데이터 전송확인");
		System.out.println("인증번호 : " + email);
		
		String emailToken = RandomStringUtils.randomAlphanumeric(10);
		System.out.println(emailToken);
		
		/* 이메일 보내기 */
        String setFrom = "w12310@naver.com";
        String toMail = email;
        String title = "GooPPl 회원가입 인증 이메일 입니다.";
        String content = 
                "<center>\r\n"
                + "		<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"\r\n"
                + "			style=\"margin: 0; padding: 0; width: 100%; height: 100%;\"\r\n"
                + "			bgcolor=\"#ffffff\">\r\n"
                + "			<tbody>\r\n"
                + "				<tr>\r\n"
                + "					<td align=\"center\" valign=\"top\"\r\n"
                + "						style=\"margin: 0; padding: 0; width: 100%; height: 100%;\">\r\n"
                + "						<table width=\"775\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
                + "							<tbody>\r\n"
                + "								<tr>\r\n"
                + "									<td\r\n"
                + "										style=\"width: 775px; min-width: 775px; font-size: 0pt; line-height: 0pt; padding: 0; margin: 0; font-weight: normal;\">\r\n"
                + "										<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
                + "											<!-- Main -->\r\n"
                + "											<tbody>\r\n"
                + "												<tr>\r\n"
                + "													<td bgcolor=\"#212429\" style=\"padding: 80px;\">\r\n"
                + "														<table width=\"100%\" border=\"0\" cellspacing=\"0\"\r\n"
                + "															cellpadding=\"0\">\r\n"
                + "															<!-- Logo -->\r\n"
                + "															<tbody>\r\n"
                + "																<!-- All Content Exists within this table column -->\r\n"
                + "																<tr>\r\n"
                + "																	<td>\r\n"
                + "																		<table width=\"100%\" border=\"0\" cellspacing=\"0\"\r\n"
                + "																			cellpadding=\"0\">\r\n"
                + "																			<tbody>\r\n"
                + "																				<tr>\r\n"
                + "																					<td\r\n"
                + "																						style=\"font-size: 36px; line-height: 42px; font-family: 'Motiva Sans', Helvetica, Arial, sans-serif; text-align: left; padding-bottom: 30px; color: #bfbfbf; font-weight: bold;\"><span\r\n"
                + "																						style=\"color: #77b9ee;\">GooPPl</span></td>\r\n"
                + "																				</tr>\r\n"
                + "																			</tbody>\r\n"
                + "																		</table>\r\n"
                + "																		<table width=\"100%\" border=\"0\" cellspacing=\"0\"\r\n"
                + "																			cellpadding=\"0\">\r\n"
                + "																			<tbody>\r\n"
                + "																				<tr>\r\n"
                + "																					<td\r\n"
                + "																						style=\"font-size: 18px; line-height: 25px; font-family: 'Motiva Sans', Helvetica, Arial, sans-serif; text-align: left; color: #dbdbdb; padding-bottom: 30px;\">\r\n"
                + "																						해당 인증번호를 인증번호 확인란에 기입하여 주세요.</td>\r\n"
                + "																				</tr>\r\n"
                + "																			</tbody>\r\n"
                + "																		</table>\r\n"
                + "																		<table width=\"100%\" border=\"0\" cellspacing=\"0\"\r\n"
                + "																			cellpadding=\"0\">\r\n"
                + "																			<tbody>\r\n"
                + "																				<tr>\r\n"
                + "																					<td style=\"padding-bottom: 70px;\">\r\n"
                + "																						<table width=\"100%\" border=\"0\" cellspacing=\"0\"\r\n"
                + "																							cellpadding=\"0\" bgcolor=\"#17191c\">\r\n"
                + "																							<tbody>\r\n"
                + "																								<tr>\r\n"
                + "																									<td\r\n"
                + "																										style=\"padding-top: 30px; padding-bottom: 30px; padding-left: 56px; padding-right: 56px;\">\r\n"
                + "																										<table width=\"100%\" border=\"0\" cellspacing=\"0\"\r\n"
                + "																											cellpadding=\"0\">\r\n"
                + "																											<tbody>\r\n"
                + "																												<tr>\r\n"
                + "																													<td\r\n"
                + "																														style=\"font-size: 48px; line-height: 52px; font-family: 'Motiva Sans', Helvetica, Arial, sans-serif; color: #3a9aed; font-weight: bold; text-align: center;\">\r\n"
                + "																														"+emailToken+"</td>\r\n"
                + "																												</tr>\r\n"
                + "																											</tbody>\r\n"
                + "																										</table>\r\n"
                + "																									</td>\r\n"
                + "																								</tr>\r\n"
                + "																							</tbody>\r\n"
                + "																						</table>\r\n"
                + "																					</td>\r\n"
                + "																				</tr>\r\n"
                + "																			</tbody>\r\n"
                + "																		</table>\r\n"
                + "																	</td>\r\n"
                + "																</tr>\r\n"
                + "															</tbody>\r\n"
                + "														</table>\r\n"
                + "													</td>	\r\n"
                + "												</tr>\r\n"
                + "											</tbody>\r\n"
                + "										</table>\r\n"
                + "									</td>\r\n"
                + "								</tr>\r\n"
                + "							</tbody>\r\n"
                + "						</table>\r\n"
                + "					</td>\r\n"
                + "				</tr>\r\n"
                + "				<!-- END Footer -->\r\n"
                + "			</tbody>\r\n"
                + "		</table>\r\n"
                + "	</center>";
        
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
        
        return emailToken;
		
	}
	
}
