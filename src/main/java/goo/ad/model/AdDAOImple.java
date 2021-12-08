package goo.ad.model;

import org.mybatis.spring.SqlSessionTemplate;

public class AdDAOImple implements AdDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public AdDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	public int startAD(AdDTO adto) {
		int result = sqlMap.insert("startAD",adto);
		return result;
	}
	public int admin_refundAd_Del(String imp_uid) {
		int result = sqlMap.delete("admin_refundAd_Del", imp_uid);
		return result;
	}
}
