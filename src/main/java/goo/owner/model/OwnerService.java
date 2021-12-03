package goo.owner.model;

import java.util.List;
import java.util.Map;

public interface OwnerService {
	public int addOwnerInfo(OwnerDTO dto);
	public OwnerDTO ckOwnerInfo(int member_idx);
	public int totalOwnerAppli();
	public List<OwnerDTO> allOwnerAppliInfo(int cp, int ls);
	public OwnerDTO ownerInfo(int member_idx);
}
