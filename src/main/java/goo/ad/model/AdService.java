package goo.ad.model;

import java.util.*;

public interface AdService {
	public int startAD(AdDTO adto);
	public int admin_refundAd_Del(String imp_uid);
	public AdDTO getAdInfo(int owner_idx);
	public List<Integer> getOwnerIdx();
	public int total_AdInfo();
	public int total_ingAdInfo();
	public int total_endAdInfo();
	public List<AdDTO> all_AdInfo(int cp, int ls);
	public List<AdDTO> all_ingAdInfo(int cp, int ls);
	public List<AdDTO> all_endAdInfo(int cp, int ls);
}
