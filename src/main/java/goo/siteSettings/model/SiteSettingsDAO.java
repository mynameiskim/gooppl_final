package goo.siteSettings.model;

public interface SiteSettingsDAO {
	
	public SiteSettingsDTO getSiteSettings();
	public int faviconUpload(String favicon);
}
