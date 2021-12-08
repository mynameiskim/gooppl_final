package goo.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.sql.Date;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.ModelAndViewMethodReturnValueHandler;

import goo.area.model.AreaDTO;
import goo.area.model.AreaService;
import goo.map_t.model.*;
import goo.mapinfo.model.MapInfoDTO;
import goo.mapinfo.model.MapInfoService;
import goo.owner.model.OwnerDTO;
import goo.owner.model.OwnerService;
import goo.placedetail.model.Gooppl_PlaceDetailDTO;
import goo.placedetail.model.Gooppl_PlaceDetailService;
import goo.review.model.ReviewDTO;
import goo.sigungu.model.SigunguDTO;
import goo.sigungu.model.SigunguService;

@Controller
public class MapController {

	List<MapInfoDTO> daynum = null;
	List<MapInfoDTO> routenum = null;
	
	@Autowired
	private SigunguService sigunguService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private MapInfoService mapinfoService;
	@Autowired
	private Gooppl_mapService gooppl_mapService;
	@Autowired
	private Gooppl_PlaceDetailService gooppl_placedetailService;
	@Autowired
	private OwnerService ownerService;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/sigungu.do")
	public String sigungu() {
		return "map/sigungu";
	}
	
	@RequestMapping("/kyumap.do")
	public String kyumap() {
		return "map/kyumap";
	}
	
