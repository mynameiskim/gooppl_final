package goo.placedetail.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

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
}
