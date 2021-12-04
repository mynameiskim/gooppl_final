package goo.memberout.model;

import java.util.List;

public interface MemberOutDAO {
	
	public List<MemberOutDTO> memberOutList();
	public int totalMemberOut();
}
