package goo.ad.model;

import java.util.List;

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
}
