package goo.memberout.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberOutDAOImple implements MemberOutDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public MemberOutDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<MemberOutDTO> memberOutList(Map<String, Object> map) {
		List<MemberOutDTO> list = null;
		if(map.get("search").equals("")&&map.get("start_date").equals("")) {
			list = sqlMap.selectList("memberOutList",map);
		} else {
			System.out.println("검색 진입");
			if(!map.get("search").equals("")&&map.get("start_date").equals("")) {
				list = sqlMap.selectList("memberOutSearchList",map);
			}else if(map.get("search").equals("")&&!map.get("start_date").equals("")) {
				list = sqlMap.selectList("memberOutDateList",map);
			}else if(!map.get("search").equals("")&&!map.get("start_date").equals("")) {
				list = sqlMap.selectList("memberOutTwoSearchList",map);
			}
			
		}
		
		return list;
	}

	public int insertMemberOut(Map hmp) {
		int count = sqlMap.insert("insertMemberOut", hmp);
		return count;
	}
	public int totalMemberOut() {
		int count = sqlMap.selectOne("totalMemberOut");
		return count;
	}
	
	public int searchTotalMemberOut(String search_type,String search,String start_date,String end_date) {
		System.out.println("searchTotalMemberOut DAO ok");
		int count = 0;
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		map.put("search", search);
		map.put("search_type", search_type);
		if(search.equals("")&&start_date.equals("")) {
			count = sqlMap.selectOne("totalMemberOut");
		}else {
			if(!search.equals("")&&start_date.equals("")) {
				count = sqlMap.selectOne("searchTotalMemberOut",map);
			}else if(search.equals("")&&!start_date.equals("")) {
				count = sqlMap.selectOne("outDateTotalMemberOut",map);
			}else if(!search.equals("")&&!start_date.equals("")) {
				count = sqlMap.selectOne("twoSearchTotalMemberOut",map);
			}
			
		}
		return count;
	}
	
	public int memberOutDelete(int out_no) {
		int count = sqlMap.delete("memberOutDelete", out_no);
		return count;
	}
}
