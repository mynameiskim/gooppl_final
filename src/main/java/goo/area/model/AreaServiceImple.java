package goo.area.model;

import java.util.ArrayList;
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

	public String getAreaName(int areacode) {
		String areaName=areaDao.getAreaName(areacode);
		return areaName;
	}
	public List<AreaDTO> getAreaInfo(List<Integer> contentids) {
		List<AreaDTO> arealist = new ArrayList();
		for(int i=0;i<contentids.size();i++) {
			int contentid=contentids.get(i);
			AreaDTO dto = areaDao.getAreaInfo(contentid);
			arealist.add(dto);
		}
		return arealist;
	}
}
