package goo.review_img.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import goo.review.model.ReviewDTO;

public class Review_imgDAOImple implements Review_imgDAO {

	private SqlSessionTemplate sqlMap;
	
	
	public Review_imgDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int addImgPath(Review_imgDTO dto) {
		int result = sqlMap.insert("review_imgInsert",dto);
		return result;
	}
/** 해당 게시글등록 수정시 게시글안에서 보여질 이미지 ( 순서대로 ) */
	public List<Review_imgDTO> review_imgContent(Map map) {
		List<Review_imgDTO> list = sqlMap.selectList("review_imgAllList",map);
		return list;
	}
/**forEach로 순서 못정하면 쓸 거임 */
	public Review_imgDTO review_imgContent(int review_idx) {
		Review_imgDTO dto=sqlMap.selectOne("review_imgContent",review_idx);
		return dto;
	}
}
