package goo.inquiry.model;

import java.util.*;

public interface InquiryDAO {
	
	public List<InquiryDTO> inquiryList(int member_idx);
	public int addInquiry(Map hmp);
	public int totalInquiry();
	public List<InquiryDTO> getInquiryList(Map map);
	public InquiryDTO inquiryInfo(int inquiry_idx);
	public int inquiryUpdate(Map map);
}
