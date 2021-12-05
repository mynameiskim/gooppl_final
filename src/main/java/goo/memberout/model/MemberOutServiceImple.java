package goo.memberout.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import goo.member.model.MemberDTO;

public class MemberOutServiceImple implements MemberOutService {
	
	private MemberOutDAO memberOutDao;
	
	public MemberOutServiceImple(MemberOutDAO memberOutDao) {
		super();
		this.memberOutDao = memberOutDao;
	}

	public List<MemberOutDTO> memberOutList(int cp,int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end",end);
		List<MemberOutDTO> list = memberOutDao.memberOutList(map);
		return list;
	}
}
