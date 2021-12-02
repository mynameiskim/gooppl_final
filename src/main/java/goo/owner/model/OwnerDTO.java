package goo.owner.model;

import org.springframework.web.multipart.MultipartFile;

public class OwnerDTO {
	
	private int owner_idx;
	private int member_idx;
	private String title;
	private String business_number;
	private String name;
	private String email;
	private String business_tel;
	private String tel;
	private int contenttype;
	private String firstimg;
	private String addr;
	private String detailed_addr;
	private String ad_content;
	private double mapx;
	private double mapy;
	private int areacode;
	private int sigungucode;
	private String state;
	private MultipartFile upload;
	
	public OwnerDTO() {
		super();
	}

	public OwnerDTO(int owner_idx, int member_idx, String title, String business_number, String name, String email,
			String business_tel, String tel, int contenttype, String firstimg, String addr, String detailed_addr,
			String ad_content, double mapx, double mapy, int areacode, int sigungucode, String state) {
		super();
		this.owner_idx = owner_idx;
		this.member_idx = member_idx;
		this.title = title;
		this.business_number = business_number;
		this.name = name;
		this.email = email;
		this.business_tel = business_tel;
		this.tel = tel;
		this.contenttype = contenttype;
		this.firstimg = firstimg;
		this.addr = addr;
		this.detailed_addr = detailed_addr;
		this.ad_content = ad_content;
		this.mapx = mapx;
		this.mapy = mapy;
		this.areacode = areacode;
		this.sigungucode = sigungucode;
		this.state = state;
	}

	public OwnerDTO(int member_idx, String title, String business_number, String name, String email, String business_tel,
			String tel, int contenttype, String firstimg, String addr, String detailed_addr, String ad_content,
			double mapx, double mapy, int areacode, int sigungucode, String state) {
		super();
		this.member_idx = member_idx;
		this.title = title;
		this.business_number = business_number;
		this.name = name;
		this.email = email;
		this.business_tel = business_tel;
		this.tel = tel;
		this.contenttype = contenttype;
		this.firstimg = firstimg;
		this.addr = addr;
		this.detailed_addr = detailed_addr;
		this.ad_content = ad_content;
		this.mapx = mapx;
		this.mapy = mapy;
		this.areacode = areacode;
		this.sigungucode = sigungucode;
		this.state = state;
	}

	public int getOwner_idx() {
		return owner_idx;
	}

	public void setOwner_idx(int owner_idx) {
		this.owner_idx = owner_idx;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
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

	public String getBusiness_tel() {
		return business_tel;
	}

	public void setBusiness_tel(String business_tel) {
		this.business_tel = business_tel;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getContenttype() {
		return contenttype;
	}

	public void setContenttype(int contenttype) {
		this.contenttype = contenttype;
	}

	public String getFirstimg() {
		return firstimg;
	}

	public void setFirstimg(String firstimg) {
		this.firstimg = firstimg;
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

	public String getAd_content() {
		return ad_content;
	}

	public void setAd_content(String ad_content) {
		this.ad_content = ad_content;
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

	public int getSigungucode() {
		return sigungucode;
	}

	public void setSigungucode(int sigungucode) {
		this.sigungucode = sigungucode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	
	
}
