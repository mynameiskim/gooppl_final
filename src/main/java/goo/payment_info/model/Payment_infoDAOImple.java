package goo.payment_info.model;

import org.mybatis.spring.SqlSessionTemplate;

public class Payment_infoDAOImple implements Payment_infoDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public Payment_infoDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int savePayInfo(Payment_infoDTO dto) {
		int result = sqlMap.insert("savePayInfo", dto);
		return result;
	}
	
	public int admin_changePayInfo_cancel(String imp_uid) {
		int result = sqlMap.update("admin_changePayInfo_cancel",imp_uid);
		return result;
	}
	
	public String getRefundImp_uid(int owner_idx) {
		String imp_uid = sqlMap.selectOne("getRefundImp_uid",owner_idx);
		return imp_uid;
	}

	public Payment_infoDTO admin_getPayInfo(int owner_idx) {
		Payment_infoDTO dto = sqlMap.selectOne("admin_getPayInfo",owner_idx);
		return dto;
	}
}
