package goo.admin.model;

import java.util.List;
import java.util.Map;

import goo.member.model.*;

public interface AdminService {

	public void loginRecode(int member_idx);
	public AdminDTO adminInfo(String goo_id);
	public List<AdminDTO> allAdminInfo(int cp,int ls);
	public MemberDTO adminMemberInfo(String goo_id);
	public List<MemberDTO> allAdminMemberInfo(int cp,int ls);
	public int adminInsert1(MemberDTO mdto);
	public int adminInsert2(AdminDTO adto);
	public int adminUpdate1(MemberDTO mdto);
	public int adminUpdate2(AdminDTO adto);
	public int totalAdmin();
	public int adminDelete1(int member_idx);
	public int adminDelete2(int member_idx);
	public int memberDelete(int member_idx);
	public int memberUpdate(MemberDTO mdto);
	public Map<String, Object> monthStatistics();
	public Map<String, Object> statistics(Map<String, Object> map);
}
