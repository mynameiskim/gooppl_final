package goo.review.model;

import java.util.*;

public interface ReviewDAO {

	public int writeReview(ReviewDTO dto);
	public List<ReviewDTO> reviewList(Map map);
	public ReviewDTO reviewContent(int review_idx);
	public int getTotalCnt();
	public int delReview(int review_idx);
	public int updateReview(ReviewDTO dto);
	public int getMaxReview();
	public List<ReviewDTO> getReview(int member_idx);
}
