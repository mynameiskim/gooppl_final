package goo.admin.model;

import java.util.List;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import goo.member.model.MemberDTO;
import goo.review.model.ReviewDTO;

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
		Map<String,Object> map=new HashMap<String,Object>();
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
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", start);
		map.put("end",end);
		List<MemberDTO> list=adminDao.allAdminMemberInfo(map);
		return list;
	}
	
	public List<ReviewDTO> adminReview(int cp,int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", start);
		map.put("end",end);
		List<ReviewDTO> list=adminDao.adminReview(map);
		return list;
	}
	
	public int adminReviewTotal() {
		int totalCnt = adminDao.adminReviewTotal();
		return totalCnt;
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
	
	public Map<String, Object> monthStatistics() {
		Map<String, Object> map = new HashMap<String, Object>();
		Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        for(int i=1;i<=12;i++) {
        	LocalDate start_date = LocalDate.of(year, i, 1);
        	LocalDate end_date;
            map.put("start_date", start_date);
            
            switch (i) {
			case 1:
				 end_date = LocalDate.of(year, i, 31);
				 map.put("end_date", end_date);
				int jan = adminDao.monthJoinNum(map); map.put("joinNum0", jan);break;
			case 2:
				end_date = LocalDate.of(year, i, 28);
				map.put("end_date", end_date);
				int feb = adminDao.monthJoinNum(map); map.put("joinNum1", feb);break;
			case 3:
				end_date = LocalDate.of(year, i, 31);
				map.put("end_date", end_date);
				int mar = adminDao.monthJoinNum(map); map.put("joinNum2", mar);break;
			case 4:
				end_date = LocalDate.of(year, i, 30);
				map.put("end_date", end_date);
				int apr = adminDao.monthJoinNum(map); map.put("joinNum3", apr);break;
			case 5:
				end_date = LocalDate.of(year, i, 31);
				map.put("end_date", end_date);
				int may = adminDao.monthJoinNum(map); map.put("joinNum4", may);break;
			case 6:
				end_date = LocalDate.of(year, i, 30);
				map.put("end_date", end_date);
				int jun = adminDao.monthJoinNum(map); map.put("joinNum5", jun);break;
			case 7:
				end_date = LocalDate.of(year, i, 31);
				map.put("end_date", end_date);
				int jul = adminDao.monthJoinNum(map); map.put("joinNum6", jul);break;
			case 8:
				end_date = LocalDate.of(year, i, 31);
				map.put("end_date", end_date);
				int aug = adminDao.monthJoinNum(map); map.put("joinNum7", aug);break;
			case 9:
				end_date = LocalDate.of(year, i, 30);
				map.put("end_date", end_date);
				int sep = adminDao.monthJoinNum(map); map.put("joinNum8", sep);break;
			case 10:
				end_date = LocalDate.of(year, i, 31);
				map.put("end_date", end_date);
				int oct = adminDao.monthJoinNum(map); map.put("joinNum9", oct);break;
			case 11:
				end_date = LocalDate.of(year, i, 30);
				map.put("end_date", end_date);
				int nov = adminDao.monthJoinNum(map); map.put("joinNum10", nov);break;
			case 12:
				end_date = LocalDate.of(year, i, 31);
				map.put("end_date", end_date);
				int dec = adminDao.monthJoinNum(map); map.put("joinNum11", dec);break;
			}
        }
		map.put("year", year);
        
		System.out.println("중간확인");
		return map;
	}
	
	public Map<String, Object> statistics(Map<String, Object> map) {
		if(map.get("start_date").equals("")&&map.get("end_date").equals("")) {
			System.out.println("날짜값 없");
			int totalMemberNum = adminDao.totalMemberNum();
			int currentMemberNum = adminDao.currentMemberNum();
			int adminNum = adminDao.adminNum();
			int ownerNum = adminDao.ownerNum();
			int memberNum = adminDao.memberNum();
			int memberOutNum = adminDao.memberOutNum();
			map.put("totalMemberNum", totalMemberNum);
			map.put("currentMemberNum", currentMemberNum);
			map.put("adminNum", adminNum);
			map.put("ownerNum", ownerNum);
			map.put("memberNum", memberNum);
			map.put("memberOutNum", memberOutNum);
		}else{
			System.out.println("서비스 날짜값 진입");
			System.out.println(map.get("start_date"));
			System.out.println(map.get("end_date"));
			int searchTotalMemberNum = adminDao.searchTotalMemberNum(map);
			int searchCurrentMemberNum = adminDao.searchCurrentMemberNum(map);
			int searchAdminNum = adminDao.searchAdminNum(map);
			int searchOwnerNum = adminDao.searchOwnerNum(map);
			int searchMemberNum = adminDao.searchMemberNum(map);
			int searchMemberOutNum = adminDao.searchMemberOutNum(map);
			System.out.println(adminDao.searchTotalMemberNum(map));
			System.out.println(adminDao.searchCurrentMemberNum(map));
			System.out.println(adminDao.searchAdminNum(map));
			System.out.println(adminDao.searchOwnerNum(map));
			System.out.println(adminDao.searchMemberNum(map));
			System.out.println(adminDao.searchMemberOutNum(map));
			map.put("totalMemberNum", searchTotalMemberNum);
			map.put("currentMemberNum", searchCurrentMemberNum);
			map.put("adminNum", searchAdminNum);
			map.put("ownerNum", searchOwnerNum);
			map.put("memberNum", searchMemberNum);
			map.put("memberOutNum", searchMemberOutNum);
		}
		return map;
	}
}
