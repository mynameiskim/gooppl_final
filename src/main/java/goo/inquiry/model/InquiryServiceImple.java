package goo.inquiry.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

public class InquiryServiceImple implements InquiryService {
	
	private InquiryDAO inquiryDao;
	
	public InquiryServiceImple(InquiryDAO inquiryDao) {
		super();
		this.inquiryDao = inquiryDao;
	}

	
	public List<InquiryDTO> inquiryList(int member_idx) {
		List<InquiryDTO> list = inquiryDao.inquiryList(member_idx);
		return list;
	}
	public int addInquiry(Map hmp) {
		int count = inquiryDao.addInquiry(hmp);
		return count;
	}
	public int totalInquiry() {
		int count = inquiryDao.totalInquiry();
		return count;
	}
	public List<InquiryDTO> getInquiryList(Map map) {
		int cp = (Integer) map.get("cp");
		int ls = (Integer) map.get("listSize");
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		map.put("start", start);
		map.put("end", end);
		List<InquiryDTO> list = inquiryDao.getInquiryList(map);
		return list;
	}
	public InquiryDTO inquiryInfo(int inquiry_idx) {
		InquiryDTO dto = inquiryDao.inquiryInfo(inquiry_idx);
		return dto;
	}
	public int inquiryUpdate(Map map) {
		int count = inquiryDao.inquiryUpdate(map);
		return count;
	}
}
