package goo.member.model;

import java.sql.*;
import java.util.HashMap;
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
}
