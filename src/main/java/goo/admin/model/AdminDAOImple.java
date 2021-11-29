package goo.admin.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import goo.member.model.MemberDTO;

public class AdminDAOImple implements AdminDAO {
	
	
	private SqlSessionTemplate sqlMap;
	
	public AdminDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int loginCheck(Map map) {
		System.out.println("DAOImple loginCheck OK");
		int count=sqlMap.selectOne("loginCheck2", map);
		System.out.println("SQL통과");
		return count;
	}
	
	public void loginRecode(int member_idx) {
		System.out.println("DAOImple loginRecode OK");
		sqlMap.update("loginRecode", member_idx);
		System.out.println("SQL통과");
	}
	
	public AdminDTO adminInfo(String goo_id) {
		System.out.println("DAOImple adminInfo OK");
		AdminDTO dto=sqlMap.selectOne("adminInfo",goo_id);
		System.out.println("SQL통과");
		return dto;
	}
	
	public List<AdminDTO> allAdminInfo() {
		System.out.println("DAOImple allAdminInfo OK");
		List<AdminDTO> list=sqlMap.selectList("allAdminInfo");
		System.out.println("SQL통과");
		return list;
	}
	
	public MemberDTO adminMemberInfo(String goo_id) {
		System.out.println("DAOImple adminMemberInfo OK");
		MemberDTO dto=sqlMap.selectOne("adminMemberInfo",goo_id);
		System.out.println("SQL통과");
		return dto;
	}
	
	//회원 테이블에서 타입이 관리자인 회원목록 불러오기
	public List<MemberDTO> allAdminMemberInfo() {
		System.out.println("DAOImple allAdminMemberInfo OK");
		List<MemberDTO> list=sqlMap.selectList("allAdminMemberInfo");
		System.out.println("SQL통과");
		return list;
	}
}
