package goo.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import java.sql.*;
import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import goo.area.model.AreaDTO;
import goo.area.model.AreaService;
import goo.map_t.model.*;
import goo.mapinfo.model.MapInfoDTO;
import goo.mapinfo.model.MapInfoService;
import goo.owner.model.OwnerDTO;
import goo.owner.model.OwnerService;
import goo.placedetail.model.Gooppl_PlaceDetailDTO;
import goo.placedetail.model.Gooppl_PlaceDetailService;
import goo.sigungu.model.SigunguDTO;
import goo.sigungu.model.SigunguService;

@Controller
public class MapController {

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
				mav.addObject("open_login", 0);
				mav.addObject("member_idx", map_member_idx);
				mav.addObject("map_idx", map_idx);
				mav.addObject("day_num", day_num);
				List<Integer> list=mapinfoService.getThisMapInfo(map_idx, day_num);
				if(list.size()!=0) {
					List<Gooppl_PlaceDetailDTO> tripdto=gooppl_placedetailService.getThisDateDetail(list);
					mav.addObject("tripdto", tripdto);
				}
				mav.setViewName("map/existMap");
			}
		}
		return mav;
	}
}
