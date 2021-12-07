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
}
