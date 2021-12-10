package goo.payment_info.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import goo.owner.model.OwnerDTO;

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
	
	public int admin_changePayInfo_cancel(String imp_uid) {
		int result = payment_infoDao.admin_changePayInfo_cancel(imp_uid);
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
	
	public int totalPayment() {
		int count = payment_infoDao.totalPayment();
		return count;
	}
	
	public int totalPaidPayment() {
		int count = payment_infoDao.totalPaidPayment();
		return count;
	}
	
	public int totalCancelledPayment() {
		int count = payment_infoDao.totalCancelledPayment();
		return count;
	}
	
	public List<Payment_infoDTO> allPayment_Info(int cp, int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<Payment_infoDTO> list = payment_infoDao.allPayment_Info(map);
		return list;
	}
	
	public List<Payment_infoDTO> paidPayment_Info(int cp, int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<Payment_infoDTO> list = payment_infoDao.paidPayment_Info(map);
		return list;
	}
	
	public List<Payment_infoDTO> cancelledPayment_Info(int cp, int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<Payment_infoDTO> list = payment_infoDao.cancelledPayment_Info(map);
		return list;
	}
	
	public Payment_infoDTO getPaymentDetail(String imp_uid) {
		Payment_infoDTO dto = payment_infoDao.getPaymentDetail(imp_uid);
		return dto;
	}
}
