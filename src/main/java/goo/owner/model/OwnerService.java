package goo.owner.model;

public interface OwnerService {
	public int addOwnerInfo(OwnerDTO dto);
	public OwnerDTO ckOwnerInfo(int member_idx);
}
