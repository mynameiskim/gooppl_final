package goo.mapinfo.model;

import java.sql.*;

public class MapInfoDTO {

	private int map_idx;
	private int day_num;
	private int route_num;
	private int contentid;
	
	public MapInfoDTO() {
		super();
	}

	public MapInfoDTO(int map_idx, int day_num, int route_num, int contentid) {
		super();
		this.map_idx = map_idx;
		this.day_num = day_num;
		this.route_num = route_num;
		this.contentid = contentid;
	}

	public int getMap_idx() {
		return map_idx;
	}

	public void setMap_idx(int map_idx) {
		this.map_idx = map_idx;
	}

	public int getDay_num() {
		return day_num;
	}

	public void setDay_num(int day_num) {
		this.day_num = day_num;
	}

	public int getRoute_num() {
		return route_num;
	}

	public void setRoute_num(int route_num) {
		this.route_num = route_num;
	}

	public int getContentid() {
		return contentid;
	}

	public void setContentid(int contentid) {
		this.contentid = contentid;
	}
	
}
