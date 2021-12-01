package goo.sigungu.model;

import java.util.*;

public class SigunguServiceImple implements SigunguService {

	private SigunguDAO sigunguDao;
	
	public SigunguDAO getSigunguDao() {
		return sigunguDao;
	}

	public void setSigunguDao(SigunguDAO sigunguDao) {
		this.sigunguDao = sigunguDao;
	}

	public int addSigungu(SigunguDTO dto) {
		int result = sigunguDao.addSigungu(dto);
		return result;
	}
	public List<SigunguDTO> sigunguList() {
		List<SigunguDTO> list=sigunguDao.sigunguList();
		return list;
	}
	public String getSigunguName(int areacode, int sigungucode) {
		Map map=new HashMap();
		map.put("areacode", areacode);
		map.put("sigungucode", sigungucode);
		String sigunguName=sigunguDao.getSigunguName(map);
		return sigunguName;
	}
}
