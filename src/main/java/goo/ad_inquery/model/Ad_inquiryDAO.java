package goo.ad_inquery.model;

import java.util.*;

public interface Ad_inquiryDAO {
	public int adInquiry(Ad_inquiryDTO dto);
	
	
	public int admin_totalAdInquiry();
	public int admin_totalAdUpdateInquiry();
	public int admin_totalAdDelInquiry();
	public List<Ad_inquiryDTO> admin_adInquiry(Map map);
	public List<Ad_inquiryDTO> admin_adUpdateInquiry(Map map);
	public List<Ad_inquiryDTO> admin_adDelInquiry(Map map);
	public int admin_adInquiry_ok(int inquiry_idx);
	public Ad_inquiryDTO adInquiry_Info(int inquiry_idx);
}
