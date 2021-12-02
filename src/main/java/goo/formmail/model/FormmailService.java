package goo.formmail.model;

import java.util.List;

public interface FormmailService {

	public List<FormmailDTO> formmail();
	public FormmailDTO formType(String form_type);
	public int selectedUpdate(String form_type);
	public int formUpdate(FormmailDTO fdto);
}
