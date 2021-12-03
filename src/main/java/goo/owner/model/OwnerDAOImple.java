package goo.owner.model;

import java.util.List;
import java.util.Map;

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
	
	public int totalOwnerAppli() {
		int count = sqlMap.selectOne("totalOwnerAppli");
		if(count==0) {
			count = 1;
		}
		return count;
	}
	
	public List<OwnerDTO> allOwnerAppliInfo(Map map) {
		System.out.println("모든 광고주 요청 데이터 뽑기");
		List<OwnerDTO> list = sqlMap.selectList("allOwnerAppliInfo", map);
		System.out.println("광고주 요청 SQL통과");
		return list;
	}
	
	public OwnerDTO ownerInfo(int member_idx) {
		OwnerDTO dto = sqlMap.selectOne("ownerInfo",member_idx);
		return null;
	}
}
