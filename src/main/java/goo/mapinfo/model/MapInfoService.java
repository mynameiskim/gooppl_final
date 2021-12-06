package goo.mapinfo.model;

import java.util.*;

public interface MapInfoService {
	public int addMapInfo(List<MapInfoDTO> list);
	public List<MapInfoDTO> mapInfoList(Map map);
}
