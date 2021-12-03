package goo.area.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class AreaDAOImple implements AreaDAO {

	private SqlSessionTemplate sqlMap;
	
	public AreaDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<AreaDTO> areaList() {
		List<AreaDTO> list = sqlMap.selectList("areaSelect");
		return list;
	}

	public String getAreaName(int areacode) {
		String areaname=sqlMap.selectOne("getAreaName", areacode);
		return areaname;
	}
}
