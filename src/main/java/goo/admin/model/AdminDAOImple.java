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
	
	public List<AdminDTO> allAdminInfo(Map map) {
		System.out.println("DAOImple allAdminInfo OK");
		List<AdminDTO> list=sqlMap.selectList("allAdminInfo",map);
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
	public List<MemberDTO> allAdminMemberInfo(Map map) {
		System.out.println("DAOImple allAdminMemberInfo OK");
		List<MemberDTO> list=sqlMap.selectList("allAdminMemberInfo",map);
		System.out.println("SQL통과");
		return list;
	}
	
	public int adminInsert1(MemberDTO mdto) {
		System.out.println("AdminDAOImple adminInsert1 OK");
		int count = sqlMap.insert("adminInsert1", mdto);
		return count;
	}
	
	public int adminInsert2(AdminDTO adto) {
		int count = sqlMap.insert("adminInsert2", adto);
		return count;
	}
	
	public int adminUpdate1(MemberDTO mdto) {
		int count = sqlMap.update("adminUpdate1", mdto);
		return count;
	}
	
	public int adminUpdate2(AdminDTO adto) {
		int count = sqlMap.update("adminUpdate2", adto);
		return count;
	}
	
	public int totalAdmin() {
		int count = sqlMap.selectOne("totalAdmin");
		if(count==0) {
			count = 1;
		}
		return count;
	}
	
	public int adminDelete1(int member_idx) {
		int count = sqlMap.delete("adminDelete1", member_idx);
		return count;
	}
	
	public int adminDelete2(int member_idx) {
		int count = sqlMap.delete("adminDelete2", member_idx);
		return count;
	}
	
	public int memberDelete(int member_idx) {
		System.out.println("DAOImple memberDelete ok");
		int count = sqlMap.delete("memberDelete", member_idx);
		System.out.println("SQL통과");
		return count;
	}
	
	public int memberUpdate(MemberDTO mdto) {
		int count = sqlMap.update("memberUpdate", mdto);
		return count;
	}
}
