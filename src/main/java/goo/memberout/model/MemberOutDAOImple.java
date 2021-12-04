package goo.memberout.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberOutDAOImple implements MemberOutDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public MemberOutDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<MemberOutDTO> memberOutList() {
		List<MemberOutDTO> list = sqlMap.selectList("memberOutList");
		return list;
	}
}
