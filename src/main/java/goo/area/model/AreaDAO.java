package goo.area.model;

import java.util.*;

public interface AreaDAO {

	public List<AreaDTO> areaList();
	public String getAreaName(int areacode);
	public AreaDTO getAreaInfo(int contentid);
}
