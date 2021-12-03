package goo.owner.model;

import java.util.*;

public interface OwnerDAO {
	public int addOwnerInfo(OwnerDTO dto);
	public OwnerDTO ownerAppli(int member_idx);
	public List<OwnerDTO> allOwnerSelect();
	public OwnerDTO getOwnerDetail(int owner_idx);
}
