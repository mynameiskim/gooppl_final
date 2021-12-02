<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	left: 30%;
}
</style>
<script>
var contentid=${contentid}
var areacode;
var sigungucode;
var centerMapx;
var centerMapy;
var contenttype;
var placeDetail;
var overview;
var smallOverView;
window.onload = function() {
	settingPage(contentid);
}
function settingPage(contentid){
	var url='http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon'; /*URL*/
	var param='serviceKey=fX3lnf27RmPng52xVKCEdpQCWJLVPWN%2Fz4fBH0k1vtwxf%2BhoF9j%2Fvu5ZuJ%2FgYC5FK2AETjgxz0eeSMWThJbCYw%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&contentId='+contentid+'&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y';
	sendRequest(url, param, getPlaceDetail, 'GET'); 
}
function getPlaceDetail(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var doc = XHR.responseXML;
				var items = doc.getElementsByTagName('item');
				console.log(items[0]);
	        	if(items.length!=0){
	        	 var contentid;
	        	 var title;
	        	 var addr;
	        	 areacode;
	        	 sigungucode;
	        	 var mapx;
	        	 var mapy;
	        	 overview;
	        	 var homepage;
	        	 var firstimage;
	        	 if(items[0].getElementsByTagName('contentid').length==0){
	 	       		 contentid=0;
	        	 }else{
		        	 contentid=items[0].getElementsByTagName('contentid').item(0).firstChild.nodeValue;
	 	       	 }
	        	 if(items[0].getElementsByTagName('title').length==0){
	        		 title='';
	        	 }else{
		        	 title=items[0].getElementsByTagName('title').item(0).firstChild.nodeValue;

	        	 }
	        	 if(items[0].getElementsByTagName('addr1').length==0){
	        		 addr1='';
	        	 }else{
		        	 addr=items[0].getElementsByTagName('addr1').item(0).firstChild.nodeValue;
	        	 }
	        	 if(items[0].getElementsByTagName('areacode').length==0){
	        		 areacode=0;
	        	 }else{
		        	 areacode=items[0].getElementsByTagName('areacode').item(0).firstChild.nodeValue;
	        	 }
	        	 if(items[0].getElementsByTagName('sigungucode').length==0){
	        		 sigungucode=0;
	        	 }else{
		        	 sigungucode=items[0].getElementsByTagName('sigungucode').item(0).firstChild.nodeValue;
	        	 }
	        	 if(items[0].getElementsByTagName('contenttypeid').length==0){
	        		 contenttype=0;
	        	 }else{
		        	 contenttype=items[0].getElementsByTagName('contenttypeid').item(0).firstChild.nodeValue;
	        	 }
	        	 if(items[0].getElementsByTagName('mapx').length==0){
	        		 mapx=0;
	        	 }else{
		        	 mapx=items[0].getElementsByTagName('mapx').item(0).firstChild.nodeValue;
	        	 }
	        	 if(items[0].getElementsByTagName('mapy').length==0){
	        		 mapy=0;
	        	 }else{
		        	 mapy=items[0].getElementsByTagName('mapy').item(0).firstChild.nodeValue;
	        	 }
	        	 if(items[0].getElementsByTagName('overview').length==0){
	        		 overview='';
	        	 }else{
		        	 overview=items[0].getElementsByTagName('overview').item(0).firstChild.nodeValue;
	        	 }
	        	 if(items[0].getElementsByTagName('homepage').length==0){
	        		 homepage='';
	        	 }else{
		        	 homepage=items[0].getElementsByTagName('homepage').item(0).firstChild.nodeValue;
	        	 }
	        	 if(items[0].getElementsByTagName('firstimage').length==0){
	        		 firstimage='resource/img/noimage.png'
	        	 }else{
		        	 firstimage=items[0].getElementsByTagName('firstimage').item(0).firstChild.nodeValue;
	        	 }
	        	 placeDetail={
	        	 	contentid:contentid,
	        	 	title:title,
	        	 	addr:addr,
	        	 	areacode:areacode,
	        	 	sigungucode:sigungucode,
	        	 	contenttype:contenttype,
	        	 	mapx:mapx,
	        	 	mapy:mapy,
	        	 	overview:overview,
	        	 	homepage:homepage,
	        	 	firstimage:firstimage,
	        	 };
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
	        	 var divBody='<div id="detail"><img src="'+firstimage+'" alt="NoImage" width="600"><h3 style="font-size:20px;text-align: left;">상세정보</h3>';
	        	 divBody+='<hr/><p id="overview" style="width: 600px;word-break:break-all; text-align: left;font-size:12px;">'+smallOverView+'</p>';
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
	 		var map = new kakao.maps.Map(mapContainer, mapOption); 
	 		
	 		// 마커가 표시될 위치입니다 
	 		var markerPosition  = new kakao.maps.LatLng(centerMapy, centerMapx); 

	 		// 마커를 생성합니다
	 		var marker = new kakao.maps.Marker({
	 		    position: markerPosition
	 		});

	 		// 마커가 지도 위에 표시되도록 설정합니다
	 		marker.setMap(map);
	        }
		}
	}
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
</script>
</head>
<body>
	<div id="allDiv">
		<div id="divHead"></div>
		<div id="divBody"></div>
		<!-- 지도를 표시할 div 입니다 -->
		<div id="map" style="width:100%;height:250px;"></div>
	</div>
	<script src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=33817b3ae46352524552aa3d23525140"></script>
</body>
</html>