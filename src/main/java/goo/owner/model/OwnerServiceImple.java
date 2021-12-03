package goo.owner.model;

import java.util.List;

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
	
	public OwnerDTO ownerAppli(int member_idx) {
		OwnerDTO dto = ownerDao.ownerAppli(member_idx);
		return dto;
	}
	public List<OwnerDTO> allOwnerSelect() {
		List<OwnerDTO> list = ownerDao.allOwnerSelect();
		return list;
	}
	public OwnerDTO getOwnerDetail(int owner_idx) {
		OwnerDTO dto= ownerDao.getOwnerDetail(owner_idx);
		if(dto!=null) {
			dto.setAd_content(dto.getAd_content().replaceAll("\n", "<br>"));
			dto.setAddr(dto.getAddr().replaceAll("\n", "<br>"));
		}
		return dto;
	}
}
