package goo.admin.model;

import java.sql.Date;

public class AdminDTO {

	private int admin_idx;
	private int member_idx;
	private String admin_phone;
	private String admin_tel;
	private int admin_postcode;
	private String admin_addr;
	private String admin_extra_addr;
	private String admin_detail_addr;
	private Date last_connection_date;
	
	public AdminDTO() {
		
	}

	public AdminDTO(int admin_idx, int member_idx, String admin_phone, String admin_tel, int admin_postcode,
			String admin_addr, String admin_extra_addr, String admin_detail_addr, Date last_connection_date) {
		super();
		this.admin_idx = admin_idx;
		this.member_idx = member_idx;
		this.admin_phone = admin_phone;
		this.admin_tel = admin_tel;
		this.admin_postcode = admin_postcode;
		this.admin_addr = admin_addr;
		this.admin_extra_addr = admin_extra_addr;
		this.admin_detail_addr = admin_detail_addr;
		this.last_connection_date = last_connection_date;
	}

	@Override
	public String toString() {
		return "AdminDTO [admin_idx=" + admin_idx + ", member_idx=" + member_idx + ", admin_phone=" + admin_phone
				+ ", admin_tel=" + admin_tel + ", admin_postcode=" + admin_postcode + ", admin_addr=" + admin_addr
				+ ", admin_extra_addr=" + admin_extra_addr + ", admin_detail_addr=" + admin_detail_addr
				+ ", last_connection_date=" + last_connection_date + "]";
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

	public int getAdmin_postcode() {
		return admin_postcode;
	}

	public void setAdmin_postcode(int admin_postcode) {
		this.admin_postcode = admin_postcode;
	}

	public String getAdmin_addr() {
		return admin_addr;
	}

	public void setAdmin_addr(String admin_addr) {
		this.admin_addr = admin_addr;
	}

	public String getAdmin_extra_addr() {
		return admin_extra_addr;
	}

	public void setAdmin_extra_addr(String admin_extra_addr) {
		this.admin_extra_addr = admin_extra_addr;
	}

	public String getAdmin_detail_addr() {
		return admin_detail_addr;
	}

	public void setAdmin_detail_addr(String admin_detail_addr) {
		this.admin_detail_addr = admin_detail_addr;
	}

	public Date getLast_connection_date() {
		return last_connection_date;
	}

	public void setLast_connection_date(Date last_connection_date) {
		this.last_connection_date = last_connection_date;
	}


	
}
