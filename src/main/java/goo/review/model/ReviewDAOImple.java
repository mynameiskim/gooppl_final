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
		int result =0;
		if(dto.getContent()==null||dto.getPrologue()==null
				||dto.getSubject()==null||dto.getEpilogue()==null) {
			result=-1;
		}else {
			result=sqlMap.insert("reviewInsert", dto);
		}
		return result;
	}

	public List<ReviewDTO> reviewList(Map map) {
		List<ReviewDTO> list = sqlMap.selectList("reviewAllList",map);
		return list;
	}

	public ReviewDTO reviewContent(int review_idx) {
		ReviewDTO dto=sqlMap.selectOne("reviewContent",review_idx);
		return dto;
	}

	public int getTotalCnt() {
		int count=sqlMap.selectOne("totalCnt");
		return count;
	}
	
	public int delReview(int review_idx) {
		int count=sqlMap.delete("reviewDelete", review_idx);
		return count;
	}

	public int updateReview(ReviewDTO dto) {
		int count=sqlMap.update("reviewUpdate", dto);
		return count;
	}
	public int getMaxReview() {
		int count = sqlMap.selectOne("getMaxReview");
		return count;
	}
	public List<ReviewDTO> getReview(int member_idx) {
		List<ReviewDTO> reviewDTO = sqlMap.selectList("getReview",member_idx);
		return reviewDTO;
	}
}
