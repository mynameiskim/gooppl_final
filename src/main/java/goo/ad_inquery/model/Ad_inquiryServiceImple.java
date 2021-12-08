package goo.ad_inquery.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import goo.owner.model.OwnerDTO;

public class Ad_inquiryServiceImple implements Ad_inquiryService {
	
	private Ad_inquiryDAO ad_inquiryDao;

	public Ad_inquiryDAO getAd_inquiryDao() {
		return ad_inquiryDao;
	}

	public void setAd_inquiryDao(Ad_inquiryDAO ad_inquiryDao) {
		this.ad_inquiryDao = ad_inquiryDao;
	}

	public int adInquiry(Ad_inquiryDTO dto) {
		int result = ad_inquiryDao.adInquiry(dto);
		return result;
	}
	
	public int payOk_InquiryDel(int owner_idx) {
		int result = ad_inquiryDao.payOk_InquiryDel(owner_idx);
		return result;
	}
	
	public int admin_totalAdInquiry() {
		int count = ad_inquiryDao.admin_totalAdInquiry();
		return count;
	}
	
	public int admin_totalAdUpdateInquiry() {
		int count = ad_inquiryDao.admin_totalAdUpdateInquiry();
		return count;
	}
	
	public int admin_totalAdDelInquiry() {
		int count = ad_inquiryDao.admin_totalAdDelInquiry();
		return count;
	}
	
	public List<Ad_inquiryDTO> admin_adInquiry(int cp, int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<Ad_inquiryDTO> list = ad_inquiryDao.admin_adInquiry(map);
		return list;
	}
	
	public List<Ad_inquiryDTO> admin_adUpdateInquiry(int cp, int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<Ad_inquiryDTO> list = ad_inquiryDao.admin_adUpdateInquiry(map);
		return list;
	}
	
	public List<Ad_inquiryDTO> admin_adDelInquiry(int cp, int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<Ad_inquiryDTO> list = ad_inquiryDao.admin_adDelInquiry(map);
		return list;
	}
	
	public int admin_adInquiry_ok(int inquiry_idx) {
		int result = ad_inquiryDao.admin_adInquiry_ok(inquiry_idx);
		return result;
	}
	
	public Ad_inquiryDTO adInquiry_Info(int inquiry_idx) {
		Ad_inquiryDTO dto = ad_inquiryDao.adInquiry_Info(inquiry_idx);
		return dto;
	}
	
	public String ckAdInquiry(int member_idx) {
		String inquiry_state = ad_inquiryDao.ckAdInquiry(member_idx);
		return inquiry_state;
	}
	
	public Ad_inquiryDTO ad_paymentInfo(int member_idx) {
		Ad_inquiryDTO dto = ad_inquiryDao.ad_paymentInfo(member_idx);
		return dto;
	}
	
	public int admin_adInquiry_del(int inquiry_idx) {
		int result = ad_inquiryDao.admin_adInquiry_del(inquiry_idx);
		return result;
	}
	
	public int admin_delInquiry_Ok(int inquiry_idx) {
		int result = ad_inquiryDao.admin_delInquiry_Ok(inquiry_idx);
		return result;
	}
	
}
