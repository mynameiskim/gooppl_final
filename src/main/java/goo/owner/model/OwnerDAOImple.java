package goo.owner.model;

import java.util.List;

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
	
	public OwnerDTO ckOwnerInfo(int member_idx) {
		OwnerDTO dto = sqlMap.selectOne("ckOwnerInfo", member_idx);
		return dto;
	}
	
	public List<OwnerDTO> allOwnerSelect() {
		List<OwnerDTO> list =sqlMap.selectList("allOwnerSelect");
		return list;
	}
	public OwnerDTO getOwnerDetail(int owner_idx) {
		OwnerDTO dto = sqlMap.selectOne("selectOwnerDetail", owner_idx);
		return dto;
	}
}
