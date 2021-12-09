package goo.ad.model;

import java.util.*;

public interface AdDAO {
	public int startAD(AdDTO adto);
	public int admin_refundAd_Del(String imp_uid);
	public AdDTO getAdInfo(int owner_idx);
	public List getOwnerIdx();
	public int total_AdInfo();
	public int total_ingAdInfo();
	public int total_endAdInfo();
	public List<AdDTO> all_AdInfo(Map map);
	public List<AdDTO> all_ingAdInfo(Map map);
	public List<AdDTO> all_endAdInfo(Map map);
}
