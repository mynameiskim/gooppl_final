package goo.map_t.model;

import java.util.List;

import goo.mapinfo.model.MapInfoDAO;

public class Gooppl_mapServiceImple implements Gooppl_mapService {

	private Gooppl_mapDAO gooppl_mapDao;
	private MapInfoDAO mapInfoDao;
	
	public Gooppl_mapDAO getGooppl_mapDao() {
		return gooppl_mapDao;
	}

	public void setGooppl_mapDao(Gooppl_mapDAO gooppl_mapDao) {
		this.gooppl_mapDao = gooppl_mapDao;
	}

	public int getMapidx(Gooppl_mapDTO dto) {
		int result=gooppl_mapDao.getMapIdx(dto);
		return result;
	}

	public int getMemberIdx(int map_idx) {
		int result=gooppl_mapDao.getMemberIdx(map_idx);
		return result;
	}
	
	public Gooppl_mapDTO getMapt(int map_idx) {
		Gooppl_mapDTO dto=gooppl_mapDao.getMapt(map_idx);
		return dto;
	}
	
	public int updateMap(Gooppl_mapDTO dto) {
		int result=gooppl_mapDao.updateMap(dto);
		return result;
	}
	public List<Gooppl_mapDTO> getMap(int member_idx) {
		List<Gooppl_mapDTO> mapDTO = gooppl_mapDao.getMap(member_idx);
		return mapDTO;
	}
	
	
}
