package goo.placedetail.model;

import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import goo.map_t.model.Gooppl_mapDTO;
import goo.mapinfo.model.MapInfoDTO;

public class Gooppl_PlaceDetailDAOImple implements Gooppl_PlaceDetailDAO {

	private SqlSessionTemplate sqlMap;
	
	public Gooppl_PlaceDetailDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int addPlaceDetail(Gooppl_PlaceDetailDTO dto) {
		int count=sqlMap.selectOne("existContentid", dto.getContentid());
		int result;
		if(count==0) {
			result=sqlMap.insert("addPlaceDetail", dto);
		}else {
			result=0;
		}
		return result;
	}
	
	public List<Gooppl_PlaceDetailDTO> placeDetailList(int contentid) {
		List<Gooppl_PlaceDetailDTO> list = sqlMap.selectList("detailList");
		return list;
	}

	public Gooppl_PlaceDetailDTO getThisDateDetail(int contentid) {
		Gooppl_PlaceDetailDTO dto=sqlMap.selectOne("getThisDateDetail", contentid);
		return dto;
	}
	
	public int getLastAreacode(Map map) {
		int result=sqlMap.selectOne("getLastAreacode", map);
		return result;
	}
	public String getFirstImg(int map_idx) {
		String firstImg = sqlMap.selectOne("getFirstImg",map_idx);
		return firstImg;
	}
	
}
