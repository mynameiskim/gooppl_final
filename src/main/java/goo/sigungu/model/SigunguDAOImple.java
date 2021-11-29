package goo.sigungu.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class SigunguDAOImple implements SigunguDAO {

	private SqlSessionTemplate sqlMap;
	
	public SigunguDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int addSigungu(SigunguDTO dto) {
		int count=sqlMap.selectOne("sigunguexist", dto);
		int result=0;
		if(count==0) {
			result=sqlMap.insert("sigunguInsert", dto);
		}
		
		return result;
	}
	public List<SigunguDTO> sigunguList() {
		List<SigunguDTO> list = sqlMap.selectList("sigunguSelect");
		return list;
	}
}
