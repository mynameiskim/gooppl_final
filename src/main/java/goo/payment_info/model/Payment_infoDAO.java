package goo.payment_info.model;

public interface Payment_infoDAO {

	public int savePayInfo(Payment_infoDTO dto);
	public int admin_changePayInfo_cancel(int owner_idx);
	public String getRefundImp_uid(int owner_idx);
	public Payment_infoDTO admin_getPayInfo(int owner_idx);
}
