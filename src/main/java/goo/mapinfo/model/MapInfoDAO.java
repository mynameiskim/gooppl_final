package goo.mapinfo.model;

import java.util.*;

public interface MapInfoDAO {

	public int addMapInfo(MapInfoDTO dto);
	public List<MapInfoDTO> mapInfoList(Map map);
	public List<Integer> getThisMapInfo(Map map);
	public int deleteMapInfo(Map map);
	public int getTotalPlace(int map_idx);
	public List<MapInfoDTO> shareContent(int map_idx);
	public int getMaxDaynum(int map_idx);
	public int getMaxRoutenum(Map map);
	public int deleteMapDay(Map map);
	public int delThisDayAllInfo(Map map);
}
