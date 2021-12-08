package goo.payment_info.model;

public interface Payment_infoService {
	public int savePayInfo(Payment_infoDTO dto);
	public int admin_changePayInfo_cancel(String imp_uid);
	public String getRefundImp_uid(int owner_idx);
	public Payment_infoDTO admin_getPayInfo(int owner_idx);
}
