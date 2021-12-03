package goo.review.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReviewServiceImple implements ReviewService {

	private ReviewDAO reviewDao;
	
	
	public ReviewDAO getReviewDao() {
		return reviewDao;
	}

	public void setReviewDao(ReviewDAO reviewDao) {
		this.reviewDao = reviewDao;
	}

	public int writeReview(ReviewDTO dto) {
		int result = reviewDao.writeReview(dto);
		return result;
	}

	public List<ReviewDTO> reviewList(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<ReviewDTO> list=reviewDao.reviewList(map);
		return list;
	}

	public ReviewDTO reviewContent(int review_idx) {
		ReviewDTO dto=reviewDao.reviewContent(review_idx);
		if(dto!=null) {
			dto.setPrologue(dto.getPrologue().replaceAll("\n","<br>"));
			dto.setEpilogue(dto.getEpilogue().replaceAll("\n","<br>"));
		}
		return dto;
	}

	public int getTotalCnt() {
		int count = reviewDao.getTotalCnt();
		return count;
	}

}
