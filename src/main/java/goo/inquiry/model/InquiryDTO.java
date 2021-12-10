package goo.inquiry.model;

import java.sql.*;

public class InquiryDTO {
	
	private int inquiry_idx;
	private int member_idx;
	private String inquiry_subject;
	private String inquiry_content;
	private java.sql.Date inquiry_writedate;
	private String inquiry_status;
	private String inquiry_answer;
	
	public InquiryDTO() {
		// TODO Auto-generated constructor stub
	}

	public InquiryDTO(int inquiry_idx, int member_idx, String inquiry_subject, String inquiry_content,
			Date inquiry_writedate, String inquiry_status, String inquiry_answer) {
		super();
		this.inquiry_idx = inquiry_idx;
		this.member_idx = member_idx;
		this.inquiry_subject = inquiry_subject;
		this.inquiry_content = inquiry_content;
		this.inquiry_writedate = inquiry_writedate;
		this.inquiry_status = inquiry_status;
		this.inquiry_answer = inquiry_answer;
	}

	public int getInquiry_idx() {
		return inquiry_idx;
	}

	public void setInquiry_idx(int inquiry_idx) {
		this.inquiry_idx = inquiry_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getInquiry_subject() {
		return inquiry_subject;
	}

	public void setInquiry_subject(String inquiry_subject) {
		this.inquiry_subject = inquiry_subject;
	}

	public String getInquiry_content() {
		return inquiry_content;
	}

	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}

	public java.sql.Date getInquiry_writedate() {
		return inquiry_writedate;
	}

	public void setInquiry_writedate(java.sql.Date inquiry_writedate) {
		this.inquiry_writedate = inquiry_writedate;
	}

	public String getInquiry_status() {
		return inquiry_status;
	}

	public void setInquiry_status(String inquiry_status) {
		this.inquiry_status = inquiry_status;
	}

	public String getInquiry_answer() {
		return inquiry_answer;
	}

	public void setInquiry_answer(String inquiry_answer) {
		this.inquiry_answer = inquiry_answer;
	}	
	
	
}
