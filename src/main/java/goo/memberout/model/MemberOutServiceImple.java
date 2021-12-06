package goo.memberout.model;

import java.util.List;
import java.util.Map;

public class MemberOutServiceImple implements MemberOutService {
	
	private MemberOutDAO memberOutDao;
	
	public MemberOutServiceImple(MemberOutDAO memberOutDao) {
		super();
		this.memberOutDao = memberOutDao;
	}

	public List<MemberOutDTO> memberOutList() {
		List<MemberOutDTO> list = memberOutDao.memberOutList();
		return list;
	}
	public int insertMemberOut(Map hmp) {
		int count = memberOutDao.insertMemberOut(hmp);
		return count;
	}
}
