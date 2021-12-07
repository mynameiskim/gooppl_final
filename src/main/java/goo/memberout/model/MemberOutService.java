package goo.memberout.model;

import java.util.List;

public interface MemberOutService {
	
	public List<MemberOutDTO> memberOutList(int cp,int ls,String search_type,String search,String start_date,String end_date);
}
