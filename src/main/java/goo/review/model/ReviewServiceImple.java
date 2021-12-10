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
/**		리뷰등록	*/
	public int writeReview(ReviewDTO dto) {
		int result = reviewDao.writeReview(dto);
		return result;
	}
/**		리스트관련 메서드	*/
	public List<ReviewDTO> reviewList(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<ReviewDTO> list=reviewDao.reviewList(map);
		return list;
	}
/**		본문보기	*/
	public ReviewDTO reviewContent(int review_idx) {
		ReviewDTO dto=reviewDao.reviewContent(review_idx);
		if(dto!=null) {
			dto.setPrologue(dto.getPrologue().replaceAll("\n","<br>"));
			dto.setEpilogue(dto.getEpilogue().replaceAll("\n","<br>"));
		}
		return dto;
	}
/**		총 게시물 수	*/
	public int getTotalCnt() {
		int count = reviewDao.getTotalCnt();
		return count;
	}
	
/**		리뷰삭제 	*/	
	public int delReview(int review_idx) {
		int count = reviewDao.delReview(review_idx);
		return count;
	}
/**		리뷰수정	*/
	public int updateReview(ReviewDTO dto) {
		int count = reviewDao.updateReview(dto);
		return count;
	}
/**		리뷰 IDX 최댓값*/
	public int getMaxReview() {
		int count = reviewDao.getMaxReview();
		return count;
	}
	public List<ReviewDTO> getReview(int member_idx){
		List<ReviewDTO> reviewDTO = reviewDao.getReview(member_idx);
		return reviewDTO;
	}
	public List<ReviewDTO> findReview(String keywards) {
		List<ReviewDTO> flist = reviewDao.findReview(keywards);
		return flist;
	}
	public int getTotalFindCnt(String keywards) {
		int count = reviewDao.getTotalFindCnt(keywards);
		return count;
	}
}
