package goo.memberout.model;

import java.util.List;
import java.util.Map;

public interface MemberOutService {
	
	public int insertMemberOut(Map hmp);
	public List<MemberOutDTO> memberOutList(int cp,int listSize);
}
