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
	
	public List<AdminDTO> allAdminInfo(int cp,int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end",end);
		List<AdminDTO> list=adminDao.allAdminInfo(map);
		return list;
	}
	
	public MemberDTO adminMemberInfo(String goo_id) {
		MemberDTO dto=adminDao.adminMemberInfo(goo_id);
		return dto;
	}
	
	public List<MemberDTO> allAdminMemberInfo(int cp,int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end",end);
		List<MemberDTO> list=adminDao.allAdminMemberInfo(map);
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
	
	public int adminUpdate1(MemberDTO mdto) {
		int count = adminDao.adminUpdate1(mdto);
		return count;
	}
	
	public int adminUpdate2(AdminDTO adto) {
		int count = adminDao.adminUpdate2(adto);
		return count;
	}
	
	public int totalAdmin() {
		int count = adminDao.totalAdmin();
		return count;
	}
	
	public int adminDelete1(int member_idx) {
		int count = adminDao.adminDelete1(member_idx);
		return count;
	}
	
	public int adminDelete2(int member_idx) {
		int count = adminDao.adminDelete2(member_idx);
		return count;
	}
	
	public int memberDelete(int member_idx) {
		int count = adminDao.memberDelete(member_idx);
		return count;
	}
	
	public int memberUpdate(MemberDTO mdto) {
		int count = adminDao.memberUpdate(mdto);
		return count;
	}
}
