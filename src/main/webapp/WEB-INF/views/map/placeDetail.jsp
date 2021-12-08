<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관광지 상세 정보 페이지</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/gooppl/resource/css/styles.css" rel="stylesheet" />
<link href="/gooppl/resource/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<!-- jquery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- XHM -->
<script type="text/javascript" src="/gooppl/resource/js/httpRequest.js"></script>
<script src="resource/js/httpRequest.js"></script>
<style>
#allDiv{
	top: 10%;
	top: 90px;
    left: 50%;
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
var contentid=${contentid}
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
	        }

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

	        placeMoreDetail();
		}
	}
}
function placeMoreDetail(){
	var url='http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro';
	var param='ServiceKey=fX3lnf27RmPng52xVKCEdpQCWJLVPWN%2Fz4fBH0k1vtwxf%2BhoF9j%2Fvu5ZuJ%2FgYC5FK2AETjgxz0eeSMWThJbCYw%3D%3D&contentTypeId='+contenttype+'&contentId='+contentid+'&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&introYN=Y';
	sendRequest(url, param, getResultDetail, 'GET');
}
function getResultDetail(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var doc=XHR.responseXML;
			var items = doc.getElementsByTagName('item');
			console.log(items[0]);
			if(items.length!=0){
	        	 var chkcreditcard;
	        	 var infocenter;
	        	 var parking;
	        	 var restdate;
	        	 var usetime;
	        	 
	        	 if(items[0].getElementsByTagName('chkcreditcard').length==0){
	        		 chkcreditcard='알 수 없음';
	        	 }else{
	        		 chkcreditcard=items[0].getElementsByTagName('chkcreditcard').item(0).firstChild.nodeValue;
	 	       	 }
	        	 
	        	 if(items[0].getElementsByTagName('infocenter').length==0){
	        		 infocenter='알 수 없음';
	        	 }else{
	        		 infocenter=items[0].getElementsByTagName('infocenter').item(0).firstChild.nodeValue;
	 	       	 }
	        	 
	        	 if(items[0].getElementsByTagName('parking').length==0){
	        		 parking='알 수 없음';
	        	 }else if(items[0].getElementsByTagName('parking').item(0).hasChildNodes()==false){
	        		 parking='알 수 없음';
	        	 }else{
	        		 parking=items[0].getElementsByTagName('parking').item(0).firstChild.nodeValue;
	        	 }
	        	 
	        	 if(items[0].getElementsByTagName('restdate').length==0){
	        		 restdate='알 수 없음';
	        	 }else{
	        		 restdate=items[0].getElementsByTagName('restdate').item(0).firstChild.nodeValue;
	 	       	 }
	        	 
	        	 if(items[0].getElementsByTagName('usetime').length==0){
	        		 usetime='알 수 없음';
	        	 }else if(items[0].getElementsByTagName('usetime').item(0).hasChildNodes()==false){
	        		 usetime='알 수 없음';
	 	       	 }else{
	 	       		usetime=items[0].getElementsByTagName('usetime').item(0).firstChild.nodeValue;
	 	       	 }
	        	 
	        	 placeDetail.chkcreditcard=chkcreditcard;
	        	 placeDetail.infocenter=infocenter;
	        	 placeDetail.parking=parking;
	        	 placeDetail.restdate=restdate;
	        	 placeDetail.usetime=usetime;
	        	 
	        	 var area_txtView=document.getElementById('area_txtTable');
		  	     var area_txtViewStr='';
		  	     
		  	     area_txtViewStr+='<tr>'+
						  	     	'<th style="vertical-align: top;text-align: left;"><label>&check; 문의 및 안내</label></th>'+
						  	     	'<td style="vertical-align: top;word-break:break-all;">'+placeDetail.infocenter+'</td>'+
						  	     	'<th style="vertical-align: top;text-align: left;"><label>&check; 홈페이지</label></th>'+
						  	     	'<td style="vertical-align: top;word-break:break-all;">'+placeDetail.homepage+'</td>'+
						  	     '</tr>'+
						  	     '<tr>'+
						  	     	'<th style="vertical-align: top;text-align: left;"><label>&check; 주소</label></th>'+
						  	     	'<td style="vertical-align: top;word-break:break-all;">'+placeDetail.addr+'</td>'+
						  	     	'<th style="vertical-align: top;text-align: left;"><label>&check; 이용시간</label></th>'+
						  	     	'<td style="vertical-align: top;word-break:break-all;">'+placeDetail.usetime+'</td>'+
						  	     '</tr>'+		  	     
						  	     '<tr>'+
						  	     	'<th style="vertical-align: top;text-align: left;"><label>&check; 휴일</label></th>'+
						  	     	'<td style="vertical-align: top;word-break:break-all;">'+placeDetail.restdate+'</td>'+
						  	     	'<th style="vertical-align: top;text-align: left;"><label>&check; 주차</label></th>'+
						  	     	'<td style="vertical-align: top;word-break:break-all;">'+placeDetail.parking+'</td>'+
						  	     '</tr>'+	
						  	     '<tr>'+
						  	     	'<th style="vertical-align: top;text-align: left;"><label>&check; 입장료</label></th>'+
						  	     	'<td style="vertical-align: top;word-break:break-all;">'+placeDetail.chkcreditcard+'</td>'+
						  	     '</tr>';		  	     
		  	        area_txtView.innerHTML=area_txtViewStr;
	        	 
		}
	}
}
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
<body id="page-top">
 <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="subNav">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="index.do">GooPPl</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="createMap.do">Plan</a></li>
                    <li class="nav-item"><a class="nav-link" href="placeList.do">Place</a></li>
                    <li class="nav-item"><a class="nav-link" href="comunity.do">Community</a></li>
                    <c:choose>
						<c:when test="${!empty sessionNickname}">
							<li class="nav-item dropdown dropend">
								  <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
								    <label class="bg-primary text-center"
								    	style="
                                        width: 30px;
                                        border-radius: 50%;
                                        color: #fff;
                                        font-weight: 600;
                                        font-size: 1.2rem;">${profileNick}</label>
								  </a>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<li><a class="dropdown-item" href="mypage.do">myPage</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="logout.do">Logout</a></li>
							</ul>
							</li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a id="login_bt" class="nav-link" href="#"
								role="button" data-bs-toggle="modal" data-bs-target="#loginmd">LogIn</a></li>
						</c:otherwise>
					</c:choose>
                </ul>
            </div>
        </div>
    </nav>
    <section>
		<div
			class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center" style="margin-top: 90px;">
			<div class="d-flex justify-content-center">
				<div class="text-center">
					<div id="allDiv">
						<div id="divHead"></div>
						<div id="divBody"></div>
						<br><br>
						<!-- 지도를 표시할 div 입니다 -->
						<div id="map" style="width:100%;height:250px;position: relative;"></div>
						<br>
						<div id="area_txtView" style="margin-bottom: 50px;">
							<table id="area_txtTable" style="font-size: 12px;"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	    		<!-- Contact-->
	<section class="contact-section bg-light align-items-center">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-md-center">
				<div class="col-md-3 mb-3 mb-md-0" style="padding: 0px 10px">
					<div class="card py-1 h-100">
						<div class="card-body text-center">
							<i class="fas fa-map-marked-alt text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">Address</h4>
							<hr class="my-4 mx-auto" />
							<div class="small text-black-50">은평구 동서로 101-2</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 mb-3 mb-md-0" style="padding: 0px 10px">
					<div class="card py-1 h-100">
						<div class="card-body text-center">
							<i class="fas fa-envelope text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">Email</h4>
							<hr class="my-4 mx-auto" />
							<div class="small text-black-50">
								<a href="#">hello@yourdomain.com</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3 mb-3 mb-md-0" style="padding: 0px 10px">
					<div class="card py-1 h-100">
						<div class="card-body text-center">
							<i class="fas fa-mobile-alt text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">FAQ</h4>
							<hr class="my-4 mx-auto" />
							<div class="small text-black-50">
								<a href="#" roll="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">문의하기</a>
							</div>
						</div>
					</div>
				</div>
	<!-- #####################################FAQ################################################## -->
        <div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-50" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel" style="padding-right: 0px;padding-left:0px;">
		  <div class="offcanvas-header bg-primary" style="border-bottom:1px solid lightgray;">
		    <h3 class="offcanvas-title text-center text-white-50" id="offcanvasScrollingLabel">자주하는질문 FAQ</h3>
		    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
		  </div>
		  <!-- ------------------------------------------------------------------------------ -->
		  <div class="offcanvas-body">
		    <div class="faqHeader" style="font-size: 20px; margin: 10px;">일정관련 FAQ</div>
		    	<div class="accordion accordion-flush" id="accordionPanelsStayOpenExample">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingOne1">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse1" aria-expanded="false" aria-controls="panelsStayOpen-collapse1">
				        - 일정 만들기란 무엇인가요?	 
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse1" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne1" data-bs-parent="#accordionPanelsStayOpenExample">
				      <div class="accordion-body">
				        <strong>'일정 만들기'란</strong> 나만의 여행 일정을 계획하는 기능으로, 내가 가고 싶은 명소들의 위치를 지도에서 보며 동선을 계획할 수 있습니다. 드래그 & 드롭하여 방문 순서를 정렬하면 자동으로 경로가 보여집니다. 방문 일자별로 명소들을 정렬하여 나만의 여행 일정을 손쉽게 만들 수 있습니다.</code>
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingTwo2">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse2" aria-expanded="false" aria-controls="panelsStayOpen-collapse2">
				        - 완성된 일정을 수정할 수 있나요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse2" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo2" data-bs-parent="#accordionPanelsStayOpenExample">
				      <div class="accordion-body">
				        <strong>내 일정은 언제든지 다시 수정할 수 있습니다.</strong>마이페이지의 '나의일정'에서 '수정'을 클릭하여 일정을 수정해 보세요.	 
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingThree3">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse3" aria-expanded="false" aria-controls="panelsStayOpen-collapse3">
				        - 일정 공유란 무엇인가요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse3" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree3" data-bs-parent="#accordionPanelsStayOpenExample">
				      <div class="accordion-body">
				        <strong>나만의 일정을 공유할수 있습니다.</strong>나의 일정을 공유하거나 다른 회원님들의 일정을 공유받음으로써 여행자들의 일정을 보고 마음에 드는 명소를 확인하여 나만의 일정을 만들어보세요
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingThree4">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse4" aria-expanded="false" aria-controls="#panelsStayOpen-collapse4">
				        - 여러 도시를 한 일정에 넣을 수 있나요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse4" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree4" data-bs-parent="#accordionPanelsStayOpenExample">
				      <div class="accordion-body">
				        <strong>가능합니다.</strong>우선 일정 만들기를 시작해 보세요. 지도에서 일정을 만드는 과정에서 다른 도시의 명소목록을 불러와 선택하여 장소들을 일정에 넣을 수 있습니다. 여러 도시의 방문 일정을 순서대로 계획하시면 됩니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingThree5">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse5" aria-expanded="false" aria-controls="#panelsStayOpen-collapse5">
				        - 여행지 검색 목록이란 무엇인가요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse5" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree5" data-bs-parent="#accordionPanelsStayOpenExample">
				      <div class="accordion-body">
				        <strong>여행지 검색이란,</strong>여행지에서 명소/음식점/호텔등을 검색하여 리스트에서 선택한 장소들을 일정에 추가할수 있는 기능입니다. 
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item mb-5">
				    <h2 class="accordion-header" id="panelsStayOpen-headingThree6">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse6" aria-expanded="false" aria-controls="panelsStayOpen-collapse6">
				        - 추천 여행지는 무엇인가요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse6" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree6" data-bs-parent="#accordionPanelsStayOpenExample">
				      <div class="accordion-body">
				        <strong>추천 여행지는</strong>국내에서 관광명소가 많고 관광객들의 발길이 끊이지 않는 여행지들을 카드화 시켜놓아서 회원님들이 여행지역을 선정할시에 도움을 드릴수 있습니다. 
				      </div>
				    </div>
				  </div>
				  
				</div>
				<div class="faqHeader" style="font-size: 20px; margin: 10px;">계정관련 FAQ</div>
		    	<div class="accordion accordion-flush" id="accordionPanelsStayOpenExample1">
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingOne7">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse7" aria-expanded="false" aria-controls="panelsStayOpen-collapse7">
				        - 소셜 로그인이 되지 않습니다.	 
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse7" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne7" data-bs-parent="#accordionPanelsStayOpenExample1">
				      <div class="accordion-body">
				        먼저 귀하의 브라우저가 각 소셜 페이지에 다른 사람의 아이디로 로그인 되어있는 지 확인해 보시기 바랍니다. 소셜 페이지에서 로그아웃을 한 후에 다시 시도해 주세요. 그래도 로그인이 되지 않으면 소셜페이지에서 아이디와 비밀번호를 확인해 보시기 바랍니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingTwo8">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse8" aria-expanded="false" aria-controls="panelsStayOpen-collapse8">
				        - 비밀번호를 잊어버렸습니다. 
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse8" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo8" data-bs-parent="#accordionPanelsStayOpenExample1">
				      <div class="accordion-body">
				        로그인 화면에서 '비밀번호 찾기'를 클릭하고 가입시 기입한 이메일 주소를 적어주세요. 해당 이메일로 비밀번호 변경이 가능하도록 도와드립니다.	 
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingThree9">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse9" aria-expanded="false" aria-controls="panelsStayOpen-collapse9">
				        - GooPPl 회원을 탈퇴하고 싶어요.
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse9" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree9" data-bs-parent="#accordionPanelsStayOpenExample1">
				      <div class="accordion-body">
				        로그인 후, 마이페이지 '설정'에서 프로필 수정 하단에 '회원탈퇴' 버튼이 있습니다. 구플 계정을 삭제하고 탈퇴를 원하시면 이 버튼을 클릭하면 됩니다. 탈퇴 시에는 귀하의 정보와 게시글,일정 등 모든 내용이 삭제됩니다. 신중히 고려하시기 바랍니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingThree10">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse10" aria-expanded="false" aria-controls="panelsStayOpen-collapse10">
				        - 회원 정보를 어떻게 수정하나요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse10" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree10" data-bs-parent="#accordionPanelsStayOpenExample1">
				      <div class="accordion-body">
				        마이페이지 '프로필수정'에서 회원 정보를 수정하실 수 있습니다. '프로필수정'에서는 닉네임, 비밀번호 변경, 및 회원탈퇴를 하실 수 있습니다. 이메일 주소의 변경을 원하실 경우에는 관리자에게 문의해 주시기 바랍니다.
				      </div>
				    </div>
				  </div>
				  <div class="accordion-item">
				    <h2 class="accordion-header" id="panelsStayOpen-headingThree11">
				      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapse11" aria-expanded="false" aria-controls="panelsStayOpen-collapse11">
				        - 나의 개인정보가 안전한가요?
				      </button>
				    </h2>
				    <div id="panelsStayOpen-collapse11" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree11" data-bs-parent="#accordionPanelsStayOpenExample1">
				      <div class="accordion-body">
				        GooPPl의 <a href="#" target="_blank">'개인정보 취급방침'</a> 내용을 확인하시기 바랍니다.
				      </div>
				    </div>
				  </div>
				</div>
			</div>
		  </div>
		 <!-- #####################################################끝################################################# -->
			</div>
		</div>
	</section>
	
		<!-- Footer-->
	<footer class="footer bg-light small text-center">
		<div class="container px-4 px-lg-5">Copyright &copy; Ezen&Team1 2021</div>
	</footer>
	<script src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=33817b3ae46352524552aa3d23525140"></script>
</body>
</html>