package goo.mapinfo.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class MapInfoDAOImple implements MapInfoDAO {

	private SqlSessionTemplate sqlMap;
	
	public MapInfoDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int addMapInfo(MapInfoDTO dto) {
		int result=sqlMap.insert("addMapInfo",dto);
		return result;
	}
	
	public List<MapInfoDTO> mapInfoList(Map map) {
		List<MapInfoDTO> list = sqlMap.selectList("getMapInfo",map);
		return list;
	}
	public List<Integer> getThisMapInfo(Map map) {
		
		List<Integer> list=sqlMap.selectList("getThisMapInfo", map);
		return list;
	}
	
	public int deleteMapInfo(Map map) {
		int result=sqlMap.delete("deleteMapInfo", map);
		return result;
	}
	public int getTotalPlace(int map_idx) {
		int count = sqlMap.selectOne("getTotalPlace",map_idx);
		return count;
	}
	public int deleteMapDay(Map map) {
		int count=sqlMap.delete("deleteMapDay", map);
		return count;
	}
	public int delThisDayAllInfo(Map map) {
		int count=sqlMap.delete("delThisDayAllInfo", map);
		return count;
	}
}
