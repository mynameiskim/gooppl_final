package goo.owner.model;

import java.util.List;
import java.util.Map;

public interface OwnerDAO {
	public int addOwnerInfo(OwnerDTO dto);
	public OwnerDTO ckOwnerInfo(int member_idx);
	public int totalOwner();
	public int totalOwnerAppli();
	public List<OwnerDTO> allOwnerAppliInfo(Map map);
	public OwnerDTO ownerInfo(int owner_idx);
	public int admin_ownerAppli_ok(int owner_idx);
	public int admin_ownerAppli_del(int owner_idx);
	public List<OwnerDTO> admin_allOwner(Map map);
}
