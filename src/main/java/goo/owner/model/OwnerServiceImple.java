package goo.owner.model;

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
}
