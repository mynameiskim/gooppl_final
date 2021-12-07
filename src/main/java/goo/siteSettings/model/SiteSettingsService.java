package goo.siteSettings.model;

public interface SiteSettingsService {

	public SiteSettingsDTO getSiteSettings();
	public int faviconUpload(String favicon);
}
