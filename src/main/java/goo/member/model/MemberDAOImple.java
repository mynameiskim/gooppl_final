package goo.member.model;

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
	}
	
	
	public int pwdCheck(Map hmp) {
		int count = sqlMap.selectOne("pwdCheck",hmp);
		return count;
	}
	
	public int pwdChange(Map hmp) {
		int count = sqlMap.update("pwdChange",hmp);
		return count;
	}

	
	public int ownerAppli(int member_idx) {
		int result = sqlMap.selectOne("ownerAppli", member_idx);
		return result;
	}
	public int profileUpdate(Map hmp) {
		int count = sqlMap.update("profileUpdate",hmp);
		return count;
	}
	
	
	//--------------------------
	//회원목록 조회
	public List<MemberDTO> memberList(Map<String,Object> map) {
		List<MemberDTO> list = null;
		if(map.get("search").equals("")&&map.get("start_date").equals("")) {
			list = sqlMap.selectList("memberList",map);
		} else {
			System.out.println("검색 진입");
			if(!map.get("search").equals("")&&map.get("start_date").equals("")) {
				list = sqlMap.selectList("memberSearchList",map);
			}else if(map.get("search").equals("")&&!map.get("start_date").equals("")) {
				list = sqlMap.selectList("memberJoinDateList",map);
			}else if(!map.get("search").equals("")&&!map.get("start_date").equals("")) {
				list = sqlMap.selectList("memberTwoSearchList",map);
			}
			
		}
		return list;
	}
	//총 회원수
	public int totalMember() {
		int count = sqlMap.selectOne("totalMember");
		return count;
	}
	//회원정보
	public MemberDTO memberInfo(int member_idx) {
		MemberDTO mdto = sqlMap.selectOne("memberInfo", member_idx);
		return mdto;
	}
		
	public int admin_ownerAppli_typeChange(int member_idx) {
		int result = sqlMap.update("admin_ownerAppli_typeChange", member_idx);
		return result;
	}
	
	public int searchTotalMember(String search_type, String search, String start_date, String end_date) {
		int count = 0;
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		map.put("search", search);
		map.put("search_type", search_type);
		if(search.equals("")&&start_date.equals("")) {
			count = sqlMap.selectOne("totalMember");
		}else {
			if(!search.equals("")&&start_date.equals("")) {
				count = sqlMap.selectOne("searchTotalMember",map);
			}else if(search.equals("")&&!start_date.equals("")) {
				count = sqlMap.selectOne("joinDateTotalMember",map);
			}else if(!search.equals("")&&!start_date.equals("")) {
				count = sqlMap.selectOne("twoSearchTotalMember",map);
			}
			
		}
		return count;
	}
}
