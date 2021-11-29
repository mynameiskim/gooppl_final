package goo.member.model;

import java.util.Map;

public interface MemberDAO {
	
	public MemberDTO loginCheck(MemberDTO dto);
	public int naveridCheck(String naverid);
	public MemberDTO getMemberInfo(String id);
	public int naverJoin(Map hmp);
	public int kakaoidCheck(String kakaoid);
	public int kakaoJoin(Map hmp);
}
