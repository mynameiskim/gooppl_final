package goo.ad.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class AdDAOImple implements AdDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public AdDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	public int startAD(AdDTO adto) {
		int result = sqlMap.insert("startAD",adto);
		return result;
	}
	public int admin_refundAd_Del(String imp_uid) {
		int result = sqlMap.update("admin_refundAd_Del", imp_uid);
		return result;
	}
	public AdDTO getAdInfo(int owner_idx) {
		AdDTO dto = sqlMap.selectOne("getAdInfo", owner_idx);
		return dto;
	}
	public List<Integer> getOwnerIdx() {
		List<Integer> ownerList = sqlMap.selectList("getOwnerIdx");
		return ownerList;
	}
}
