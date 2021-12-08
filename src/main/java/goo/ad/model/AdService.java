package goo.ad.model;

import java.util.*;

public interface AdService {
	public int startAD(AdDTO adto);
	public int admin_refundAd_Del(String imp_uid);
	public List<Integer> getOwnerIdx();
}
