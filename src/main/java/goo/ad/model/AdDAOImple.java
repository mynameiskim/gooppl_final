package goo.ad.model;

import org.mybatis.spring.SqlSessionTemplate;

public class AdDAOImple implements AdDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public AdDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

}
