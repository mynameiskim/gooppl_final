package goo.mapinfo.model;

import java.util.*;

public class MapInfoServiceImple implements MapInfoService {

	private MapInfoDAO mapinfoDao;
	
	public MapInfoDAO getMapinfoDao() {
		return mapinfoDao;
	}

	public void setMapinfoDao(MapInfoDAO mapinfoDao) {
		this.mapinfoDao = mapinfoDao;
	}

	public int addMapInfo(List<MapInfoDTO> list) {
		int result=0;
		for(int i=0;i<list.size();i++) {
			result+=mapinfoDao.addMapInfo(list.get(i));
		}
		return result;
	}
	
	public List<MapInfoDTO> mapInfoList(Map map) {
		List<MapInfoDTO> list = mapinfoDao.mapInfoList(map);
		return list;
	}

	public List<Integer> getThisMapInfo(int map_idx, int day_num) {
		Map map=new HashMap();
		map.put("map_idx", map_idx);
		map.put("day_num", day_num);
		List<Integer> list=mapinfoDao.getThisMapInfo(map);
		return list;
	}
	
	public int deleteMapInfo(int map_idx, int day_num) {
		Map map = new HashMap();
		map.put("map_idx", map_idx);
		map.put("day_num", day_num);
		int result=mapinfoDao.deleteMapInfo(map);
		return result;
	}
}
