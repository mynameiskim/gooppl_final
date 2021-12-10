package goo.ad.model;

import java.sql.Date;

public class AdDTO {
	private int ad_idx;
	private int owner_idx;
	private String imp_uid;
	private int ad_period;
	private Date ad_startDate;
	private Date ad_endDate;
	private String ad_state;
	public AdDTO() {
		super();
	}
	public AdDTO(int ad_idx, int owner_idx, String imp_uid, int ad_period, Date ad_startDate, Date ad_endDate, String ad_state) {
		super();
		this.ad_idx = ad_idx;
		this.owner_idx = owner_idx;
		this.imp_uid = imp_uid;
		this.ad_period = ad_period;
		this.ad_startDate = ad_startDate;
		this.ad_endDate = ad_endDate;
		this.ad_state = ad_state;
	}
	
	public AdDTO(int owner_idx, String imp_uid, int ad_period, String ad_state) {
		super();
		this.owner_idx = owner_idx;
		this.imp_uid = imp_uid;
		this.ad_period = ad_period;
		this.ad_state = ad_state;
	}
	public int getAd_idx() {
		return ad_idx;
	}
	public void setAd_idx(int ad_idx) {
		this.ad_idx = ad_idx;
	}
	public int getOwner_idx() {
		return owner_idx;
	}
	public void setOwner_idx(int owner_idx) {
		this.owner_idx = owner_idx;
	}
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public int getAd_period() {
		return ad_period;
	}
	public void setAd_period(int ad_period) {
		this.ad_period = ad_period;
	}
	public Date getAd_startDate() {
		return ad_startDate;
	}
	public void setAd_startDate(Date ad_startDate) {
		this.ad_startDate = ad_startDate;
	}
	public Date getAd_endDate() {
		return ad_endDate;
	}
	public void setAd_endDate(Date ad_endDate) {
		this.ad_endDate = ad_endDate;
	}
	public String getAd_state() {
		return ad_state;
	}
	public void setAd_state(String ad_state) {
		this.ad_state = ad_state;
	}
	
	
}
