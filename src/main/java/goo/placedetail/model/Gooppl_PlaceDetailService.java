package goo.placedetail.model;

import java.util.*;

public interface Gooppl_PlaceDetailService {

	public int addPlaceDetail(Gooppl_PlaceDetailDTO dto);
	public List<Gooppl_PlaceDetailDTO> getThisDateDetail(List<Integer> contentids);
	public int getLastAreacode(int map_idx, int day_num);
}
