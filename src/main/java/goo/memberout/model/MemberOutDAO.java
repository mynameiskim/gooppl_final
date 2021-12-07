package goo.memberout.model;

import java.util.List;

import java.util.*;


public interface MemberOutDAO {
	
	public List<MemberOutDTO> memberOutList(Map<String, Object> map);
	public int insertMemberOut(Map hmp);
	public List<MemberOutDTO> memberOutList(Map map);
	public int totalMemberOut();
	public int searchTotalMemberOut(String search_type,String search,String start_date,String end_date);
	public int memberOutDelete(int out_no);
}
