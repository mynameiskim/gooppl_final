package goo.area.model;

import java.sql.*;

public class AreaDTO {
	
	private int areacode;
	private String areaname;
	private double latitude;
	private double longitude;
	
	public AreaDTO() {
		super();
	}

	public AreaDTO(int areacode, String areaname, double latitude, double longitude) {
		super();
		this.areacode = areacode;
		this.areaname = areaname;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public int getAreacode() {
		return areacode;
	}

	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}

	public String getAreaname() {
		return areaname;
	}

	public void setAreaname(String areaname) {
		this.areaname = areaname;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	
}
