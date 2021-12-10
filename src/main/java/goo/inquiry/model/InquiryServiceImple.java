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

}
