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

}
