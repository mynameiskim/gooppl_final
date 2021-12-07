package goo.start_area.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class StartAreaDAOImple implements StartAreaDAO {

	private SqlSessionTemplate sqlMap;
	
	public StartAreaDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public StartAreaDAOImple() {
		// TODO Auto-generated constructor stub
	}
	
	public List<StartAreaDTO> getStartAreaInfo() {
		List<StartAreaDTO> dto = sqlMap.selectList("getStartAreaInfo");
		return dto;
	}
	
	

}
