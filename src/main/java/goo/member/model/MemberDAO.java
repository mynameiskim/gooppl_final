package goo.member.model;

import java.util.List;
import java.util.Map;

public interface MemberDAO {
	
	public MemberDTO loginCheck(MemberDTO dto);
	public int naveridCheck(String naverid);
	public MemberDTO getMemberInfo(String id);
	public int naverJoin(Map hmp);
	public int kakaoidCheck(String kakaoid);
	public int kakaoJoin(Map hmp);
	public int gooidCheck(String goo_id);
	public int gooJoin(MemberDTO dto);
	public int profileUpdate(Map hmp);
	public int pwdCheck(Map hmp);
	public int pwdChange(Map hmp);
	public List<MemberDTO> memberList(Map<String,Object> map);//회원목록
	public int totalMember();//총 회원수
	public MemberDTO memberInfo(int member_idx); //회원 정보
	public int admin_ownerAppli_typeChange(int member_idx);
	public int searchTotalMember(String search_type,String search,String start_date,String end_date);
}
