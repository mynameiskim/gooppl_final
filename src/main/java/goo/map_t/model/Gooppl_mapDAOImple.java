package goo.map_t.model;

import org.mybatis.spring.SqlSessionTemplate;

public class Gooppl_mapDAOImple implements Gooppl_mapDAO {

	private SqlSessionTemplate sqlMap;
	
	public Gooppl_mapDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int getMapIdx(Gooppl_mapDTO dto) {
		int result=sqlMap.insert("addMap_t", dto);
		int result2;
		if(result>0) {
			result2=sqlMap.selectOne("getMapIdx");
		}else {
			result2=0;
		}
		return result2;
	}
	public int getMemberIdx(int map_idx) {
		int result=sqlMap.selectOne("getMemberIdx", map_idx);
		return result;
	}

}
