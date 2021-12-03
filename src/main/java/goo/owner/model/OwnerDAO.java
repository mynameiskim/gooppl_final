package goo.owner.model;

import java.util.*;

public interface OwnerDAO {
	public int addOwnerInfo(OwnerDTO dto);
	public List<OwnerDTO> allOwnerSelect();
	public OwnerDTO getOwnerDetail(int owner_idx);
	public OwnerDTO ckOwnerInfo(int member_idx);
}
