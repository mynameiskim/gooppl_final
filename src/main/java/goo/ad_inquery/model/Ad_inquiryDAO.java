package goo.ad_inquery.model;

import java.util.*;

public interface Ad_inquiryDAO {
	public int adInquiry(Ad_inquiryDTO dto);
	public int payOk_InquiryDel(int owner_idx);
	
	public int admin_totalAdInquiry();
	public int admin_totalAdUpdateInquiry();
	public int admin_totalAdDelInquiry();
	public List<Ad_inquiryDTO> admin_adInquiry(Map map);
	public List<Ad_inquiryDTO> admin_adUpdateInquiry(Map map);
	public List<Ad_inquiryDTO> admin_adDelInquiry(Map map);
	public int admin_adInquiry_ok(int inquiry_idx);
	public Ad_inquiryDTO adInquiry_Info(int inquiry_idx);
	public String ckAdInquiry(int member_idx);
	public Ad_inquiryDTO ad_paymentInfo(int member_idx);
	public int admin_adInquiry_del(int inquiry_idx);
	public int admin_delInquiry_Ok(int inquiry_idx);
	public int admin_delInquiry_Delete(int inquiry_idx);
	public String ckCancelInquiry(int member_idx);
	public int admin_ownerOut_inquiryDel(int owner_idx);
}
