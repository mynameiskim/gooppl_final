package goo.owner.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OwnerServiceImple implements OwnerService {

	private OwnerDAO ownerDao;

	public OwnerDAO getOwnerDao() {
		return ownerDao;
	}

	public void setOwnerDao(OwnerDAO ownerDao) {
		this.ownerDao = ownerDao;
	}
	
	public int addOwnerInfo(OwnerDTO dto) {
		int result = ownerDao.addOwnerInfo(dto);
		return result;
	}
	
	public OwnerDTO ckOwnerInfo(int member_idx) {
		OwnerDTO dto = ownerDao.ckOwnerInfo(member_idx);
		return dto;
	}
	
	public int totalOwnerAppli() {
		int count = ownerDao.totalOwnerAppli();
		return count;
	}
	
	public List<OwnerDTO> allOwnerAppliInfo(int cp, int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<OwnerDTO> list = ownerDao.allOwnerAppliInfo(map);
		return list;
	}
	
	public OwnerDTO ownerInfo(int member_idx) {
		OwnerDTO dto = ownerDao.ownerInfo(member_idx);
		return dto;
	}
}
