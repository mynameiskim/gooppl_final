package goo.memberout.model;

import java.sql.Date;

public class MemberOutDTO {

	private int out_no;
	private String id;
	private String out_reason;
	private Date outdate;
	
	public MemberOutDTO() {
		super();
	}

	public MemberOutDTO(int out_no, String id, String out_reason, Date outdate) {
		super();
		this.out_no = out_no;
		this.id = id;
		this.out_reason = out_reason;
		this.outdate = outdate;
	}

	public int getOut_no() {
		return out_no;
	}

	public void setOut_no(int out_no) {
		this.out_no = out_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOut_reason() {
		return out_reason;
	}

	public void setOut_reason(String out_reason) {
		this.out_reason = out_reason;
	}

	public Date getOutdate() {
		return outdate;
	}

	public void setOutdate(Date outdate) {
		this.outdate = outdate;
	}
	
}
