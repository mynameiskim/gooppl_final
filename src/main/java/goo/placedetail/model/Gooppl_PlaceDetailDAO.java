package goo.placedetail.model;

import java.util.*;

public interface Gooppl_PlaceDetailDAO {

	public int addPlaceDetail(Gooppl_PlaceDetailDTO dto);
	public List<Gooppl_PlaceDetailDTO> placeDetailList(int contentid);
	public Gooppl_PlaceDetailDTO getThisDateDetail(int contentid);
	public int getLastAreacode(Map map);
}
