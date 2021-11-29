package goo.admin.model;

import java.util.List;
import goo.member.model.*;

public interface AdminService {

	public int loginCheck(MemberDTO dto);
	public void loginRecode(int member_idx);
	public AdminDTO adminInfo(String goo_id);
	public List<AdminDTO> allAdminInfo();
	public MemberDTO adminMemberInfo(String goo_id);
	public List<MemberDTO> allAdminMemberInfo();
}
