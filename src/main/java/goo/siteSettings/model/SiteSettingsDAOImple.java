package goo.siteSettings.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class SiteSettingsDAOImple implements SiteSettingsDAO {

	
	private SqlSessionTemplate sqlMap;
	
	public SiteSettingsDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}


	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}


	public SiteSettingsDTO getSiteSettings() {
		System.out.println("SiteSettingsDAOImple 진입");
		SiteSettingsDTO dto = sqlMap.selectOne("getSiteSettings");
		System.out.println("SQL?�과");
		return dto;
	}
}
