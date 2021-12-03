package goo.sigungu.model;

import java.util.*;

public interface SigunguDAO {

	public int addSigungu(SigunguDTO dto);
	public List<SigunguDTO> sigunguList();
	public String getSigunguName(Map map);
}
