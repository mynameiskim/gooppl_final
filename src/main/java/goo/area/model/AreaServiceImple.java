package goo.area.model;

import java.util.List;

public class AreaServiceImple implements AreaService {

	private AreaDAO areaDao;
	
	public AreaDAO getAreaDao() {
		return areaDao;
	}

	public void setAreaDao(AreaDAO areaDao) {
		this.areaDao = areaDao;
	}

	public List<AreaDTO> areaList() {
		List<AreaDTO> list = areaDao.areaList();
		return list;
	}

}
