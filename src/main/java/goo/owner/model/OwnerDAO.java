package goo.owner.model;

import java.util.List;
import java.util.Map;

public interface OwnerDAO {
	public int addOwnerInfo(OwnerDTO dto);
	public OwnerDTO ckOwnerInfo(int member_idx);
	public int totalOwnerAppli();
	public List<OwnerDTO> allOwnerAppliInfo(Map map);
	public OwnerDTO ownerInfo(int member_idx);
}
