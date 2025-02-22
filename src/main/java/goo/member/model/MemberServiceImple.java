﻿package goo.member.model;

import java.util.HashMap;
import java.util.List;
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
	public int gooidCheck(String goo_id) {
		int count = memberDao.gooidCheck(goo_id);
		return count;
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
	public int gooJoin(MemberDTO dto) {
		int count = memberDao.gooJoin(dto);
		return count;
	}
	public int profileUpdate(Map hmp) {
		int count = memberDao.profileUpdate(hmp);
		return count;
	}
	public int pwdCheck(Map hmp) {
		int count = memberDao.pwdCheck(hmp);
		return count;
	}
	public int pwdChange(Map hmp) {
		int count = memberDao.pwdChange(hmp);
		return count;
	}
	public int memberOut(int member_idx) {
		int count = memberDao.memberOut(member_idx);
		return count;
	}
	
	//-----------------------------
	//회원목록 조회
	public List<MemberDTO> memberList(int cp,int ls,String search_type,String search,String start_date,String end_date) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", start);
		map.put("end",end);
		map.put("search_type", search_type);
		map.put("search", search);
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		List<MemberDTO> list = memberDao.memberList(map);
		return list;
	}
	//총 회원수
	public int totalMember() {
		int count = memberDao.totalMember();
		return count;
	}
	//회원정보
	public MemberDTO memberInfo(int member_idx) {
		MemberDTO mdto = memberDao.memberInfo(member_idx);
		return mdto;
	}
	
	public int admin_ownerAppli_typeChange(int member_idx) {
		int result = memberDao.admin_ownerAppli_typeChange(member_idx);
		return result;
	}
	
	public int admin_changeOwnerType(int member_idx) {
		int result = memberDao.admin_changeOwnerType(member_idx);
		return result;
	}
}
