package goo.map_t.model;

import java.util.*;

import goo.review.model.ReviewDTO;

import java.sql.*;

public interface Gooppl_mapService {

	public int getMapidx(Gooppl_mapDTO dto);
	public int getMemberIdx(int map_idx);
	public Gooppl_mapDTO getMapt(int map_idx);
	public int getShareCnt();
	public int updateMap(Gooppl_mapDTO dto);
	public List<Gooppl_mapDTO> mapList(int cp,int ls);
}
