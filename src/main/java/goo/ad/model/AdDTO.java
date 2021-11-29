package goo.ad.model;

public class AdDTO {
	private int ad_idx;
	private String title;
	private String business_number;
	private String business_tel;
	private String name;
	private String email;
	private int contenttype;
	private String addr;
	private String detailed_addr;
	private double mapx;
	private double mapy;
	private int areacode;
	private String firstimage;
	private int ad_period;
	private int ad_state;
	private String ad_content;
	
	public AdDTO() {
		super();
	}

	public AdDTO(int ad_idx, String title, String business_number, String business_tel, String name, String email,
			int contenttype, String addr, String detailed_addr, double mapx, double mapy, int areacode,
			String firstimage, int ad_period, int ad_state, String ad_content) {
		super();
		this.ad_idx = ad_idx;
		this.title = title;
		this.business_number = business_number;
		this.business_tel = business_tel;
		this.name = name;
		this.email = email;
		this.contenttype = contenttype;
		this.addr = addr;
		this.detailed_addr = detailed_addr;
		this.mapx = mapx;
		this.mapy = mapy;
		this.areacode = areacode;
		this.firstimage = firstimage;
		this.ad_period = ad_period;
		this.ad_state = ad_state;
		this.ad_content = ad_content;
	}

	public int getAd_idx() {
		return ad_idx;
	}

	public void setAd_idx(int ad_idx) {
		this.ad_idx = ad_idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBusiness_number() {
		return business_number;
	}

	public void setBusiness_number(String business_number) {
		this.business_number = business_number;
	}

	public String getBusiness_tel() {
		return business_tel;
	}

	public void setBusiness_tel(String business_tel) {
		this.business_tel = business_tel;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getContenttype() {
		return contenttype;
	}

	public void setContenttype(int contenttype) {
		this.contenttype = contenttype;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getDetailed_addr() {
		return detailed_addr;
	}

	public void setDetailed_addr(String detailed_addr) {
		this.detailed_addr = detailed_addr;
	}

	public double getMapx() {
		return mapx;
	}

	public void setMapx(double mapx) {
		this.mapx = mapx;
	}

	public double getMapy() {
		return mapy;
	}

	public void setMapy(double mapy) {
		this.mapy = mapy;
	}

	public int getAreacode() {
		return areacode;
	}

	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}

	public String getFirstimage() {
		return firstimage;
	}

	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}

	public int getAd_period() {
		return ad_period;
	}

	public void setAd_period(int ad_period) {
		this.ad_period = ad_period;
	}

	public int getAd_state() {
		return ad_state;
	}

	public void setAd_state(int ad_state) {
		this.ad_state = ad_state;
	}

	public String getAd_content() {
		return ad_content;
	}

	public void setAd_content(String ad_content) {
		this.ad_content = ad_content;
	}
	
}
