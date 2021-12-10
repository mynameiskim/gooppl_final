package goo.admin.model;

import java.util.*;
import java.util.Map;

import goo.member.model.MemberDTO;
import goo.review.model.ReviewDTO;

public interface AdminDAO {

	public void loginRecode(int member_idx);
	public AdminDTO adminInfo(String goo_id);
	public List<AdminDTO> allAdminInfo(Map map);
	public MemberDTO adminMemberInfo(String goo_id);
	public List<MemberDTO> allAdminMemberInfo(Map map);
	public int adminInsert1(MemberDTO mdto);
	public int adminInsert2(AdminDTO adto);
	public int adminUpdate1(MemberDTO mdto);
	public int adminUpdate2(AdminDTO adto);
	public int totalAdmin();
	public int adminDelete1(int member_idx);
	public int adminDelete2(int member_idx);
	public int memberDelete(int member_idx);
	public int memberUpdate(MemberDTO mdto);
	public int totalMemberNum();
	public int currentMemberNum();
	public int adminNum();
	public int ownerNum();
	public int memberNum();
	public int memberOutNum();
	public int monthJoinNum(Map<String, Object> map);
	public int searchTotalMemberNum(Map<String, Object> map);
	public int searchCurrentMemberNum(Map<String, Object> map);
	public int searchAdminNum(Map<String, Object> map);
	public int searchOwnerNum(Map<String, Object> map);
	public int searchMemberNum(Map<String, Object> map);
	public int searchMemberOutNum(Map<String, Object> map);
	public List<ReviewDTO> adminReview(Map map);
	public int adminReviewTotal();
}
