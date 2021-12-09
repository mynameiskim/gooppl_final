package goo.ad.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import goo.payment_info.model.Payment_infoDTO;

public class AdServiceImple implements AdService {
	
	private AdDAO adDao;
	
	public AdDAO getAdDao() {
		return adDao;
	}

	public void setAdDao(AdDAO adDao) {
		this.adDao = adDao;
	}
	
	public int startAD(AdDTO adto) {
		int result = adDao.startAD(adto);
		return result;
	}
	
	public int admin_refundAd_Del(String imp_uid) {
		int result = adDao.admin_refundAd_Del(imp_uid);
		return result;
	}
	
	public List<Integer> getOwnerIdx() {
		List<Integer> list= adDao.getOwnerIdx();
		return list;
	}
	
	public AdDTO getAdInfo(int owner_idx) {
		AdDTO dto = adDao.getAdInfo(owner_idx);
		return dto;
	}
	
	public int total_AdInfo() {
		int count = adDao.total_AdInfo();
		return count;
	}
	
	public int total_ingAdInfo() {
		int count = adDao.total_ingAdInfo();
		return count;
	}
	
	public int total_endAdInfo() {
		int count = adDao.total_endAdInfo();
		return count;
	}
	
	public List<AdDTO> all_AdInfo(int cp, int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<AdDTO> list = adDao.all_AdInfo(map);
		return list;
	}
	
	public List<AdDTO> all_ingAdInfo(int cp, int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<AdDTO> list = adDao.all_ingAdInfo(map);
		return list;
	}
	
	public List<AdDTO> all_endAdInfo(int cp, int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<AdDTO> list = adDao.all_endAdInfo(map);
		return list;
	}
}
