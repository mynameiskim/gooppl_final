package goo.admin.model;

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


	public SiteSettingsDTO get_site_settings() {
		System.out.println("SiteSettingsDAOImple 진입");
		System.out.println("asdasd");
		SiteSettingsDTO dto = sqlMap.selectOne("get_site_settings");
		System.out.println("SQL통과");
		return dto;
	}
}
