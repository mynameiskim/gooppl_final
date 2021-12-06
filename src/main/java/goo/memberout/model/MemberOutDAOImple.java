package goo.memberout.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberOutDAOImple implements MemberOutDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public MemberOutDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<MemberOutDTO> memberOutList(Map map) {
		List<MemberOutDTO> list = sqlMap.selectList("memberOutList",map);
		return list;
	}
	public int insertMemberOut(Map hmp) {
		int count = sqlMap.insert("insertMemberOut", hmp);
		return count;
	}
	public int totalMemberOut() {
		int count = sqlMap.selectOne("totalMemberOut");
		if(count==0) {
			count = 1;
		}
		return count;
	}
	
	public int memberOutDelete(int out_no) {
		int count = sqlMap.delete("memberOutDelete", out_no);
		return count;
	}
}
