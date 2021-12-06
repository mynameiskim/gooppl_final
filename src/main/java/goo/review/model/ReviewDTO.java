package goo.review.model;

import java.sql.Date;

public class ReviewDTO {
 
	private int review_idx;
	private String subject;
	private String nickname;
	private String prologue;
	private String content;
	private int readnum;
	private Date writedate;
	private String epilogue;
	private int member_idx;
	public ReviewDTO() {
	
	}
	
	public ReviewDTO(int review_idx, String subject, String nickname, String prologue, String content, int readnum,
			Date writedate, String epilogue, int member_idx) {
		super();
		this.review_idx = review_idx;
		this.subject = subject;
		this.nickname = nickname;
		this.prologue = prologue;
		this.content = content;
		this.readnum = readnum;
		this.writedate = writedate;
		this.epilogue = epilogue;
		this.member_idx = member_idx;
	}

	public int getReview_idx() {
		return review_idx;
	}
	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPrologue() {
		return prologue;
	}
	public void setPrologue(String prologue) {
		this.prologue = prologue;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadnum() {
		return readnum;
	}
	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public String getEpilogue() {
		return epilogue;
	}
	public void setEpilogue(String epilogue) {
		this.epilogue = epilogue;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	
}
