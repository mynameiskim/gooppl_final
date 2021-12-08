package goo.owner.model;

import java.util.ArrayList;
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
	
	public List<OwnerDTO> allOwnerSelect(List<Integer> ownerIdxList) {
		List<OwnerDTO> list=new ArrayList<OwnerDTO>();
		for(int i=0;i<ownerIdxList.size();i++) {
			int owner_idx=ownerIdxList.get(i);
			OwnerDTO dto = sqlMap.selectOne("selectOwnerDetail", owner_idx);
			list.add(dto);
		}
		return list;
	}
	
	public OwnerDTO getOwnerDetail(int owner_idx) {
		OwnerDTO dto = sqlMap.selectOne("selectOwnerDetail", owner_idx);
		return dto;
	}
	
	public int totalOwnerAppli() {
		int count = sqlMap.selectOne("totalOwnerAppli");
		if(count==0) {
			count = 1;
		}
		return count;
	}
	
	public int totalOwner() {
		int count = sqlMap.selectOne("totalOwner");
		return count;
	}
	
	public List<OwnerDTO> allOwnerAppliInfo(Map map) {
		System.out.println("모든 광고주 요청 데이터 뽑기");
		List<OwnerDTO> list = sqlMap.selectList("allOwnerAppliInfo", map);
		System.out.println("광고주 요청 SQL통과");
		return list;
	}
	
	public OwnerDTO ownerInfo(int owner_idx) {
		OwnerDTO dto = sqlMap.selectOne("ownerInfo",owner_idx);
		return dto;
	}
	
	public int admin_ownerAppli_ok(int owner_idx) {
		int result = sqlMap.update("admin_ownerAppli_ok", owner_idx);
		return result;
	}
	
	public int admin_ownerAppli_del(int owner_idx) {
		int result = sqlMap.delete("admin_ownerAppli_del", owner_idx);
		return result;
	}
	
	public List<OwnerDTO> admin_allOwner(Map map) {
		List<OwnerDTO> list = sqlMap.selectList("admin_allOwner", map);
		return list;
	}
	
	public int admin_ownerUpdate(OwnerDTO dto) {
		int result = sqlMap.update("admin_ownerUpdate", dto);
		return result;
	}
	
	public int ckBusinessNum(String business_number) {
		int result = sqlMap.selectOne("ckBusinessNum",business_number);
		return result;
	}
	
	public int admin_owner_del(int owner_idx) {
		int result = sqlMap.delete("admin_owner_del", owner_idx);
		return result;
	}
}
