package goo.map_t.model;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import goo.review.model.ReviewDTO;

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
	
	public int updateMapDate(int map_idx, Date startdate, Date enddate) {
		Map map=new HashMap();
		map.put("map_idx", map_idx);
		map.put("startdate", startdate);
		map.put("enddate", enddate);
		int result=gooppl_mapDao.updateMapDate(map);
		return result;
	}
	
	/**### 공유게시판 목록보기 ###*/
	public List<Gooppl_mapDTO> mapList(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<Gooppl_mapDTO> list=gooppl_mapDao.mapList(map);
		return list;
	}
	public int getShareCnt() {
		int count = gooppl_mapDao.getShareCnt();
		return count;
	}
	public List<Gooppl_mapDTO> getMap(int member_idx) {
		List<Gooppl_mapDTO> mapDTO = gooppl_mapDao.getMap(member_idx);
		return mapDTO;
	}
	public int planDelete(int map_idx) {
		int count = gooppl_mapDao.planDelete(map_idx);
		return count;
	}
	
}
