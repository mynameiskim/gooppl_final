package goo.review_img.model;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Review_imgServiceImple implements Review_imgService {
	
	private Review_imgDAO review_imgDao;

	
	public int addReviewImg(Review_imgDTO idto, MultipartFile upload , int member_idx) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public void copyinto(MultipartFile uploads, int member_idx) {
		System.out.println("회원 idx : " +member_idx);
		System.out.println("올린 파일명 : "+uploads.getOriginalFilename());
		
		try {
			byte[] bytes= uploads.getBytes(); //원본
			//복사본
			File outFile=new File(UPLOAD_PATH+"\\"+uploads.getOriginalFilename());
			//byte단위로 복사해야함 
			FileOutputStream fos=new FileOutputStream(outFile);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public String getPath(MultipartFile uploads) {
		String	path = UPLOAD_PATH+"\\"+uploads.getOriginalFilename();
		return path;
	}

	public String[] showList() {
		
		File listFile=new File(UPLOAD_PATH);
		String fileNames[]=listFile.list();
		
		for(int i=0;i<fileNames.length;i++) {
			System.out.println(fileNames[i]);
		}
		return fileNames;
	}

}
