package goo.owner.model;

public interface OwnerDAO {
	public int addOwnerInfo(OwnerDTO dto);
	public OwnerDTO ckOwnerInfo(int member_idx);
}
