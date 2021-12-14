package goo.payment_info.model;

import java.util.List;
import java.util.Map;

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
	
	public int totalPayment() {
		int count = sqlMap.selectOne("totalPayment");
		return count;
	}
	
	public int totalPaidPayment() {
		int count = sqlMap.selectOne("totalPaidPayment");
		return count;
	}
	
	public int totalCancelledPayment() {
		int count = sqlMap.selectOne("totalCancelledPayment");
		return count;
	}
	
	public List<Payment_infoDTO> allPayment_Info(Map map) {
		List<Payment_infoDTO> list = sqlMap.selectList("allPayment_Info", map);
		return list;
	}
	
	public List<Payment_infoDTO> paidPayment_Info(Map map) {
		List<Payment_infoDTO> list = sqlMap.selectList("paidPayment_Info", map);
		return list;
	}
	
	public List<Payment_infoDTO> cancelledPayment_Info(Map map) {
		List<Payment_infoDTO> list = sqlMap.selectList("cancelledPayment_Info", map);
		return list;
	}
	
	public Payment_infoDTO getPaymentDetail(String imp_uid) {
		Payment_infoDTO dto = sqlMap.selectOne("getPaymentDetail", imp_uid);
		return dto;
	}
	
	public int admin_allPayment_del(int owner_idx) {
		int result = sqlMap.delete("admin_allPayment_del", owner_idx);
		return result;
	}
}
