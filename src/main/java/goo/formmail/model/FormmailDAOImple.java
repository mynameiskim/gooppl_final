package goo.formmail.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class FormmailDAOImple implements FormmailDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public FormmailDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<FormmailDTO> formmail() {
		List<FormmailDTO> list = sqlMap.selectList("formmail");
		return list;
	}
	
	public FormmailDTO formType(String form_type) {
		FormmailDTO fdto = sqlMap.selectOne("formType", form_type);
		return fdto;
	}
	
	public int selectedUpdate(String form_type) {
		int result;
		int count1 = sqlMap.update("selectedUpdate1",form_type);
		int count2 = sqlMap.update("selectedUpdate2", form_type);
		if(count1>0&&count2>0) {
			result=1;
		}else {
			result=0;
		}
		return result;
	}
	
	public int formUpdate(FormmailDTO fdto) {
		int count = sqlMap.update("formUpdate", fdto);
		return count;
	}
	
	public FormmailDTO emailTokenFormmail(int form_no) {
		FormmailDTO dto = sqlMap.selectOne("emailTokenFormmail",form_no);
		return dto;
	}
}
