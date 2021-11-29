package goo.member.model;

import java.sql.Date;

public class MemberDTO {
	
	private int member_idx;
	private String goo_id;
	private String naver_id;
	private String kakao_id;
	private String pwd;
	private String nickname;
	private Date join_date;
	private String del;
	private String member_type;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(int member_idx, String goo_id, String naver_id, String kakao_id, String pwd, String nickname,
			Date join_date, String del, String member_type) {
		super();
		this.member_idx = member_idx;
		this.goo_id = goo_id;
		this.naver_id = naver_id;
		this.kakao_id = kakao_id;
		this.pwd = pwd;
		this.nickname = nickname;
		this.join_date = join_date;
		this.del = del;
		this.member_type = member_type;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public String getGoo_id() {
		return goo_id;
	}

	public void setGoo_id(String goo_id) {
		this.goo_id = goo_id;
	}

	public String getNaver_id() {
		return naver_id;
	}

	public void setNaver_id(String naver_id) {
		this.naver_id = naver_id;
	}

	public String getKakao_id() {
		return kakao_id;
	}

	public void setKakao_id(String kakao_id) {
		this.kakao_id = kakao_id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public String getMember_type() {
		return member_type;
	}

	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}
	
	
	
	

}
