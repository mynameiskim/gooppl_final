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

	public List<Gooppl_PlaceDetailDTO> getThisDateDetail(List<Integer> contentids) {
		List<Gooppl_PlaceDetailDTO> list=new ArrayList();
		for(int i=0;i<contentids.size();i++) {
			int contentid=contentids.get(i);
			Gooppl_PlaceDetailDTO dto=gooppl_placedetailDao.getThisDateDetail(contentid);
			dto.setOverview(dto.getOverview().replaceAll("\n", "<br>"));
			list.add(dto);
		}
		return list;
	}
}
