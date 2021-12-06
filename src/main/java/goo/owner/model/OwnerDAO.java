package goo.owner.model;

import java.util.*;


public interface OwnerDAO {
	public int addOwnerInfo(OwnerDTO dto);
	public List<OwnerDTO> allOwnerSelect();
	public OwnerDTO getOwnerDetail(int owner_idx);
	public OwnerDTO ckOwnerInfo(int member_idx);
	public int totalOwner();
	public int totalOwnerAppli();
	public List<OwnerDTO> allOwnerAppliInfo(Map map);
	public OwnerDTO ownerInfo(int owner_idx);
	public int admin_ownerAppli_ok(int owner_idx);
	public int admin_ownerAppli_del(int owner_idx);
	public List<OwnerDTO> admin_allOwner(Map map);
	public int admin_ownerUpdate(OwnerDTO dto);
}
