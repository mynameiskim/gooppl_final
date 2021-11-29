package goo.map_t.model;

import java.sql.*;

public class Gooppl_mapDTO {

	private int map_idx;
	private String map_title;
	private int member_idx;
	private int people_num;
	private int trip_type;
	private Date startdate;
	private Date enddate;
	private Date registdate;
	private String share_ok;
	private String del_ok;
	
	public Gooppl_mapDTO() {
		super();
	}

	public Gooppl_mapDTO(int map_idx, String map_title, int member_idx, int people_num, int trip_type, Date startdate,
			Date enddate, Date registdate, String share_ok, String del_ok) {
		super();
		this.map_idx = map_idx;
		this.map_title = map_title;
		this.member_idx = member_idx;
		this.people_num = people_num;
		this.trip_type = trip_type;
		this.startdate = startdate;
		this.enddate = enddate;
		this.registdate = registdate;
		this.share_ok = share_ok;
		this.del_ok = del_ok;
	}

	public int getMap_idx() {
		return map_idx;
	}

	public void setMap_idx(int map_idx) {
		this.map_idx = map_idx;
	}

	public String getMap_title() {
		return map_title;
	}

	public void setMap_title(String map_title) {
		this.map_title = map_title;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public int getPeople_num() {
		return people_num;
	}

	public void setPeople_num(int people_num) {
		this.people_num = people_num;
	}

	public int getTrip_type() {
		return trip_type;
	}

	public void setTrip_type(int trip_type) {
		this.trip_type = trip_type;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public Date getRegistdate() {
		return registdate;
	}

	public void setRegistdate(Date registdate) {
		this.registdate = registdate;
	}

	public String getShare_ok() {
		return share_ok;
	}

	public void setShare_ok(String share_ok) {
		this.share_ok = share_ok;
	}

	public String getDel_ok() {
		return del_ok;
	}

	public void setDel_ok(String del_ok) {
		this.del_ok = del_ok;
	}
	
}