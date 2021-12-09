package goo.placedetail.model;

import java.util.*;

import goo.mapinfo.model.MapInfoDTO;

public interface Gooppl_PlaceDetailService {

	public int addPlaceDetail(Gooppl_PlaceDetailDTO dto);
	public List<Gooppl_PlaceDetailDTO> placeDetailList(int contentid);
	public List<Gooppl_PlaceDetailDTO> getThisDateDetail(List<Integer> contentids);
	public int getLastAreacode(int map_idx, int day_num);
	public String getFirstImg(int map_idx);
}
