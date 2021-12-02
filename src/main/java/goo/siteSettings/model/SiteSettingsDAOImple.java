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
		System.out.println("SiteSettingsDAOImple ì§„ìž…");
		System.out.println("heldleh");
<<<<<<< HEAD
		System.out.println("asdasSDSDSd");
		System.out.println("?œìˆ˜ ?ŒìŠ¤??");
=======
		System.out.println("ads");
>>>>>>> 100e8db8d1a1de881e694e266f0fa85165412ab4
		SiteSettingsDTO dto = sqlMap.selectOne("get_site_settings");
		SiteSettingsDTO dto = sqlMap.selectOne("getSiteSettings");
		SiteSettingsDTO dto = sqlMap.selectOne("get_site_settings");
		System.out.println("SQL?µê³¼");
		return dto;
	}
}
