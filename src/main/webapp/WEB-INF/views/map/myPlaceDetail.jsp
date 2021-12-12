<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/resource/meta/meta.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지 상세 정보 페이지</title>
<script src="resource/js/httpRequest.js"></script>
<style>
#allDiv{
	position: absolute;
	top: 10%;
	left: 22%;
}
#area_txtTable {
	width:800px;
}
#area_txtTable th label{
	width: 180px;
}
#area_txtTable td{
	width:250px;
}
.wrap {position: absolute;left: 0;bottom: 10px;width: 265px;height: 110px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 10px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
.wrap * {padding: 0;margin: 0;}
.wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
.wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
.info .title {padding: 5px 0 0 10px;height: 17px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
.info .close {position: absolute;top: 7px;right: 7px;color: #888;width: 10px;height: 10px;background: url('https://cdn.visitkorea.or.kr/resources/images/main/main_quick_close.png');background-size: 10px 10px;}
.info .close:hover {cursor: pointer;}
.info .body {position: relative;overflow: hidden;}
.info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
.desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
.desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
.info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
</style>
<script>
var contentid='${placeinfo.contentid}';
var areacode;
var sigungucode;
var centerMapx;
var centerMapy;
var contenttype;
var placeDetail;
var overview;
var smallOverView;
var map;
var marker;
var overlay;
var btNode1;
var btNode2;
window.onload = function() {
	settingPage();
}
function settingPage(){
	 var title='${placeinfo.title}';
	 var addr='${placeinfo.addr}';
	 areacode='${placeinfo.areacode}';
	 sigungucode='${placeinfo.areacode}';
	 contenttype=12;
	 var mapx=${placeinfo.mapx}+0;
	 var mapy=${placeinfo.mapy}+0;
	 overview='${placeinfo.overview}.';
	 var homepage='${placeinfo.homepage}';
	 var firstimage='${placeinfo.firstimage}';
	 placeDetail={
     	 	contentid:contentid,
     	 	title:title,
     	 	addr:addr,
     	 	areacode:areacode,
     	 	sigungucode:sigungucode,
     	 	contenttype:12,
     	 	mapx:mapx,
     	 	mapy:mapy,
     	 	overview:overview,
     	 	homepage:homepage,
     	 	firstimage:firstimage,
     	 };
	     console.log(placeDetail);  	 
		centerMapx=mapx;
		centerMapy=mapy;
		 if(overview.length>685){
			 smallOverView=overview.substring(0, 685)+'...';
		 }else{
			 smallOverView=overview;
		 }
	
		 var contenttype_s;
		 if(contenttype==12){
			 contenttype_s='관광지';
		 }else if(contenttype==14){
			 contenttype_s='문화시설';
		 }else if(contenttype==32){
			 contenttype_s='숙박';
		 }else if(contenttype==38){
			 contenttype_s='쇼핑';
		 }else if(contenttype==39){
			 contenttype_s='음식점';
		 }else if(contentype==0){
			 contenttype_s='';
		 }
		 var allDiv=document.getElementById('allDiv');
		 allDiv.setAttribute('align', 'center');
		 var divHead='<h2 id="topTitle">'+title+'</h2>';
		 divHead+='<div class="area_address" id="topAddr"><p style="font-size:12px;color:dimgray;">${areaname}  ${sigunguname} > '+contenttype_s+'</p>';
		 divHead+='<p id="addr"></p></div>';
		 var divHeadNode=document.getElementById('divHead');
		 divHeadNode.innerHTML=divHead;
		 var divBody='<div id="detail"><img src="'+firstimage+'" alt="NoImage" width="800"><h3 style="font-size:20px;text-align: left;">상세정보</h3>';
		 divBody+='<hr/><p id="overview" style="width:800px;word-break:break-all; text-align: left;font-size:12px;">'+smallOverView+'</p>';
		 divBody+='</div><div id="cont_more" style="float:right;"><button type="button" onclick="changeButton(1)" id="cont_more_bt" title="내용더보기" style="background:white; border:0px;font-size:10px;"><b>내용 더보기 + </b>';
		 divBody+='<button type="button" onclick="changeButton(2)" id="cont_small_bt" title="내용닫기" style="background:white; border:0px;font-size:10px;display:none;"><b>내용 닫기 - </b></div>';
		 var divBodyNode=document.getElementById('divBody');
		 divBodyNode.innerHTML=divBody;
		
		 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(centerMapy, centerMapx), // 지도의 중심좌표
		        level: 4 // 지도의 확대 레벨
		    };
		
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(centerMapy, centerMapx); 
	
		// 마커를 생성합니다
		marker = new kakao.maps.Marker({
		    position: markerPosition
		});
	
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	
	
	btNode1=document.createElement('input');
	btNode1.setAttribute('type', 'image');
	btNode1.setAttribute('id', 'mapPlus');
	btNode1.setAttribute('src', 'https://cdn.visitkorea.or.kr/resources/images/sub/icon_map_view.png');
	btNode1.setAttribute('style', 'width:30px; height: 30px;');
	btNode1.setAttribute('onclick', 'resizeAddMap()');
		
	btNode2=document.createElement('input');
	btNode2.setAttribute('type', 'image');
	btNode2.setAttribute('id', 'mapminus');
	btNode2.setAttribute('src', 'https://cdn.visitkorea.or.kr/resources/images/sub/icon_map_view01.png');
	btNode2.setAttribute('style', 'width:30px; height: 30px;');
	btNode2.setAttribute('onclick', 'resizeMinusMap()');
	map.addControl(btNode1, kakao.maps.ControlPosition.BOTTOMRIGHT);
	
	var infocenter='${placeinfo.homepage}';
	placeDetail.infocenter=infocenter;
	 
	 var area_txtView=document.getElementById('area_txtTable');
	     var area_txtViewStr='';
	     
	     area_txtViewStr+='<tr>'+
			  	     	'<th style="vertical-align: top;text-align: left;"><label>&check; 문의 및 안내</label></th>'+
			  	     	'<td style="vertical-align: top;word-break:break-all;">'+placeDetail.infocenter+'</td>'+
			  	     	'<th style="vertical-align: top;text-align: left;"><label>&check; 주소</label></th>'+
			  	     	'<td style="vertical-align: top;word-break:break-all;">'+placeDetail.addr+'</td>'+
			  	     '</tr>';		  	     
	        area_txtView.innerHTML=area_txtViewStr;
}
function resizeAddMap(){
	var mapContainer = document.getElementById('map');
	mapContainer.style.width = '100%'; 
	mapContainer.style.height = '500px'; 
    relayout();
    setCenter();
 // 커스텀 오버레이에 표시할 컨텐츠 입니다
    // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
    // 별도의 이벤트 메소드를 제공하지 않습니다 
    var content = '<div class="wrap">' + 
                '    <div class="info">' + 
                '        <div class="title">' + 
                '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                '        </div>' + 
                '        <div class="body">' + 
                '            <div class="img">' +
                '                <img src="'+placeDetail.firstimage+'" width="73" height="70">' +
                '           </div>' + 
                '            <div class="desc">' + 
                '                <div class="title2"><strong style="font-size:15px;">'+placeDetail.title+'</strong></div><br>'+
                '                <div class="ellipsis">'+placeDetail.addr+'</div>' + 
                '            </div>' + 
                '        </div>' + 
                '    </div>' +    
                '</div>';

    // 마커 위에 커스텀오버레이를 표시합니다
    // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
    overlay = new kakao.maps.CustomOverlay({
        content: content,
        map: map,
        position: marker.getPosition()       
    });

    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        overlay.setMap(map);
    });
    map.removeControl(btNode1, kakao.maps.ControlPosition.BOTTOMRIGHT);
    map.addControl(btNode2, kakao.maps.ControlPosition.BOTTOMRIGHT);
}

