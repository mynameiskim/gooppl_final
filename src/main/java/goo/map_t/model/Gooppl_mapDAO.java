package goo.map_t.model;

import java.sql.*;
import java.util.*;

public interface Gooppl_mapDAO {

	public int getMapIdx(Gooppl_mapDTO dto);
	public int getMemberIdx(int map_idx);
}
