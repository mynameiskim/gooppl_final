package goo.payment_info.model;

public class Payment_infoServiceImple implements Payment_infoService {

	private Payment_infoDAO payment_infoDao;

	public Payment_infoDAO getPayment_infoDao() {
		return payment_infoDao;
	}

	public void setPayment_infoDao(Payment_infoDAO payment_infoDao) {
		this.payment_infoDao = payment_infoDao;
	}
	
	public int savePayInfo(Payment_infoDTO dto) {
		int result = payment_infoDao.savePayInfo(dto);
		return result;
	}
	
	public int admin_changePayInfo_cancel(int owner_idx) {
		int result = payment_infoDao.admin_changePayInfo_cancel(owner_idx);
		return result;
	}
	
	public String getRefundImp_uid(int owner_idx) {
		String imp_uid = payment_infoDao.getRefundImp_uid(owner_idx);
		return imp_uid;
	}
	
	public Payment_infoDTO admin_getPayInfo(int owner_idx) {
		Payment_infoDTO dto = payment_infoDao.admin_getPayInfo(owner_idx);
		return dto;
	}
}
