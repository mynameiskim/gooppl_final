package goo.memberout.model;

import java.util.List;
import java.util.*;

public interface MemberOutDAO {
	
	public List<MemberOutDTO> memberOutList();
	public int insertMemberOut(Map hmp);
}
