package goo.mapinfo.model;

import java.util.*;

public interface MapInfoService {

	public int addMapInfo(List<MapInfoDTO> list);
	public List<Integer> getThisMapInfo(int map_idx, int day_num);
}
