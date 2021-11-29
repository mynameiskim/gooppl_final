package goo.sigungu.model;

import java.sql.*;

public class SigunguDTO {
	
	private int sigungu_idx;
	private int areacode;
	private int sigungucode;
	private String sigungu_name;
	
	public SigunguDTO() {
		super();
	}

	public SigunguDTO(int sigungu_idx, int areacode, int sigungucode, String sigungu_name) {
		super();
		this.sigungu_idx = sigungu_idx;
		this.areacode = areacode;
		this.sigungucode = sigungucode;
		this.sigungu_name = sigungu_name;
	}

	public int getSigungu_idx() {
		return sigungu_idx;
	}

	public void setSigungu_idx(int sigungu_idx) {
		this.sigungu_idx = sigungu_idx;
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

	public String getSigungu_name() {
		return sigungu_name;
	}

	public void setSigungu_name(String sigungu_name) {
		this.sigungu_name = sigungu_name;
	}
	
}
