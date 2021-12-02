package goo.formmail.model;

import java.util.List;

public class FormmailServiceImple implements FormmailService {

	private FormmailDAO formmailDao;

	public FormmailServiceImple(FormmailDAO formmailDao) {
		super();
		this.formmailDao = formmailDao;
	}
	
	public List<FormmailDTO> formmail() {
		List<FormmailDTO> list = formmailDao.formmail();
		return list;
	}
	
	public FormmailDTO formType(String form_type) {
		FormmailDTO fdto = formmailDao.formType(form_type);
		return fdto;
	}
	
	public int selectedUpdate(String form_type) {
		int count = formmailDao.selectedUpdate(form_type);
		return count;
	}
	
	public int formUpdate(FormmailDTO fdto) {
		int count = formmailDao.formUpdate(fdto);
		return count;
	}
}
