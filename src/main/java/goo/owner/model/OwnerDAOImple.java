package goo.owner.model;

import org.mybatis.spring.SqlSessionTemplate;

public class OwnerDAOImple implements OwnerDAO {

	private SqlSessionTemplate sqlMap;
	
	public OwnerDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int addOwnerInfo(OwnerDTO dto) {
		int result = sqlMap.insert("addOwnerInfo",dto);
		return result;
	}
	
	public OwnerDTO ownerAppli(int member_idx) {
		OwnerDTO dto = sqlMap.selectOne("ownerAppli", member_idx);
		return dto;
	}
}
