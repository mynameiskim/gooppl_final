package goo.review_img.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface Review_imgService {

	public static final String UPLOAD_PATH = "E:\\박연수\\gooppl\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\gooppl\\upload";

	public int addReviewImg(Review_imgDTO idto,MultipartFile upload,int member_idx);
	/**파일 경로 반환 메서드*/
	public String getPath(MultipartFile uploads);
	/**파일 목록 관련 메서드*/
	public String[] showList(); 
	
	public void copyinto(MultipartFile uploads, int member_idx);
}
