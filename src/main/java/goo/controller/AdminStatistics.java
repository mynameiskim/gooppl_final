package goo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import goo.admin.model.AdminDAO;
import goo.admin.model.AdminService;

@Controller
public class AdminStatistics {
	
	@Autowired
	private AdminDAO adminDao;
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/admin_statistics.do")
	public String statistics() {
		return "/admin/statistics/admin_statistics";
	}
	
	@RequestMapping("/member_statistics.do")
	public ModelAndView memberStatistics(@RequestParam(value = "start_date" , defaultValue = "")String start_date
			, @RequestParam(value = "end_date" , defaultValue = "")String end_date) {
		System.out.println("memberStatistics 진입");
		if(!start_date.equals("")&&end_date.equals("")) {
			System.out.println("start_date 값만 진입");
			end_date = start_date;
		}else if(!end_date.equals("")&&start_date.equals("")) {
			System.out.println("end_date 값만 진입");
			start_date = end_date;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		
		map = adminService.statistics(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("start_date", start_date);
		mav.addObject("end_date", end_date);
		mav.addObject("totalMemberNum", map.get("totalMemberNum"));
		mav.addObject("currentMemberNum", map.get("currentMemberNum"));
		mav.addObject("adminNum", map.get("adminNum"));
		mav.addObject("ownerNum", map.get("ownerNum"));
		mav.addObject("memberNum", map.get("memberNum"));
		mav.addObject("memberOutNum", map.get("memberOutNum"));
		mav.setViewName("/admin/statistics/member_statistics");
		return mav;
	}
	
	@RequestMapping("/month_statistics.do")
	public ModelAndView monthStatistics(){
		System.out.println("monthStatistics 진입");
		Map<String, Object> map = new HashMap<String, Object>();
		map = adminService.monthStatistics();
		ModelAndView mav = new ModelAndView();
		int joinNum[] = new int[12];
		for(int i=0;i<=11;i++) {
			joinNum[i] = (Integer) map.get("joinNum"+i);
			mav.addObject("joinNum", joinNum);
		}
		mav.addObject("year", map.get("year"));
		mav.setViewName("/admin/statistics/month_join_num");
		return mav;
	}
}
