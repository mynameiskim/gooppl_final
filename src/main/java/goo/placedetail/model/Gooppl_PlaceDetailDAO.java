package goo.placedetail.model;

import java.util.*;

public interface Gooppl_PlaceDetailDAO {

	public int addPlaceDetail(Gooppl_PlaceDetailDTO dto);
	public Gooppl_PlaceDetailDTO getThisDateDetail(int contentid);
	public int getLastAreacode(Map map);
}
