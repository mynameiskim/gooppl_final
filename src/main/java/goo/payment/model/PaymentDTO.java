package goo.payment.model;

import java.sql.Date;

public class PaymentDTO {
	private String imp_uid;
	private int inquiry_idx;
	private int owner_idx;
	private int member_idx;
	private String merchany_uid;
	private int amount;
	private String status;
	private Date payDate;
	
	public PaymentDTO(String imp_uid, int inquiry_idx, int owner_idx, int member_idx, String merchany_uid, int amount,
			String status, Date payDate) {
		super();
		this.imp_uid = imp_uid;
		this.inquiry_idx = inquiry_idx;
		this.owner_idx = owner_idx;
		this.member_idx = member_idx;
		this.merchany_uid = merchany_uid;
		this.amount = amount;
		this.status = status;
		this.payDate = payDate;
	}

	public String getImp_uid() {
		return imp_uid;
	}

	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
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

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getMerchany_uid() {
		return merchany_uid;
	}

	public void setMerchany_uid(String merchany_uid) {
		this.merchany_uid = merchany_uid;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	
}
