package goo.map_t.model;

import java.sql.*;
import java.util.*;

public interface Gooppl_mapDAO {

	public int getMapIdx(Gooppl_mapDTO dto);
	public int getMemberIdx(int map_idx);
	public Gooppl_mapDTO getMapt(int map_idx);
	public int updateMap(Gooppl_mapDTO dto);
	public int getShareCnt();
	public List<Gooppl_mapDTO> mapList(Map map);
}
