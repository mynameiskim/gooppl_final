package goo.inquiry.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class InquiryDAOImple implements InquiryDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public InquiryDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public InquiryDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public List<InquiryDTO> inquiryList(int member_idx) {
		List<InquiryDTO> list = sqlMap.selectList("inquiryList",member_idx);
		return list;
	}
	public int addInquiry(Map hmp) {
		int count = sqlMap.insert("addInquiry",hmp);
		return count;
	}
}
