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
		for(int i=0;i<list.size();i++) {
			String originContent=list.get(i).getContent();
			if(originContent.contains("<img")) {
				int start=originContent.indexOf("<img");
				String content2=originContent.substring(start, originContent.length());
				int end=content2.indexOf(">");
				StringBuffer str=new StringBuffer();
				str.append(originContent.substring(start, start+end-1));
				str.append(" alt=\"썸네일\" style=\"width: 100%;\" class=\"img-fluid rounded-start\">");
				list.get(i).setContent(str.toString());
			}else {
				list.get(i).setContent("<img src=\"http://www.outdoornews.co.kr/news/photo/201707/24502_76816_822.jpg\" class=\"img-fluid rounded-start\" alt=\"썸네일\" style=\"width: 100%;\">");
			}
		}
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
