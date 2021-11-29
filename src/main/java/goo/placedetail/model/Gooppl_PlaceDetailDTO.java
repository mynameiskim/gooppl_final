package goo.placedetail.model;

import java.sql.*;

public class Gooppl_PlaceDetailDTO {

	private int contentid;
	private String title;
	private String addr;
	private int areacode;
	private int sigungucode;
	private Double mapx;
	private Double mapy;
	private String overview;
	private int readnum;
	private String homepage;
	private String firstimage;
	
	public Gooppl_PlaceDetailDTO() {
		super();
	}

	public Gooppl_PlaceDetailDTO(int contentid, String title, String addr, int areacode, int sigungucode, Double mapx,
			Double mapy, String overview, int readnum, String homepage, String firstimage) {
		super();
		this.contentid = contentid;
		this.title = title;
		this.addr = addr;
		this.areacode = areacode;
		this.sigungucode = sigungucode;
		this.mapx = mapx;
		this.mapy = mapy;
		this.overview = overview;
		this.readnum = readnum;
		this.homepage = homepage;
		this.firstimage = firstimage;
	}

	public int getContentid() {
		return contentid;
	}

	public void setContentid(int contentid) {
		this.contentid = contentid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getAreacode() {
		return areacode;
	}

	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}

	public int getSigungucode() {
		return sigungucode;
	}

	public void setSigungucode(int sigungucode) {
		this.sigungucode = sigungucode;
	}

	public Double getMapx() {
		return mapx;
	}

	public void setMapx(Double mapx) {
		this.mapx = mapx;
	}

	public Double getMapy() {
		return mapy;
	}

	public void setMapy(Double mapy) {
		this.mapy = mapy;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getFirstimage() {
		return firstimage;
	}

	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}
	
}
