package goo.area.model;

import java.util.*;

public interface AreaService {

	public List<AreaDTO> areaList();
	public String getAreaName(int areacode);
	public List<AreaDTO> getAreaInfo(List<Integer> contentids);
}
