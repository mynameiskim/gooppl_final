package goo.admin.model;

import java.sql.Date;

public class AdminDTO {

	private int admin_idx;
	private int member_idx;
	private String admin_phone;
	private String admin_tel;
	private String admin_addr;
	private Date last_connection_date;
	
	public AdminDTO() {
		
	}

	public AdminDTO(int admin_idx, int member_idx, String admin_phone, String admin_tel, String admin_addr,
			Date last_connection_date) {
		super();
		this.admin_idx = admin_idx;
		this.member_idx = member_idx;
		this.admin_phone = admin_phone;
		this.admin_tel = admin_tel;
		this.admin_addr = admin_addr;
		this.last_connection_date = last_connection_date;
	}

	@Override
	public String toString() {
		return "AdminDTO [admin_idx=" + admin_idx + ", member_idx=" + member_idx + ", admin_phone=" + admin_phone
				+ ", admin_tel=" + admin_tel + ", admin_addr=" + admin_addr + ", last_connection_date="
				+ last_connection_date + "]";
	}

	public int getAdmin_idx() {
		return admin_idx;
	}

	public void setAdmin_idx(int admin_idx) {
		this.admin_idx = admin_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getAdmin_phone() {
		return admin_phone;
	}

	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}

	public String getAdmin_tel() {
		return admin_tel;
	}

	public void setAdmin_tel(String admin_tel) {
		this.admin_tel = admin_tel;
	}

	public String getAdmin_addr() {
		return admin_addr;
	}

	public void setAdmin_addr(String admin_addr) {
		this.admin_addr = admin_addr;
	}

	public Date getLast_connection_date() {
		return last_connection_date;
	}

	public void setLast_connection_date(Date last_connection_date) {
		this.last_connection_date = last_connection_date;
	}

	
}
