package goo.ad.model;

import java.util.List;

public interface AdDAO {
	public int startAD(AdDTO adto);
	public int admin_refundAd_Del(String imp_uid);
	public List getOwnerIdx();
}
