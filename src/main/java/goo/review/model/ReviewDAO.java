package goo.review.model;

import java.util.*;

public interface ReviewDAO {

	public int writeReview(ReviewDTO dto);
	public List<ReviewDTO> reviewList(Map map);
	public ReviewDTO reviewContent(int idx);
	public int getTotalCnt();
}
