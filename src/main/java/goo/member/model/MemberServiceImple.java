package goo.member.model;

import java.util.Map;

import org.apache.commons.collections.map.HashedMap;


public class MemberServiceImple implements MemberService {
	
	private MemberDAO memberDao;
	
	public MemberDAO getMemberDao() {
		return memberDao;
	}

	public void setMemberDao(MemberDAO memberDao) {
		this.memberDao = memberDao;
	}

	public MemberDTO loginCheck(MemberDTO dto) {
		System.out.println("서비스ok");
		dto = memberDao.loginCheck(dto);
		return dto;
		
	}
	
	public int naveridCheck(String naverid) {
		int count = memberDao.naveridCheck(naverid);
		return count;
	}
	public MemberDTO getMemberInfo(String id) {
		MemberDTO dtos = memberDao.getMemberInfo(id);
		return dtos;
	}
	public int naverJoin(Map hmp) {
		int result = memberDao.naverJoin(hmp);
		return result;
	}
	public int kakaoidCheck(String kakaoid) {
		int count = memberDao.kakaoidCheck(kakaoid);
		return count;
	}
	public int kakaoJoin(Map hmp) {
		int count = memberDao.kakaoJoin(hmp);
		return count;
	}
	
}
