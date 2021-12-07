package goo.memberout.model;

import java.util.*;

public class MemberOutServiceImple implements MemberOutService {
	
	private MemberOutDAO memberOutDao;
	
	public MemberOutServiceImple(MemberOutDAO memberOutDao) {
		super();
		this.memberOutDao = memberOutDao;
	}

	public List<MemberOutDTO> memberOutList(int cp,int ls,String search_type,String search,String start_date,String end_date) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("start", start);
		map.put("end",end);
		map.put("search_type", search_type);
		map.put("search", search);
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		List<MemberOutDTO> list = memberOutDao.memberOutList(map);
		return list;
	}
}
