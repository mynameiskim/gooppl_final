package goo.mapinfo.model;

import java.util.*;

public interface MapInfoDAO {

	public int addMapInfo(MapInfoDTO dto);
	public List<Integer> getThisMapInfo(Map map);
}
