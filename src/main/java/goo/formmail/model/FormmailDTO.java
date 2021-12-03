package goo.formmail.model;

public class FormmailDTO {
	private int form_no;
	private String form_type;
	private String form_title;
	private String form_content;
	
	public FormmailDTO() {
		
	}

	public FormmailDTO(int form_no, String form_type, String form_title, String form_content) {
		super();
		this.form_no = form_no;
		this.form_type = form_type;
		this.form_title = form_title;
		this.form_content = form_content;
	}

	@Override
	public String toString() {
		return "FormmailDTO [form_no=" + form_no + ", form_type=" + form_type + ", form_title=" + form_title
				+ ", form_content=" + form_content + "]";
	}

	public int getForm_no() {
		return form_no;
	}

	public void setForm_no(int form_no) {
		this.form_no = form_no;
	}

	public String getForm_type() {
		return form_type;
	}

	public void setForm_type(String form_type) {
		this.form_type = form_type;
	}

	public String getForm_title() {
		return form_title;
	}

	public void setForm_title(String form_title) {
		this.form_title = form_title;
	}

	public String getForm_content() {
		return form_content;
	}

	public void setForm_content(String form_content) {
		this.form_content = form_content;
	}
	
	
}
