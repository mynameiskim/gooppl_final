package goo.owner.model;

public interface OwnerDAO {
	public int addOwnerInfo(OwnerDTO dto);
	public OwnerDTO ownerAppli(int member_idx);
}
