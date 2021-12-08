package goo.ad.model;

public interface AdService {
	public int startAD(AdDTO adto);
	public int admin_refundAd_Del(String imp_uid);
	public AdDTO getAdInfo(int owner_idx);
}
