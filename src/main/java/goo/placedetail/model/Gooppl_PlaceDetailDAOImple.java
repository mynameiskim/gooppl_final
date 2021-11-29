package goo.placedetail.model;

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

}
