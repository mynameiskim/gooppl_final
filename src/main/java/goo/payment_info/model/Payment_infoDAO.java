package goo.payment_info.model;

import java.util.*;

public interface Payment_infoDAO {

	public int savePayInfo(Payment_infoDTO dto);
	public int admin_changePayInfo_cancel(String imp_uid);
	public String getRefundImp_uid(int owner_idx);
	public Payment_infoDTO admin_getPayInfo(int owner_idx);
	public int totalPayment();
	public int totalPaidPayment();
	public int totalCancelledPayment();
	public List<Payment_infoDTO> allPayment_Info(Map map);
	public List<Payment_infoDTO> paidPayment_Info(Map map);
	public List<Payment_infoDTO> cancelledPayment_Info(Map map);
}
