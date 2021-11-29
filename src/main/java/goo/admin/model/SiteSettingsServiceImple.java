package goo.admin.model;

import org.springframework.beans.factory.annotation.Autowired;

public class SiteSettingsServiceImple implements SiteSettingsService {

	
	private SiteSettingsDAO siteSettingsDao;
	

	public SiteSettingsServiceImple(SiteSettingsDAO siteSettingsDao) {
		super();
		this.siteSettingsDao = siteSettingsDao;
	}


	public SiteSettingsDAO getSiteSettingsDao() {
		return siteSettingsDao;
	}


	public void setSiteSettingsDao(SiteSettingsDAO siteSettingsDao) {
		this.siteSettingsDao = siteSettingsDao;
	}


	public SiteSettingsDTO get_site_settings() {
		System.out.println("SiteSettingsServiceImple OK");
		SiteSettingsDTO dto = siteSettingsDao.get_site_settings();
		return dto;
	}
}