	@RequestMapping("/createMap2.do")
	public ModelAndView newMap(
			@RequestParam(value = "areacode", defaultValue="1") int areacode,
			@RequestParam(value = "sigungucode", defaultValue="0") int sigungucode
			) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("member_idx", 1);
		List<AreaDTO> arealist = areaService.areaList();
		List<SigunguDTO> sigungulist = sigunguService.sigunguList();
		List<OwnerDTO> adlist = ownerService.allOwnerSelect();
		mav.addObject("arealist", arealist);
		mav.addObject("sigungulist", sigungulist);
		mav.addObject("adlist", adlist);
		mav.addObject("areacode", areacode);
		mav.addObject("sigungucode", sigungucode);
		mav.setViewName("map/newMapAdTest");
		return mav;
	}
	
	@RequestMapping("/addSigunguTable.do")
	public ModelAndView addSigunguTable(
			@RequestParam("areacode") int areacode,
			@RequestParam("sigungucode") int sigungucode,
			@RequestParam("sigungu_name") String sigungu_name
			) {

		ModelAndView mav = new ModelAndView();
		SigunguDTO dto = new SigunguDTO(0, areacode, sigungucode, sigungu_name);
		int result=sigunguService.addSigungu(dto);
		String msg=result>0?"입력성공":"이미 존재하는 데이터";
		mav.addObject("msg", msg);
		mav.setViewName("map/mapMsg");
		return mav;
	}
	
	@RequestMapping("/placeList.do")
	public ModelAndView mapBbs() {
		ModelAndView mav = new ModelAndView();
		List<AreaDTO> arealist = areaService.areaList();
		List<SigunguDTO> sigungulist = sigunguService.sigunguList();
		List<OwnerDTO> adlist = ownerService.allOwnerSelect();
		mav.addObject("arealist", arealist);
		mav.addObject("sigungulist", sigungulist);
		mav.addObject("adlist", adlist);
		mav.setViewName("map/placeList");
		return mav;
	}
	
	@RequestMapping("/goAdPlaceDetail.do")
	public ModelAndView AdPlaceDetail(
			@RequestParam("contentid") int contentid,
			@RequestParam("areacode") int areacode,
			@RequestParam("sigungucode") int sigungucode
			) {
		ModelAndView mav = new ModelAndView();
		String areaname=areaService.getAreaName(areacode);
		String sigunguname=sigunguService.getSigunguName(areacode, sigungucode);
		OwnerDTO dto = ownerService.getOwnerDetail(contentid);
		mav.addObject("areaname", areaname);
		mav.addObject("sigunguname", sigunguname);
		mav.addObject("placeinfo", dto);
		mav.setViewName("map/adPlaceDetail");
		return mav;
	}
	
	@RequestMapping("/goPlaceDetail.do")
	public ModelAndView placeDetail(
			@RequestParam("contentid") int contentid,
			@RequestParam("areacode") int areacode,
			@RequestParam("sigungucode") int sigungucode
			) {
		ModelAndView mav = new ModelAndView();
		String areaname=areaService.getAreaName(areacode);
		String sigunguname=sigunguService.getSigunguName(areacode, sigungucode);
		mav.addObject("areaname", areaname);
		mav.addObject("sigunguname", sigunguname);
		mav.addObject("contentid", contentid);
		mav.setViewName("map/placeDetail");
		return mav;
	}
	
	@RequestMapping("/addNewMap.do")
	public ModelAndView addNewMap(
			@RequestParam("map_title") String map_title,
			@RequestParam("member_idx") int member_idx,
			@RequestParam("people_num") int people_num,
			@RequestParam("trip_type") int trip_type,
			@RequestParam("starty") int starty,
			@RequestParam("startm") int startm,
			@RequestParam("startd") int startd,
			@RequestParam("endy") int endy,
			@RequestParam("endm") int endm,
			@RequestParam("endd") int endd,
			@RequestParam("share_ok") String share_ok,
			@RequestParam("del_ok") String del_ok
			) {
		String startdate_s=starty+"-"+startm+"-"+startd;
		String enddate_s=endy+"-"+endm+"-"+endd;
		Date startdate=Date.valueOf(startdate_s);
		Date enddate=Date.valueOf(enddate_s);
		
		ModelAndView mav = new ModelAndView();
		Gooppl_mapDTO dto = new Gooppl_mapDTO(0, map_title, member_idx, people_num, trip_type, startdate, enddate, enddate, share_ok, del_ok);
		int result=gooppl_mapService.getMapidx(dto);
		mav.addObject("msg", result);
		mav.setViewName("map/mapMsg");
		return mav;
	}
	
	@RequestMapping("/addMapInfo_newMap.do")
	public ModelAndView appMapInfo_newMap(
			@RequestParam("map_idx") int map_idx,
			@RequestParam("day_num") int day_num,
			@RequestParam("contentid") List<Integer> contentid
			) {
		ModelAndView mav = new ModelAndView();
		List<MapInfoDTO> list = new ArrayList<MapInfoDTO>();
		for(int i=0;i<contentid.size();i++) {
			MapInfoDTO dto=new MapInfoDTO(map_idx, day_num, i+1, contentid.get(i)); 
			list.add(dto);
		}
		int result=mapinfoService.addMapInfo(list);
		mav.addObject("msg", result);
		mav.setViewName("map/mapMsg");
		return mav;
	}
	
	@RequestMapping("/savePlaceDetail.do")
	public ModelAndView savePlaceDetail(
			@RequestParam("contentid") int contentid,
			@RequestParam("title") String title,
			@RequestParam("addr") String addr,
			@RequestParam("areacode") int areacode,
			@RequestParam("sigungucode") int sigungucode,
			@RequestParam("mapx") double mapx,
			@RequestParam("mapy") double mapy,
			@RequestParam("overview") String overview,
			@RequestParam("readnum") int readnum,
			@RequestParam("homepage") String homepage,
			@RequestParam("firstimage") String firstimage
			) {
		ModelAndView mav = new ModelAndView();
		Gooppl_PlaceDetailDTO dto=new Gooppl_PlaceDetailDTO(contentid, title, addr, areacode, sigungucode, mapx, mapy, overview, readnum, homepage, firstimage);
		int result=gooppl_placedetailService.addPlaceDetail(dto);
		mav.addObject("msg", result);
		mav.setViewName("map/mapMsg");
		return mav;
	}
	
	@RequestMapping("/existMap.do")
	public ModelAndView moveExistMap(
			@RequestParam(value = "areacode", defaultValue="1") int areacode,
			@RequestParam(value = "sigungucode", defaultValue="0") int sigungucode,
			@RequestParam("map_idx") int map_idx,
			@RequestParam("day_num") int day_num,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String session_Nickname=(String)session.getAttribute("sessionNickname");
		System.out.println(session_Nickname);
		if(session_Nickname==null||session_Nickname.equals("")) {
			mav.addObject("open_login", 1);
			mav.setViewName("redirect:index.do");
		}else {	
			int enroll_idx=(Integer)session.getAttribute("sessionMember_idx");
			int map_member_idx=gooppl_mapService.getMemberIdx(map_idx);
			if(enroll_idx!=map_member_idx) {
				mav.addObject("msg", "접근 권한이 없습니다.");
				mav.addObject("goPage", "index.do");
				mav.setViewName("map/mapMove");
			}else {
				Map map=new HashMap();
				map.put("map_idx", map_idx);
				map.put("day_num", day_num);
				List<MapInfoDTO> mapinfolist = mapinfoService.mapInfoList(map);
				mav.addObject("mapinfolist", mapinfolist);
				Gooppl_mapDTO mapDto=gooppl_mapService.getMapt(map_idx);
				List<AreaDTO> arealist = areaService.areaList();
				List<SigunguDTO> sigungulist = sigunguService.sigunguList();
				List<OwnerDTO> adlist = ownerService.allOwnerSelect();
				mav.addObject("open_login", 0);
				mav.addObject("member_idx", map_member_idx);
				mav.addObject("mapdto", mapDto);
				mav.addObject("arealist", arealist);
				mav.addObject("sigungulist", sigungulist);
				mav.addObject("adlist", adlist);
				mav.addObject("sigungucode", 0);
				mav.addObject("map_idx", map_idx);
				mav.addObject("day_num", day_num);
				List<Integer> list=mapinfoService.getThisMapInfo(map_idx, day_num);
				if(list.size()!=0) {
					List<Gooppl_PlaceDetailDTO> tripList=gooppl_placedetailService.getThisDateDetail(list);
					mav.addObject("tripList", tripList);
				}
				if(list.size()!=0) {
					int lastAreacode=gooppl_placedetailService.getLastAreacode(map_idx, day_num);
					mav.addObject("areacode", lastAreacode);
				}else {
					mav.addObject("areacode", 1);
				}
				mav.setViewName("map/existMap");
			}
		}
		return mav;
	}
	
	@RequestMapping("/existMap2.do")
	public ModelAndView moveExistMap2(
			@RequestParam("map_idx") int map_idx,
			@RequestParam("day_num") int day_num,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String session_Nickname=(String)session.getAttribute("sessionNickname");
		System.out.println(session_Nickname);
		if(session_Nickname==null||session_Nickname.equals("")) {
			mav.addObject("open_login", 1);
			mav.setViewName("redirect:index.do");
		}else {	
			int enroll_idx=(Integer)session.getAttribute("sessionMember_idx");
			System.out.println(enroll_idx);
			int map_member_idx=gooppl_mapService.getMemberIdx(map_idx);
			if(enroll_idx!=map_member_idx) {
				mav.addObject("msg", "접근 권한이 없습니다.");
				mav.addObject("goPage", "index.do");
				mav.setViewName("map/mapMove");
			}else {
				Gooppl_mapDTO mapDto=gooppl_mapService.getMapt(map_idx);
				List<AreaDTO> arealist = areaService.areaList();
				List<SigunguDTO> sigungulist = sigunguService.sigunguList();
				List<OwnerDTO> adlist = ownerService.allOwnerSelect();
				mav.addObject("open_login", 0);
				mav.addObject("member_idx", map_member_idx);
				mav.addObject("mapdto", mapDto);
				mav.addObject("arealist", arealist);
				mav.addObject("sigungulist", sigungulist);
				mav.addObject("adlist", adlist);
				mav.addObject("sigungucode", 0);
				mav.addObject("map_idx", map_idx);
				mav.addObject("day_num", day_num);
				List<Integer> list=mapinfoService.getThisMapInfo(map_idx, day_num);
				if(list.size()!=0) {
					List<Gooppl_PlaceDetailDTO> tripList=gooppl_placedetailService.getThisDateDetail(list);
					mav.addObject("tripList", tripList);
				}
				if(list.size()!=0) {
					int lastAreacode=gooppl_placedetailService.getLastAreacode(map_idx, day_num);
					mav.addObject("areacode", lastAreacode);
				}else {
					mav.addObject("areacode", 1);
				}
				mav.setViewName("map/existMap2");
			}
		}
		return mav;
	}
	
	@RequestMapping("/changeMap.do")
	public ModelAndView changeMap(
			@RequestParam("map_idx") int map_idx,
			@RequestParam("day_num") int day_num,
			@RequestParam("map_title") String map_title,
			@RequestParam("member_idx") int member_idx,
			@RequestParam("people_num") int people_num,
			@RequestParam("trip_type") int trip_type,
			@RequestParam("starty") int starty,
			@RequestParam("startm") int startm,
			@RequestParam("startd") int startd,
			@RequestParam("endy") int endy,
			@RequestParam("endm") int endm,
			@RequestParam("endd") int endd,
			@RequestParam("share_ok") String share_ok,
			@RequestParam("del_ok") String del_ok
			) {
		String startdate_s=starty+"-"+startm+"-"+startd;
		String enddate_s=endy+"-"+endm+"-"+endd;
		Date startdate=Date.valueOf(startdate_s);
		Date enddate=Date.valueOf(enddate_s);
		
		ModelAndView mav = new ModelAndView();
		Gooppl_mapDTO dto = new Gooppl_mapDTO(map_idx, map_title, member_idx, people_num, trip_type, startdate, enddate, enddate, share_ok, del_ok);
		int result=gooppl_mapService.updateMap(dto);
		int result2=mapinfoService.deleteMapInfo(map_idx, day_num);
		System.out.println(result);
		System.out.println(result2);
		mav.addObject("msg", map_idx);
		mav.setViewName("map/mapMsg");
		return mav;
	}
	/**
	@RequestMapping("/loadPlaceDetail.do")
	@ResponseBody
	public ModelAndView loadPlaceDetail(@RequestParam("contentid")int contentid) {
		ModelAndView mav = new ModelAndView();
		List<Gooppl_PlaceDetailDTO> placedetail = gooppl_placedetailService.placeDetailList(contentid);
		mav.addObject("placedetail", placedetail);
		return mav;
	}
	*/
	
	@RequestMapping(value = "/loadPlaceDetail.do", method = RequestMethod.POST)
	@ResponseBody
	public HashMap <String, Object> loadPlaceDetail2(HttpServletRequest request) {
		HashMap<String, Object> result = new HashMap <String,Object>();
		
		String contentidid_s = request.getParameter("contentid");
		
		int contentid=Integer.parseInt(contentidid_s);
		
		List<Gooppl_PlaceDetailDTO> placedetail = sqlSession.selectList("detailList", contentid);
		
		if ( placedetail.isEmpty() ) {
			String Msg = "이력이 없습니다.";
			String Code = "1";
			
			result.put("Msg", Msg);
			result.put("Code", Code);
			
			return result;
		} else {
			String Msg = "성공";
			String Code = "0";
			
			result.put("Msg", Msg);
			result.put("Code", Code);
			result.put("data", placedetail);
			
			return result;
		}
	}
	/**#################        공유게시판 관련 ㅁㅅㄷ          #########################*/
	
	/** 게시판 목록 */
	@RequestMapping("/share.do")
	public ModelAndView shareList(
			@RequestParam(value="cp",defaultValue = "1" )int cp) {
		int listSize=16;
		int pageSize=10;
		int totalCnt=gooppl_mapService.getShareCnt();
		List<Gooppl_mapDTO> list = gooppl_mapService.mapList(cp,listSize);
		String sharePageStr=goo.page.PageModule.makePage("share.do", totalCnt, listSize, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("sharePageStr",sharePageStr);
		mav.setViewName("share/share_list");
		return mav;
	}
	
	public ModelAndView shareContent(
			MapInfoDTO midto,
			@RequestParam("map_idx")int map_idx
			) {
		ModelAndView mav=new ModelAndView();
		return mav;
	}
	
	/**#################        공유게시판 관련 ㅁㅅㄷ          #########################*/
	
	
}
