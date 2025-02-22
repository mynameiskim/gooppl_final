﻿package goo.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.*;
import java.sql.Date;
import java.text.SimpleDateFormat;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.apache.poi.common.usermodel.HyperlinkType;
import org.apache.poi.hssf.usermodel.HSSFHyperlink;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Hyperlink;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.ModelAndViewMethodReturnValueHandler;

import goo.ad.model.AdService;
import goo.area.model.AreaDTO;
import goo.area.model.AreaService;
import goo.map_t.model.*;
import goo.mapinfo.model.MapInfoDTO;
import goo.mapinfo.model.MapInfoService;
import goo.member.model.MemberDTO;
import goo.member.model.MemberService;
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
	private AdService adService;
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/sigungu.do")
	public String sigungu() {
		return "map/sigungu";
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
		List<Integer> ownerIdxList=adService.getOwnerIdx();
		List<OwnerDTO> adlist=new ArrayList<OwnerDTO>();
		if(ownerIdxList.size()>0) {
			adlist = ownerService.allOwnerSelect(ownerIdxList);
		}
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
	
	@RequestMapping("/goMyPlaceDetail.do")
	public ModelAndView MyPlaceDetail(
			@RequestParam("contentid") int contentid,
			@RequestParam("areacode") int areacode,
			@RequestParam("sigungucode") int sigungucode
			) {
		ModelAndView mav = new ModelAndView();
		String areaname=areaService.getAreaName(areacode);
		String sigunguname=sigunguService.getSigunguName(areacode, sigungucode);
		Gooppl_PlaceDetailDTO dto = gooppl_placedetailService.getThisDateDetail2(contentid);
		mav.addObject("areaname", areaname);
		mav.addObject("sigunguname", sigunguname);
		mav.addObject("placeinfo", dto);
		mav.setViewName("map/myPlaceDetail");
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
		int result=gooppl_mapService.getMapIdx(dto);
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
			Gooppl_mapDTO dto = gooppl_mapService.getMapt(map_idx);
			if(dto==null) {
				mav.addObject("msg", "존재하지 않는 게시물입니다.");
				mav.addObject("goPage", "index.do");
				mav.setViewName("map/mapMove");
			}else if(enroll_idx!=dto.getMember_idx()) {
				mav.addObject("msg", "접근 권한이 없습니다.");
				mav.addObject("goPage", "index.do");
				mav.setViewName("map/mapMove");
			}else {
				Map map=new HashMap();
				map.put("map_idx", map_idx);
				int day_minus=gooppl_mapService.dayMinus(dto)+1;
				day_num=day_num>day_minus?1:day_num;
				map.put("day_num", day_num);
				List<MapInfoDTO> mapinfolist = mapinfoService.mapInfoList(map);
				mav.addObject("mapinfolist", mapinfolist);
				Gooppl_mapDTO mapDto=gooppl_mapService.getMapt(map_idx);
				List<AreaDTO> arealist = areaService.areaList();
				List<SigunguDTO> sigungulist = sigunguService.sigunguList();
				List<Integer> ownerIdxList=adService.getOwnerIdx();
				List<OwnerDTO> adlist=new ArrayList<OwnerDTO>();
				if(ownerIdxList.size()>0) {
					adlist = ownerService.allOwnerSelect(ownerIdxList);
				}
				mav.addObject("open_login", 0);
				mav.addObject("member_idx", dto.getMember_idx());
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
					int lastAreacode=gooppl_placedetailService.getLastAreacode(map_idx, day_num);
					mav.addObject("areacode", lastAreacode);
					mav.addObject("tripNum", tripList.size());
				}else {
					if(day_num==1) {
						mav.addObject("areacode", 1);
						mav.addObject("tripNum", 0);
					}else {
						List<Integer> list2=mapinfoService.getThisMapInfo(map_idx, day_num-1);
						if(list2.size()!=0) {
							int lastAreacode=gooppl_placedetailService.getLastAreacode(map_idx, day_num-1);
							mav.addObject("areacode", lastAreacode);
							mav.addObject("tripNum", 0);
						}else {
							mav.addObject("areacode", 1);
							mav.addObject("tripNum", 0);
						}
					}
				}
				mav.setViewName("map/existMap");
			}
		}
		return mav;
	}
	
	@RequestMapping("/delDateData.do")
	public ModelAndView delDateData(
			@RequestParam("map_idx") int map_idx,
			@RequestParam("starty") int starty,
			@RequestParam("startm") int startm,
			@RequestParam("startd") int startd,
			@RequestParam("endy") int endy,
			@RequestParam("endm") int endm,
			@RequestParam("endd") int endd,
			@RequestParam("day") int day) {
		String startdate_s=starty+"-"+startm+"-"+startd;
		String enddate_s=endy+"-"+endm+"-"+endd;
		Date startdate=Date.valueOf(startdate_s);
		Date enddate=Date.valueOf(enddate_s);
		
		ModelAndView mav = new ModelAndView();
		int result=gooppl_mapService.updateMapDate(map_idx, startdate, enddate);
		if(result>0) {
			int result2=mapinfoService.deleteMapDay(map_idx, day);
		}
		String msg=result>0?"성공":"실패";
		mav.addObject("msg", msg);
		mav.setViewName("map/mapMsg");
		return mav;
	}
	
	@RequestMapping("/delThisDayAllInfo.do")
	public ModelAndView delThisDayAllInfo(
			@RequestParam("map_idx") int map_idx,
			@RequestParam("day_num") int day_num
			) {
		ModelAndView mav=new ModelAndView();
		int result=mapinfoService.delThisDayAllInfo(map_idx, day_num);
		mav.addObject("msg", result);
		mav.setViewName("map/mapMsg");
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
	
	/**#################        SHARE          #########################*/
	
	@ResponseBody
	@RequestMapping("/planDelete.do")
	public int planDelete(int map_idx) {
		int result = gooppl_mapService.planDelete(map_idx);
		
		return result;
	}
	
	
	/** 게시판 목록 */
	@RequestMapping("/share.do")
	public ModelAndView shareList(
			@RequestParam(value="cp",defaultValue = "1" )int cp) {
		
		ModelAndView mav = new ModelAndView();
		int listSize=8;
		int pageSize=5;
		int totalCnt=gooppl_mapService.getShareCnt();
		mav.addObject("totalCnt",totalCnt);
		// 쿼리에서 불러온 List
		List<Gooppl_mapDTO> list = gooppl_mapService.mapList(cp,listSize);
		List<String> firstImg = new ArrayList<String>();
		List<MemberDTO> mlist = new ArrayList<MemberDTO>(); 
		
		int map_idx;
		int member_idx;
		for(int i=0; i<list.size(); i++) {
			map_idx = list.get(i).getMap_idx();
			member_idx = list.get(i).getMember_idx();
			String first =  gooppl_placedetailService.getFirstImg(map_idx);
			MemberDTO dto = memberService.memberInfo(member_idx);
			firstImg.add(first);
			mlist.add(dto);
		}
		mav.addObject("firstImg",firstImg);
		mav.addObject("member",mlist);
				
		String sharePageStr=goo.page.PageModule2.makePage("share.do", totalCnt, listSize, pageSize, cp);
		
		mav.addObject("list", list);
		mav.addObject("sharePageStr",sharePageStr);
		mav.setViewName("share/share_list");
		return mav;
	}
	
	
	
	@RequestMapping("/shareContent.do")
	   public ModelAndView shareContent(
	         @RequestParam("map_idx")int map_idx,
	         @RequestParam("member_idx")int member_idx) {
	      //int map_idx로 day_num ,route_num의 쵀댓 값을 구함
	      int daynum = mapinfoService.getMaxDaynum(map_idx);
	      int routenum[]=new int[daynum]; 
	      
	      List<MapInfoDTO> drlist = mapinfoService.shareContent(map_idx); //map 에서 가져옴
	      for(int i=1;i<=daynum;i++) {
	         routenum[i-1]=mapinfoService.getMaxRoutenum(map_idx, i);
	      }
	      List<Integer> contentids=new ArrayList<Integer>();;
	      for(int i=0;i<drlist.size();i++) {
	            contentids.add(drlist.get(i).getContentid());
	      }
	      List<Gooppl_PlaceDetailDTO> pdlist=gooppl_placedetailService.getThisDateDetail(contentids);
	      List<AreaDTO> arealist = areaService.getAreaInfo(contentids);
	      //List<AreaDTO> arealist = areaService.areaList();
	      List<SigunguDTO> sigungulist = sigunguService.sigunguList();
	      
	      Gooppl_mapDTO gmdto = gooppl_mapService.getMapt(map_idx);
	      MemberDTO mdto = memberService.memberInfo(member_idx); 

	      ModelAndView mav=new ModelAndView();
	      mav.addObject("drlist",drlist);
	      mav.addObject("pdlist",pdlist);
	      mav.addObject("arealist", arealist);
	      mav.addObject("sigungulist", sigungulist);
	      mav.addObject("gmdto", gmdto);
	      mav.addObject("mdto", mdto);
	      
	      mav.setViewName("share/share_content");
	      return mav;
	   }

		@RequestMapping("/getFirstImg.do")
		@ResponseBody
		public String getFirstImg(
				@RequestParam("map_idx")int map_idx) {
			String firstImg = gooppl_placedetailService.getFirstImg(map_idx);
			System.out.println("확인="+firstImg);

			return firstImg;
		}
	
	/**#################        공유게시판 관련 ㅁㅅㄷ          #########################*/
	@ResponseBody
	@RequestMapping("/planShareCancel.do")
	public int planShereCancel(int map_idx) {
		int result = gooppl_mapService.planShareCancel(map_idx);
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/planShare.do")
	public int planShere(int map_idx) {
		int result = gooppl_mapService.planShare(map_idx);
		return result;
	}
	
	
	@RequestMapping("/downloadMapInfo.do")
	   public void sample(HttpServletRequest request, HttpServletResponse response, 
	         @RequestParam(value="map_idx",defaultValue = "1" )int map_idx) 
	         throws Exception {
	       try {
	           String filename = "";
	           request.setCharacterEncoding("EUC-KR");
	           String formPath = request.getSession().getServletContext().getRealPath("resource/excel/basicExcelForm.xlsx"); //양식 패스 가져오기
	           System.out.println(formPath);
	           InputStream fis = new FileInputStream(formPath);
	           XSSFWorkbook form_wb = new XSSFWorkbook(fis);
	           XSSFSheet form_sheet = form_wb.getSheetAt(0);
	           XSSFSheet form_sheet2 = form_wb.getSheetAt(1);
	           Gooppl_mapDTO dto=gooppl_mapService.getMapt(map_idx);

	           //양식에 넣어줄 데이터
	           String mapTitle = dto.getMap_title();
	           String mapdays = dto.getStartdate().toString()+" ~ "+dto.getEnddate().toString();
	           String mapPeoplenum = dto.getPeople_num()+"명";
	           int trip_type=dto.getTrip_type();
	           String mapTrip_type;
	           switch(trip_type) {
	           case 1:mapTrip_type="홀로여행";
	           case 2:mapTrip_type="커플여행";
	           case 3:mapTrip_type="우정여행";
	           case 4:mapTrip_type="가족여행";
	           default:mapTrip_type="홀로여행";
	           }
	           System.out.println(mapTitle+", "+mapdays+", "+mapPeoplenum+", "+mapTrip_type);
	           List<MapInfoDTO> list=mapinfoService.shareContent(map_idx);
	           int maxDay=list.get(list.size()-1).getDay_num();
	           
	           CellStyle titleStyle=form_wb.createCellStyle();
	           titleStyle.setAlignment(HorizontalAlignment.CENTER);
	           titleStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	           titleStyle.setFillForegroundColor(HSSFColorPredefined.TEAL.getIndex());
	           titleStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	           
	           XSSFFont titleFont=form_wb.createFont();
	           titleFont.setFontHeightInPoints((short)14);
	           titleFont.setFontName("맑은 고딕");
	           titleFont.setBold(true);
	           titleStyle.setFont(titleFont);

	           //엑셀 폼에 넣기 (로우와 셀 주의!!!)
	           Cell titleCell=form_sheet.getRow(0).createCell(1);
	           titleCell.setCellStyle(titleStyle);
	           titleCell.setCellValue(mapTitle);
	           form_sheet.getRow(0).createCell(23).setCellValue(mapdays);
	           form_sheet.getRow(1).createCell(23).setCellValue(mapTrip_type);
	           form_sheet.getRow(2).createCell(23).setCellValue(mapPeoplenum);
	           //form_sheet.getRow(4).createCell(3).setCellValue("셀병합실험");
	           //form_sheet.addMergedRegion(new CellRangeAddress(4, 4, 3, 4));
	           Cell goPCell=form_sheet.getRow(3).getCell(1);
	           CreationHelper createHelper2 = form_wb.getCreationHelper();
	           goPCell.setCellValue("구플에서 일정보기");
	           Hyperlink link2 = createHelper2.createHyperlink(Hyperlink.LINK_FILE);
	           String urlgo="http://localhost:9090/gooppl/shareContent.do?map_idx="+map_idx+"&member_idx="+dto.getMember_idx();
	           link2.setAddress(urlgo);
	           goPCell.setHyperlink((org.apache.poi.ss.usermodel.Hyperlink) link2);
	           System.out.println("실험");
	           form_sheet.createRow(4);
	           form_sheet.createRow(5);
	           form_sheet.createRow(6);
	           form_sheet.createRow(7);
	           System.out.println("실험");
	           CellStyle contentStyle=form_wb.createCellStyle();
	           contentStyle.setAlignment(HorizontalAlignment.LEFT);
	           contentStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	           
	           XSSFFont contentFont=form_wb.createFont();
	           contentFont.setFontHeightInPoints((short)9);
	           contentFont.setFontName("맑은 고딕");
	           contentFont.setBold(false);
	           contentStyle.setFont(contentFont);
	           
	           CellStyle contentStyle2=form_wb.createCellStyle();
	           contentStyle2.setAlignment(HorizontalAlignment.LEFT);
	           contentStyle2.setVerticalAlignment(VerticalAlignment.CENTER);
	           contentStyle2.setBorderBottom(BorderStyle.THIN);
	           
	           XSSFFont contentFont2=form_wb.createFont();
	           contentFont2.setFontHeightInPoints((short)9);
	           contentFont2.setFontName("맑은 고딕");
	           contentFont2.setBold(false);
	           contentStyle2.setFont(contentFont2);
	           
	           CellStyle contentStyle3=form_wb.createCellStyle();
	           contentStyle3.setAlignment(HorizontalAlignment.LEFT);
	           contentStyle3.setVerticalAlignment(VerticalAlignment.CENTER);
	           contentStyle3.setBorderBottom(BorderStyle.THIN);
	           
	           XSSFFont contentFont3=form_wb.createFont();
	           contentFont3.setFontHeightInPoints((short)10);
	           contentFont3.setFontName("맑은 고딕");
	           contentFont3.setBold(true);
	           contentStyle3.setFont(contentFont3);
	           
	           CellStyle dateStyle=form_wb.createCellStyle();
	           dateStyle.setAlignment(HorizontalAlignment.CENTER);
	           dateStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	           dateStyle.setFillForegroundColor(HSSFColorPredefined.LIGHT_ORANGE.getIndex());
	           dateStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	           
	           XSSFFont dateFont=form_wb.createFont();
	           dateFont.setFontHeightInPoints((short)11);
	           dateFont.setFontName("맑은 고딕");
	           dateFont.setBold(false);
	           dateFont.setColor(IndexedColors.WHITE.getIndex());
	           dateStyle.setFont(dateFont);
	           System.out.println("실험");
	           
	           int start_num=0;

	           for(int i=1;i<=maxDay;i++) {
	               int cellnum=1+((i-1)*4);
	               Cell dayCell=form_sheet.getRow(5).createCell(cellnum);
	               form_sheet.addMergedRegion(new CellRangeAddress(5,6,cellnum,cellnum+2));
	               dayCell.setCellStyle(titleStyle);
	               dayCell.setCellValue("DAY"+i);
	               Cell dateCell=form_sheet.getRow(7).createCell(cellnum);
	               form_sheet.addMergedRegion(new CellRangeAddress(7,7,cellnum,cellnum+2));
	               dateCell.setCellStyle(dateStyle);
	               String startdate=dto.getStartdate().toString();
	               SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	               Calendar c=Calendar.getInstance();
	               c.setTime(sdf.parse(startdate));
	               startdate=sdf.format(c.getTime());
	               c.add(Calendar.DATE, i-1);
	               String nowDate=sdf.format(c.getTime());
	               dateCell.setCellValue(nowDate);
	               int max_route_num=mapinfoService.getMaxRoutenum(map_idx, i);
	               List<Integer> contentids =new ArrayList<Integer>();
	               for(int j=start_num;j<start_num+max_route_num;j++) {
	                  contentids.add(list.get(j).getContentid());
	                }
	                List<Gooppl_PlaceDetailDTO> pdList=gooppl_placedetailService.getThisDateDetail(contentids);
	                for(int j=0;j<pdList.size();j++) {
	                  form_sheet2.createRow(4+start_num+j);
	                }
	                Cell dayCell2=form_sheet2.getRow(4+start_num).createCell(1);
	                form_sheet2.addMergedRegion(new CellRangeAddress(4+start_num, 4+start_num+pdList.size()-1,1,1));
	                dayCell2.setCellStyle(contentStyle3);
	                dayCell2.setCellValue(i+"DAY");
	                for(int j=0;j<pdList.size();j++) {
	                  Cell titleCell2=form_sheet2.getRow(4+start_num+j).createCell(2);
	                  Cell addrCell2=form_sheet2.getRow(4+start_num+j).createCell(3);
	                  Cell goPageCell=form_sheet2.getRow(4+start_num+j).createCell(4);
	                   if(j==pdList.size()-1) {
	                     titleCell2.setCellStyle(contentStyle2);
	                     addrCell2.setCellStyle(contentStyle2);
	                     goPageCell.setCellStyle(contentStyle2);
	                   }else {
	                     titleCell2.setCellStyle(contentStyle);
	                     addrCell2.setCellStyle(contentStyle);
	                     goPageCell.setCellStyle(contentStyle);
	                   }
	                  titleCell2.setCellValue(pdList.get(j).getTitle());
	                  addrCell2.setCellValue(pdList.get(j).getAddr());
	                  CreationHelper createHelper = form_wb.getCreationHelper();
	                  goPageCell.setCellValue("Click Here");
	                  Hyperlink link = createHelper.createHyperlink(Hyperlink.LINK_FILE);
	                  String url="";
	                  if(pdList.get(j).getContentid()<=1000) {
	                     url="http://localhost:9090/gooppl/goAdPlaceDetail.do?contentid="+pdList.get(j).getContentid()+"&areacode="+pdList.get(j).getAreacode()+"&sigungucode="+pdList.get(j).getSigungucode();
	                  }else {
	                     url="http://localhost:9090/gooppl/goPlaceDetail.do?contentid="+pdList.get(j).getContentid()+"&areacode="+pdList.get(j).getAreacode()+"&sigungucode="+pdList.get(j).getSigungucode();
	                  }
	                  link.setAddress(url);
	                  goPageCell.setHyperlink((org.apache.poi.ss.usermodel.Hyperlink) link);
	                  int topRow=form_sheet.getLastRowNum();
	                  if(8+j>topRow) {
	                     form_sheet.createRow(8+j);
	                  }
	                  Cell route_numCell=form_sheet.getRow(8+j).createCell(cellnum);
	                  route_numCell.setCellValue(j+1);
	                  Cell contentCell=form_sheet.getRow(8+j).createCell(cellnum+1);
	                  form_sheet.addMergedRegion(new CellRangeAddress(8+j,8+j,cellnum+1,cellnum+2));
	                  contentCell.setCellStyle(contentStyle);
	                  if(pdList.get(j).getTitle().length()>10) {
	                     contentCell.setCellValue(pdList.get(j).getTitle().substring(0, 10));
	                  }else {
	                     contentCell.setCellValue(pdList.get(j).getTitle());
	                  }
	                }
	                start_num=start_num+max_route_num;
	           }
	           
	           //파일 이름, 형식, 헤더 설정
	           filename = "fileDown.xlsx";
	           response.setContentType("ms-vnd/excel;charset=EUC-KR");
	           response.setHeader("Content-Disposition", "attachment; filename=" + filename);
	           form_wb.write(response.getOutputStream());
	           response.getOutputStream().close();
	       } catch (Exception e) {
	           e.printStackTrace();
	       }
	   }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
	


	
	
	
}
