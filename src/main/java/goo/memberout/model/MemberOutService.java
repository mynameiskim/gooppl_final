package goo.memberout.model;

import java.util.List;
import java.util.Map;

public interface MemberOutService {
	
	public List<MemberOutDTO> memberOutList(int cp,int ls,String search_type,String search,String start_date,String end_date);
	public int insertMemberOut(Map hmp);
	public List<MemberOutDTO> memberOutList(int cp,int listSize);
}
