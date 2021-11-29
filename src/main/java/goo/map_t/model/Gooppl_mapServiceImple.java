package goo.map_t.model;

public class Gooppl_mapServiceImple implements Gooppl_mapService {

	private Gooppl_mapDAO gooppl_mapDao;
	
	public Gooppl_mapDAO getGooppl_mapDao() {
		return gooppl_mapDao;
	}

	public void setGooppl_mapDao(Gooppl_mapDAO gooppl_mapDao) {
		this.gooppl_mapDao = gooppl_mapDao;
	}

	public int getMapidx(Gooppl_mapDTO dto) {
		int result=gooppl_mapDao.getMapIdx(dto);
		return result;
	}

}
