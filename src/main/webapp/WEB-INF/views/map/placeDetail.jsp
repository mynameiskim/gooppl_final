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
								    <c:if test="${sessionScope.sessionMemberType=='M'}">
										<label class="bg-primary text-center" style="width: 30px; border-radius: 50%; color: #fff; font-weight: 600; font-size: 1.2rem;">${profileNick}</label>
									</c:if>
									<c:if test="${sessionScope.sessionMemberType=='O'}">
										<label class="bg-secondary text-center" style="width: 30px; border-radius: 50%; color: #fff; font-weight: 600; font-size: 1.2rem;">${profileNick}</label>
									</c:if>	
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
								role="button" onclick="placeLogin()" >LogIn</a></li>
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
			</div>
		</div>
	</section>
	<script>
		function placeLogin(){
			location.href="index.do?login_result=need";
		}
	</script>
		<!-- Footer-->
	<%@include file="/WEB-INF/views/member/faq.jsp" %>
	<%@include file="/resource/modal/modal.jsp" %>
	<footer class="footer bg-light small text-center">
		<div class="container px-4 px-lg-5">Copyright &copy; Ezen&Team1 2021</div>
	</footer>
	<script src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=33817b3ae46352524552aa3d23525140"></script>
</body>
</html>