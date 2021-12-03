package goo.admin.model;

import java.util.*;
import java.util.Map;

import goo.member.model.MemberDTO;

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
}
