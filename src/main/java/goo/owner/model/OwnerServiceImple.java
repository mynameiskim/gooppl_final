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
	public List<OwnerDTO> allOwnerSelect() {
		List<OwnerDTO> list = ownerDao.allOwnerSelect();
		for(int i=0;i<list.size();i++) {
			list.get(i).setAd_content(list.get(i).getAd_content().replaceAll("\r\n", "<br>"));
			list.get(i).setAddr(list.get(i).getAddr().replaceAll("\r\n", "<br>"));
		}
		return list;
	}
	public OwnerDTO getOwnerDetail(int owner_idx) {
		OwnerDTO dto= ownerDao.getOwnerDetail(owner_idx);
		System.out.println(dto.getAd_content());
		if(dto!=null) {
			dto.setAd_content(dto.getAd_content().replaceAll("\r\n", "<br>"));
			dto.setAddr(dto.getAddr().replaceAll("\r\n", "<br>"));
		}
		return dto;
	}
	
	public int totalOwnerAppli() {
		int count = ownerDao.totalOwnerAppli();
		return count;
	}
	
	public int totalOwner() {
		int count = ownerDao.totalOwner();
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
	
	public OwnerDTO ownerInfo(int owner_idx) {
		OwnerDTO dto = ownerDao.ownerInfo(owner_idx);
		return dto;
	}
	
	public int admin_ownerAppli_ok(int owner_idx) {
		int result = ownerDao.admin_ownerAppli_ok(owner_idx);
		return result;
	}
	
	public int admin_ownerAppli_del(int owner_idx) {
		int result = ownerDao.admin_ownerAppli_del(owner_idx);
		return result;
	}
	
	public List<OwnerDTO> admin_allOwner(int cp, int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<OwnerDTO> list = ownerDao.admin_allOwner(map);
		return list;
	}
	
	public int admin_ownerUpdate(OwnerDTO dto) {
		int result = ownerDao.admin_ownerUpdate(dto);
		return result;
	}
}
