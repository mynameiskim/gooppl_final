package goo.memberout.model;

import java.util.List;
import java.util.Map;

public interface MemberOutService {
	
	public List<MemberOutDTO> memberOutList();
	public int insertMemberOut(Map hmp);
}
