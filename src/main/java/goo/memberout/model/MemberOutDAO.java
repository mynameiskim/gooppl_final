package goo.memberout.model;

import java.util.List;
import java.util.Map;

public interface MemberOutDAO {
	
	public List<MemberOutDTO> memberOutList(Map map);
	public int totalMemberOut();
	public int memberOutDelete(int out_no);
}
