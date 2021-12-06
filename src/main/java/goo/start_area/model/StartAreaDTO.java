package goo.start_area.model;

public class StartAreaDTO {

	private int start_area_idx;
	private String kr_name;
	private String en_name;
	private int areacode;
	private int sigungucode;
	private String area_description;
	private String start_area_img;
	
	public StartAreaDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public StartAreaDTO(int start_area_idx, String kr_name, String en_name, int areacode, int sigungucode,
			String area_description, String start_area_img) {
		super();
		this.start_area_idx = start_area_idx;
		this.kr_name = kr_name;
		this.en_name = en_name;
		this.areacode = areacode;
		this.sigungucode = sigungucode;
		this.area_description = area_description;
		this.start_area_img = start_area_img;
	}
	
	

	public int getStart_area_idx() {
		return start_area_idx;
	}

	public void setStart_area_idx(int start_area_idx) {
		this.start_area_idx = start_area_idx;
	}

	public String getKr_name() {
		return kr_name;
	}

	public void setKr_name(String kr_name) {
		this.kr_name = kr_name;
	}

	public String getEn_name() {
		return en_name;
	}

	public void setEn_name(String en_name) {
		this.en_name = en_name;
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

	public String getArea_description() {
		return area_description;
	}

	public void setArea_description(String area_description) {
		this.area_description = area_description;
	}

	public String getStart_area_img() {
		return start_area_img;
	}

	public void setStart_area_img(String start_area_img) {
		this.start_area_img = start_area_img;
	}
	
}
