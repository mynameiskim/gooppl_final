package goo.review.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ReviewDAOImple implements ReviewDAO {

	private SqlSessionTemplate sqlMap;
	
	
	public ReviewDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int writeReview(ReviewDTO dto) {
		int result=sqlMap.insert("reviewInsert", dto);
		return result;
	}

	public List<ReviewDTO> reviewList(Map map) {
		List<ReviewDTO> list = sqlMap.selectList("reviewAllList",map);
		return list;
	}

	public ReviewDTO reviewContent(int idx) {
		ReviewDTO dto=sqlMap.selectOne("reviewContent",idx);
		return dto;
	}

	public int getTotalCnt() {
		int count=sqlMap.selectOne("totalCnt");
		return count;
	}

}
