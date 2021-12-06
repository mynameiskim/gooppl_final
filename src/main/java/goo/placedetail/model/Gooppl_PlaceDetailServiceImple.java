package goo.placedetail.model;

import java.util.*;

public class Gooppl_PlaceDetailServiceImple implements Gooppl_PlaceDetailService {
	
	Gooppl_PlaceDetailDAO gooppl_placedetailDao;
	
	public Gooppl_PlaceDetailDAO getGooppl_placedetailDao() {
		return gooppl_placedetailDao;
	}

	public void setGooppl_placedetailDao(Gooppl_PlaceDetailDAO gooppl_placedetailDao) {
		this.gooppl_placedetailDao = gooppl_placedetailDao;
	}

	public int addPlaceDetail(Gooppl_PlaceDetailDTO dto) {
		int result=gooppl_placedetailDao.addPlaceDetail(dto);
		return result;
	}
	
	public List<Gooppl_PlaceDetailDTO> placeDetailList(int contentid) {
		List<Gooppl_PlaceDetailDTO> list = gooppl_placedetailDao.placeDetailList(contentid);
		return list;
	}

}
