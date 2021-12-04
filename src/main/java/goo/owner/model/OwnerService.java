package goo.owner.model;

import java.util.List;

public interface OwnerService {
	public int addOwnerInfo(OwnerDTO dto);
	public List<OwnerDTO> allOwnerSelect();
	public OwnerDTO getOwnerDetail(int owner_idx);
	public OwnerDTO ckOwnerInfo(int member_idx);
}
