package goo.review_img.model;

import org.springframework.web.multipart.MultipartFile;

public class Review_imgDTO {

	private int review_img_idx;
	private String path;
	private String path_content;
	private int member_idx;
	private int review_idx;
	private MultipartFile upload;
	public Review_imgDTO() {
		
	}

	
	public Review_imgDTO(int review_img_idx, String path, String path_content, int member_idx, int review_idx) {
		super();
		this.review_img_idx = review_img_idx;
		this.path = path;
		this.path_content = path_content;
		this.member_idx = member_idx;
		this.review_idx = review_idx;
	}

	
	
	public Review_imgDTO(MultipartFile upload) {
		super();
		this.upload = upload;
	}


	public MultipartFile getUpload() {
		return upload;
	}


	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}


	public int getReview_img_idx() {
		return review_img_idx;
	}

	public void setReview_img_idx(int review_img_idx) {
		this.review_img_idx = review_img_idx;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getPath_content() {
		return path_content;
	}

	public void setPath_content(String path_content) {
		this.path_content = path_content;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	
}
