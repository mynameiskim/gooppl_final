package goo.review.model;

import java.util.*;

public interface ReviewService {

	public int writeReview(ReviewDTO dto);
	public List<ReviewDTO> reviewList(int cp,int ls);
	public ReviewDTO reviewContent(int idx);
	public int getTotalCnt();
	public int getTotalFindCnt(String keywards);
	public int delReview(int review_idx);
	public int updateReview(ReviewDTO dto);
	public int getMaxReview();
	public List<ReviewDTO> getReview(int member_idx);
	public List<ReviewDTO> findReview(String keywards);
	public int updateReadnum(int review_idx);
	public int reviewDel(int review_idx);
}
