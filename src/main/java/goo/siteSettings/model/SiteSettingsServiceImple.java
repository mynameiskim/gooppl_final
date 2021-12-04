package goo.sitesettings.model;

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


	public SiteSettingsDTO getSiteSettings() {
		System.out.println("SiteSettingsServiceImple OK");
		SiteSettingsDTO dto = siteSettingsDao.getSiteSettings();
		return dto;
	}
}
