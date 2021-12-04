package goo.sitesettings.model;

public class SiteSettingsDTO {

	private String web_browser_title;
	private String keyword;
	private String description;
	private String favicon;
	
	public SiteSettingsDTO() {
		
	}

	public SiteSettingsDTO(String web_browser_title, String keyword, String description, String favicon) {
		super();
		this.web_browser_title = web_browser_title;
		this.keyword = keyword;
		this.description = description;
		this.favicon = favicon;
	}

	@Override
	public String toString() {
		return "SiteSettingsDTO [web_browser_title=" + web_browser_title + ", keyword=" + keyword + ", description="
				+ description + ", favicon=" + favicon + "]";
	}

	public String getWeb_browser_title() {
		return web_browser_title;
	}

	public void setWeb_browser_title(String web_browser_title) {
		this.web_browser_title = web_browser_title;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getFavicon() {
		return favicon;
	}

	public void setFavicon(String favicon) {
		this.favicon = favicon;
	}
	
	
}
