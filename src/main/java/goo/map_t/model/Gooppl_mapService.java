﻿package goo.map_t.model;

import java.util.*;

import goo.review.model.ReviewDTO;

import java.sql.*;
import java.sql.Date;

public interface Gooppl_mapService {

	public int getMapidx(Gooppl_mapDTO dto);
	public int getMemberIdx(int map_idx);
	public Gooppl_mapDTO getMapt(int map_idx);
	public int getShareCnt();
	public int updateMap(Gooppl_mapDTO dto);
	public int updateMapDate(int map_idx, Date startdate, Date endDate);
	public List<Gooppl_mapDTO> mapList(int cp,int ls);
	public List<Gooppl_mapDTO> getMap(int member_idx);
	
}
