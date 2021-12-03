package goo.ad_inquery.model;

import java.sql.Date;

public class Ad_inquiryDTO {

	private int inquiry_idx;
	private int owner_idx;
	private String email;
	private String inquiry_type;
	private String inquiry_content;
	private String inquiry_state;
	private int ad_period;
	private String reason;
	private Date writeDate;
	
	public Ad_inquiryDTO() {
		super();
	}

	public Ad_inquiryDTO(int inquiry_idx, int owner_idx, String email, String inquiry_type, String inquiry_content,
			String inquiry_state, int ad_period, String reason, Date writeDate) {
		super();
		this.inquiry_idx = inquiry_idx;
		this.owner_idx = owner_idx;
		this.email = email;
		this.inquiry_type = inquiry_type;
		this.inquiry_content = inquiry_content;
		this.inquiry_state = inquiry_state;
		this.ad_period = ad_period;
		this.reason = reason;
		this.writeDate = writeDate;
	}

	public int getInquiry_idx() {
		return inquiry_idx;
	}

	public void setInquiry_idx(int inquiry_idx) {
		this.inquiry_idx = inquiry_idx;
	}

	public int getOwner_idx() {
		return owner_idx;
	}

	public void setOwner_idx(int owner_idx) {
		this.owner_idx = owner_idx;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getInquiry_type() {
		return inquiry_type;
	}

	public void setInquiry_type(String inquiry_type) {
		this.inquiry_type = inquiry_type;
	}

	public String getInquiry_content() {
		return inquiry_content;
	}

	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}

	public String getInquiry_state() {
		return inquiry_state;
	}

	public void setInquiry_state(String inquiry_state) {
		this.inquiry_state = inquiry_state;
	}

	public int getAd_period() {
		return ad_period;
	}

	public void setAd_period(int ad_period) {
		this.ad_period = ad_period;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	
}
