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

	public List<Gooppl_PlaceDetailDTO> getThisDateDetail(List<Integer> contentids) {
		List<Gooppl_PlaceDetailDTO> list=new ArrayList();
		for(int i=0;i<contentids.size();i++) {
			int contentid=contentids.get(i);
			Gooppl_PlaceDetailDTO dto=gooppl_placedetailDao.getThisDateDetail(contentid);
			dto.setOverview(dto.getOverview().replaceAll("\n", "<br>"));
			dto.setOverview(dto.getOverview().replaceAll("'", ""));
			dto.setHomepage(dto.getHomepage().replaceAll("\n", "<br>"));
			list.add(dto);
		}
		return list;
	}
	
	public int getLastAreacode(int map_idx, int day_num) {
		Map map = new HashMap();
		map.put("map_idx", map_idx);
		map.put("day_num", day_num);
		int result=gooppl_placedetailDao.getLastAreacode(map);
		return result;
	}
}
