package goo.admin.model;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import goo.member.model.MemberDTO;

public class AdminServiceImple implements AdminService {

	
	private AdminDAO adminDao;
	public static final int LOGIN_FAIL=1;
	public static final int LOGIN_OK=2;


	public AdminServiceImple(AdminDAO adminDao) {
		super();
		this.adminDao = adminDao;
	}


	public AdminDAO getAdminDao() {
		return adminDao;
	}


	public void setAdminDao(AdminDAO adminDao) {
		this.adminDao = adminDao;
	}

	
	public void loginRecode(int member_idx) {
		adminDao.loginRecode(member_idx);
	}
	
	public AdminDTO adminInfo(String goo_id) {
		AdminDTO dto=adminDao.adminInfo(goo_id);
		return dto;
	}
	
	public List<AdminDTO> allAdminInfo() {
		List<AdminDTO> list=adminDao.allAdminInfo();
		return list;
	}
	
	public MemberDTO adminMemberInfo(String goo_id) {
		MemberDTO dto=adminDao.adminMemberInfo(goo_id);
		return dto;
	}
	
	public List<MemberDTO> allAdminMemberInfo() {
		List<MemberDTO> list=adminDao.allAdminMemberInfo();
		return list;
	}
	public int adminInsert1(MemberDTO mdto) {
		System.out.println("adminInsert1 OK");
		int count = adminDao.adminInsert1(mdto);
		return count;
	}
	
	public int adminInsert2(AdminDTO adto) {
		int count = adminDao.adminInsert2(adto);
		return count;
	}
	
	public int admin_update1(MemberDTO mdto) {
		int count = adminDao.admin_update1(mdto);
		return count;
	}
	
	public int admin_update2(AdminDTO adto) {
		int count = adminDao.admin_update2(adto);
		return count;
	}
}
