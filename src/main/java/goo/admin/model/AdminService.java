package goo.admin.model;

import java.util.List;
import goo.member.model.*;

public interface AdminService {

	public void loginRecode(int member_idx);
	public AdminDTO adminInfo(String goo_id);
	public List<AdminDTO> allAdminInfo();
	public MemberDTO adminMemberInfo(String goo_id);
	public List<MemberDTO> allAdminMemberInfo();
	public int adminInsert1(MemberDTO mdto);
	public int adminInsert2(AdminDTO adto);
	public int admin_update1(MemberDTO mdto);
	public int admin_update2(AdminDTO adto);
}
