package goo.owner.model;

import java.util.List;

public interface OwnerService {
	public int addOwnerInfo(OwnerDTO dto);
	public OwnerDTO ownerAppli(int member_idx);
	public List<OwnerDTO> allOwnerSelect();
	public OwnerDTO getOwnerDetail(int owner_idx);
}
