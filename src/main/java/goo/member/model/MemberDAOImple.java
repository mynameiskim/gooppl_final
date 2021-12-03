package goo.member.model;

import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public MemberDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public MemberDTO loginCheck(MemberDTO dto) {
		System.out.println("daoOK");
		dto = sqlMap.selectOne("loginCheck",dto);
		System.out.println("sqlOk");
		return dto;
	}
	public int gooidCheck(String goo_id) {
		int count = sqlMap.selectOne("gooidCheck",goo_id);
		return count;
	}
	
	public int naveridCheck(String naverid) {
		
		int count = sqlMap.selectOne("naveridcheck",naverid);
		return count;
	}
	public MemberDTO getMemberInfo(String id) {
		MemberDTO dtos = sqlMap.selectOne("getMemberInfo",id);
		return dtos;
	}
	public int naverJoin(Map hmp) {
		int result = sqlMap.insert("naverjoin",hmp);
		return result;
	}
	public int kakaoidCheck(String kakaoid) {
		int count = sqlMap.selectOne("kakaoidCheck",kakaoid);
		return count;
	}
	
	public int kakaoJoin(Map hmp) {
		int count = sqlMap.insert("kakaojoin",hmp);
		return count;
	}
	public int gooJoin(MemberDTO dto) {
		int count = sqlMap.insert("gooJoin",dto);
		return count;
	
	
	
	public int ownerAppli(int member_idx) {
		int result = sqlMap.selectOne("ownerAppli", member_idx);
		return result;
	}
	
	//--------------------------
		//회원목록 조회
		public List<MemberDTO> memberList(Map map) {
			List<MemberDTO> list = sqlMap.selectList("memberList",map);
			return list;
		}
		//총 회원수
		public int totalMember() {
			int count = sqlMap.selectOne("totalMember");
			if(count==0) {
				count = 1;
			}
			return count;
		}
		//회원정보
		public MemberDTO memberInfo(int member_idx) {
			MemberDTO mdto = sqlMap.selectOne("memberInfo", member_idx);
			return mdto;
		}
}
