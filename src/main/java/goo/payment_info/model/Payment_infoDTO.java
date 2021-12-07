package goo.payment_info.model;

import java.sql.Date;

public class Payment_infoDTO {
	private String imp_uid;
	private int owner_idx;
	private int member_idx;
	private String merchant_uid;
	private int amount;
	private String status;
	private Date payDate;
	
	public Payment_infoDTO() {
		super();
	}

	public Payment_infoDTO(String imp_uid, int owner_idx, int member_idx, String merchant_uid, int amount,
			String status, Date payDate) {
		super();
		this.imp_uid = imp_uid;
		this.owner_idx = owner_idx;
		this.member_idx = member_idx;
		this.merchant_uid = merchant_uid;
		this.amount = amount;
		this.status = status;
		this.payDate = payDate;
	}
	
	public Payment_infoDTO(String imp_uid, int owner_idx, int member_idx, String merchant_uid, int amount,
			String status) {
		super();
		this.imp_uid = imp_uid;
		this.owner_idx = owner_idx;
		this.member_idx = member_idx;
		this.merchant_uid = merchant_uid;
		this.amount = amount;
		this.status = status;
	}

	public String getImp_uid() {
		return imp_uid;
	}

	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
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

	public String getMerchant_uid() {
		return merchant_uid;
	}

	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
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
