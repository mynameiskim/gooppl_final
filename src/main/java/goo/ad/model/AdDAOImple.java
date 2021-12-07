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
}