function resizeMinusMap(){
	var mapContainer = document.getElementById('map');
	mapContainer.style.width = '100%'; 
	mapContainer.style.height = '250px'; 
    relayout();
    setCenter();
    closeOverlay();
    map.removeControl(btNode2, kakao.maps.ControlPosition.BOTTOMRIGHT);
    map.addControl(btNode1, kakao.maps.ControlPosition.BOTTOMRIGHT);
}
function relayout() {    
    map.relayout();
}
function setCenter() {            
    var moveLatLon = new kakao.maps.LatLng(centerMapy, centerMapx);
    map.setCenter(moveLatLon);
}
function changeButton(num){
	var overviewDiv=document.getElementById('overview');
	var openBt;
	var closeBt;
	if(num==1){
		overviewDiv.innerHTML=overview;
		openBt=document.getElementById('cont_small_bt');
		closeBt=document.getElementById('cont_more_bt');
	}else if(num==2){
		overviewDiv.innerHTML=smallOverView;
		openBt=document.getElementById('cont_more_bt');
		closeBt=document.getElementById('cont_small_bt');
	}
	openBt.style.display='block';
	closeBt.style.display='none';
}
//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
    overlay.setMap(null);     
}
</script>
</head>
<body>
	<div id="allDiv">
		<div id="divHead"></div>
		<div id="divBody"></div>
		<br><br>
		<!-- 지도를 표시할 div 입니다 -->
		<div id="map" style="width:100%;height:250px;position: relative;"></div>
		<br>
		<div id="area_txtView">
			<table id="area_txtTable" style="font-size: 12px;"></table>
		</div>
	</div>
	<script src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=33817b3ae46352524552aa3d23525140"></script>
</body>
</html>