package goo.ad_inquery.model;

import java.util.*;

public interface Ad_inquiryService {
	public int adInquiry(Ad_inquiryDTO dto);
	
	public int admin_totalAdInquiry();
	public int admin_totalAdUpdateInquiry();
	public int admin_totalAdDelInquiry();
	public List<Ad_inquiryDTO> admin_adInquiry(int cp, int ls);
	public List<Ad_inquiryDTO> admin_adUpdateInquiry(int cp, int ls);
	public List<Ad_inquiryDTO> admin_adDelInquiry(int cp, int ls);
	public int admin_adInquiry_ok(int inquiry_idx);
	public Ad_inquiryDTO adInquiry_Info(int inquiry_idx);
	public String ckAdInquiry(int member_idx);
	public Ad_inquiryDTO ad_paymentInfo(int member_idx);
}
