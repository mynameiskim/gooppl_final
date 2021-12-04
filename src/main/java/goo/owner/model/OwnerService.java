package goo.owner.model;

import java.util.List;
import java.util.Map;

public interface OwnerService {
	public int addOwnerInfo(OwnerDTO dto);
	public OwnerDTO ckOwnerInfo(int member_idx);
	public int totalOwnerAppli();
	public int totalOwner();
	public List<OwnerDTO> allOwnerAppliInfo(int cp, int ls);
	public OwnerDTO ownerInfo(int owner_idx);
	public int admin_ownerAppli_ok(int owner_idx);
	public int admin_ownerAppli_del(int owner_idx);
	public List<OwnerDTO> admin_allOwner(int cp, int ls);
}
