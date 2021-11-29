package goo.admin.model;

import java.util.*;
import java.util.Map;

import goo.member.model.MemberDTO;

public interface AdminDAO {

	public int loginCheck(Map map);
	public void loginRecode(int member_idx);
	public AdminDTO adminInfo(String goo_id);
	public List<AdminDTO> allAdminInfo();
	public MemberDTO adminMemberInfo(String goo_id);
	public List<MemberDTO> allAdminMemberInfo();
}
