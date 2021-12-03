package goo.review_img.model;

import java.util.*;

public interface Review_imgDAO {

	public int addImgPath(Review_imgDTO dto);
	public List<Review_imgDTO> review_imgContent(Map map);
}
