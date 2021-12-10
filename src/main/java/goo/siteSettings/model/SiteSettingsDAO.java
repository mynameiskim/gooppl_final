package goo.siteSettings.model;

public interface SiteSettingsDAO {
	
	public SiteSettingsDTO getSiteSettings();
	public int siteSettingsUpdate(SiteSettingsDTO dto);
}
