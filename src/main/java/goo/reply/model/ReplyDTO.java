package goo.reply.model;

import java.sql.*;

public class ReplyDTO {
	
	private int ridx;
	private String type;
	private String content;
	private String nickname;
	private Date writedate;
	private int grpno;
	private int lev;
	private int sunbun;
	private int review_idx;
	
	public ReplyDTO() {
		super();
	}

	public ReplyDTO(int ridx, String type, String content, String nickname, Date writedate, int grpno, int lev,
			int sunbun, int review_idx) {
		super();
		this.ridx = ridx;
		this.type = type;
		this.content = content;
		this.nickname = nickname;
		this.writedate = writedate;
		this.grpno = grpno;
		this.lev = lev;
		this.sunbun = sunbun;
		this.review_idx = review_idx;
	}

	public int getRidx() {
		return ridx;
	}

	public void setRidx(int ridx) {
		this.ridx = ridx;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getGrpno() {
		return grpno;
	}

	public void setGrpno(int grpno) {
		this.grpno = grpno;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getSunbun() {
		return sunbun;
	}

	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
	}

	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}
	
}



