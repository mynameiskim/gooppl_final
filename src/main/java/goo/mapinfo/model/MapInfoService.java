package goo.mapinfo.model;

import java.util.*;

public interface MapInfoService {
	public int addMapInfo(List<MapInfoDTO> list);
	public List<MapInfoDTO> mapInfoList(Map map);
	public List<Integer> getThisMapInfo(int map_idx, int day_num);
	public int deleteMapInfo(int map_idx, int day_num);
	public int getTotalPlace(int map_idx);
	public List<MapInfoDTO> shareContent(int map_idx);
	public int getMaxDaynum(int map_idx);
	public int getMaxRoutenum(int map_idx);
	public int deleteMapDay(int map_idx, int day);
	public int delThisDayAllInfo(int map_idx, int day_num);
}
