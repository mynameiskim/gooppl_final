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



	public int loginCheck(MemberDTO dto1) {
		System.out.println("ServiceImple OK1");
		Map<String,String> map=new HashMap<String,String>();
		map.put("goo_id", dto1.getGoo_id());
		map.put("pwd",dto1.getPwd());
		int count = adminDao.loginCheck(map);
		System.out.println("ServiceImple OK2");
		int result=LOGIN_FAIL;
		if(count != 0) {
			result=LOGIN_OK;
		}
		return result;
		
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
	
}
