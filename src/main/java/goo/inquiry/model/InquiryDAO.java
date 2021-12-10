package goo.inquiry.model;

import java.util.*;

public interface InquiryDAO {
	
	public List<InquiryDTO> inquiryList(int member_idx);
	public int addInquiry(Map hmp);
}
