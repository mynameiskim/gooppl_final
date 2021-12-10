package goo.ad.model;

import java.util.List;
import java.util.Map;

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
	public int total_AdInfo() {
		int count = sqlMap.selectOne("total_AdInfo");
		return count;
	}
	public int total_ingAdInfo() {
		int count = sqlMap.selectOne("total_ingAdInfo");
		return count;
	}
	public int total_endAdInfo() {
		int count = sqlMap.selectOne("total_endAdInfo");
		return count;
	}
	public List<AdDTO> all_AdInfo(Map map) {
		List<AdDTO> list = sqlMap.selectList("all_AdInfo", map);
		return list;
	}
	public List<AdDTO> all_ingAdInfo(Map map) {
		List<AdDTO> list = sqlMap.selectList("all_ingAdInfo", map);
		return list;
	}
	public List<AdDTO> all_endAdInfo(Map map) {
		List<AdDTO> list = sqlMap.selectList("all_endAdInfo", map);
		return list;
	}
	public AdDTO ad_info(int ad_idx) {
		AdDTO dto = sqlMap.selectOne("ad_info", ad_idx);
		return dto;
	}
	public int ckAd_info(int owner_idx) {
		int result = sqlMap.selectOne("ckAd_info", owner_idx);
		return result;
	}
	public int pay_Update_ad_info(int owner_idx) {
		int result = sqlMap.update("pay_Update_ad_info", owner_idx);
		return result;
	}
}
