<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정만들기</title>
    <link rel="icon" type="image/x-icon" href="resource/assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <!-- sweetalert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/gooppl/resource/css/bootstrap.min.css" rel="stylesheet"/>
   	<link href="/gooppl/resource/css/styles.css" rel="stylesheet" />
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/modals/">
<style>
select{
	margin-left: 5px;
    box-shadow: 0 0.1875rem 0.1875rem 0 rgb(0 0 0 / 10%) !important;
    padding: 0.5rem 0.4rem;
    height: auto;
    font-family: "Varela Round", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    font-size: 80%;
    text-transform: uppercase;
    letter-spacing: 0.15rem;
    border: 0;
	border-radius: 5px;
}

div{
	font-family: "Varela Round", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    font-size: 100%;
    
}
input[type="text"]{
    box-shadow: 0 0.1875rem 0.1875rem 0 rgb(0 0 0 / 10%) !important;
    padding: 0.5rem 1.5rem;
    height: auto;
    font-family: "Varela Round", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    font-size: 80%;
    text-transform: uppercase;
    letter-spacing: 0.15rem;
    border: 0;
	border-radius: 5px;
}
input[type="date"]{
	background-color: #64a19d;
	outline: none;
	border: none;
	font-family: "Roboto Mono",monospace;
	color: white;
	border-radius: 5px;
	font-size: 11px;
}
input[type="button"]{
	border: 0;
	background-color: #f3969a;
	font-family: "Varela Round", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    font-size: 80%;
    border-radius: 5px;
	color: white;
    box-shadow: 0 0.1875rem 0.1875rem 0 rgb(0 0 0 / 10%) !important;
}
#del_Bt{
	border: 0;
	background-color: #f3969a;
	font-family: "Varela Round", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    font-size: 80%;
    border-radius: 5px;
	color: white;
    box-shadow: 0 0.1875rem 0.1875rem 0 rgb(0 0 0 / 10%) !important;
}

table{
	font-family: "Varela Round", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    font-size: 80%;
}
:root {
  --border-color: #e3e5e4;
  --background-color: #c3c7ca;
  --text-color: #34444f;
}
.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
.savedList {border:1px;padding:0;list-style-type:none;border-radius: 5px;}
.savedList li{display: flex;flex: 1;font-size: 80%;font-family: "Varela Round", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";}
.savedList li:not(:last-of-type) {border-bottom: 1px solid var(--border-color);}
.savedList li.over .draggable {background-color: #f3969a;}
.savedList .placeinfo {margin: 0 17px 0 0;}
.draggable { cursor: pointer; display: flex; align-items: center;justify-content: space-between;padding:10px;flex: 1;margin:0px 0px;}
.tripnum{color: white; border-radius: 5px;background:#f3969a;width:8%;display: flex;align-items: center;justify-content: center;}
.placeinfo{width:80%;align-text: center;vertical-align:middle;display:inline;}

</style>
<script src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=33817b3ae46352524552aa3d23525140&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="resource/js/httpRequest.js"></script>
<script
      src="https://kit.fontawesome.com/3da1a747b2.js"
      crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
var member_idx=${member_idx}
var areacodes=[];
var sigungucodes=[];
var map_idx=${map_idx};
var moveDay;
var setAreacode;
var setSigungucode;
var setContenttype;
var isClick=false;


/**새로 검색할때 관광데이터 리스트 초기화 제이쿼리*/
$(function () {
    $('#search_bt').click( function() {
        $('#setTable').empty();
    });
});
/**추가한 여행지 전체삭제*/
$(function () {
    $('#del_Bt').click( function() {
        $('#savedList').empty();
        hideLines();
        latly.splice(0, latly.length);
        drawLines.splice(0, drawLines.length);
		markers.splice(0, markers.length);
        mapys.splice(0, mapys.length);
        mapxs.splice(0, mapxs.length);
        titles.splice(0, titles.length);
        images.splice(0, images.length);
        addrs.splice(0, addrs.length);
        contentids.splice(0, contentids.length);
        contenttypeids.splice(0, contentids.length);
        count2 = 0;
    });
});

/**동적으로 생성된 태그에 접근*/
/**선택한 여행지 삭제*/
$(function() {
	$(document).on("click",".del_Bt2",function(){
        var click_id = $(this).attr('id');
        $('#savedList').empty();
        hideLines();
        hideMarkers();
        latly.splice(click_id, 1);
        drawLines.splice(click_id-1, 1);
		markers.splice(click_id, 1);
        mapys.splice(click_id, 1);
        mapxs.splice(click_id, 1);
        titles.splice(click_id, 1);
        images.splice(click_id, 1);
        addrs.splice(click_id, 1);    
        contentids.splice(click_id, 1);
        contenttypeids.splice(click_id, 1);
        listItems.splice(click_id, 1); 
        
    	for(var i=0; i<mapys.length; i++){
    		
    	    var imageSrc;
    	    var imageSrc2;
    	    
    	    if(contenttypeids[i]==12){ //관광지
    	    	imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker1_def.png'; // 마커이미지의 주소입니다
    	    	imageSrc2 = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker1_on.png'; // 마커이미지의 주소입니다
    	    }else if(contenttypeids[i]==39){ //음식점
    	    	imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker6_def.png';
    	    	imageSrc2 = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker6_on.png';
    	    }else if(contenttypeids[i]==32){ //숙박
    	    	imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker5_def.png';
    	    	imageSrc2 = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker5_on.png';
    	    }else if(contenttypeids[i]==38){ //쇼핑
    	    	imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker4_def.png';
    	    	imageSrc2 = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker4_on.png';
    	    }else if(contenttypeids[i]==77){
    	    	imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker7_def.png';
    	    	imageSrc2 = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker7_on.png';
    	    }
    	    
    	    // 결과값으로 받은 위치를 마커로 표시합니다
    		var imageSize = new kakao.maps.Size(26, 36), // 마커이미지의 크기입니다
    		    imageOption = {offset: new kakao.maps.Point(12, 38)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
    		
    		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    			markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize, imageOption),
    		    markerPosition = new kakao.maps.LatLng(mapys[i], mapxs[i]); // 마커가 표시될 위치입니다
    		
    		// 마커를 생성합니다
    		var marker = new kakao.maps.Marker({
    		  position: markerPosition,
    		  image: markerImage // 마커이미지 설정 
    		});
    	    
    	    var xy = {
    	   		position: new kakao.maps.LatLng(mapys[i], mapxs[i])
    	    }
    	    
    	    latly[i]= xy.position;
    	    
    	    // 인포윈도우로 장소에 대한 설명을 표시합니다
    	    var infowindow = new kakao.maps.InfoWindow({
    	        content: '<table border="0" style="width:155px;height:180px;align:center;margin-left:0px;border-color:#E2E2E2;">'+
			    			'<tr style="margin-top:0px;">'+
			    				'<td><img src="'+images[i]+'" style="width:155px;height:100px;"></td>'+
			    			'</tr>'+
			    			'<tr style="height:80px;">'+
			    				'<td><p style="font-size:12px;padding-left:7px;padding-right:7px;word-break:break-all;padding-top:7px;font-weight: bold;">'+
			    				'<i class="fas fa-map-marker-alt"style="color:#64a19d;font-size:15px;"></i>&nbsp;&nbsp;'+titles[i]+'</p>'+
			    				'<p style="font-size:10px;padding-left:7px;padding-right:7px;word-break:break-all;">'+addrs[i]+'<br>'+
			    				'<span style="font-size:17px;float:right;padding:3px;" onclick="popup('+contentids[i]+')">'+
			    				'<i class="fas fa-info-circle" style="color:#64a19d;">'+
			    			'</tr>'+
						'</table>'
    	    });
    	    
    	    // 이동할 위도 경도 위치를 생성합니다 
    	    var moveLatLon = new kakao.maps.LatLng(mapys[i], mapxs[i]);
    	   
    	    // 지도 중심을 부드럽게 이동시킵니다
    	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    	    map.panTo(moveLatLon);
    	    
    	    markers[i] = marker;
    	    
    	    isClick = false;
    	    
    	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    	    
    	    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
    	    kakao.maps.event.addListener(marker, 'click', function() {
    	   	 //closeOverlay();
    	        //overlay.setMap(map);
    	    	if(!isClick){
    	        	isClick=true;
    	        }
    	    });
    	    
    	    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    	        isClick=false;
    	        infowindow.close();
    	    });
    	    
    	    var linePath;
    	    var lineLine = new daum.maps.Polyline();

            for (var j = 0; j < i; j++) {
                if (latly.length != 0) {
                    linePath = [ latly[i-1], latly[i] ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
                }
                ;
                
                lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다    
                
            }
            
            var strokeColors;
            
            if(contenttypeids[i]==12){
            	strokeColors = '#db4040'; // 선의 색깔입니다
            }else if(contenttypeids[i]==39){
            	strokeColors = '#f39a24'; // 선의 색깔입니다
            }else if(contenttypeids[i]==32){
            	strokeColors = '#1ee09c'; // 선의 색깔입니다
            }else if(contenttypeids[i]==38){
            	strokeColors = '#a024f3'; // 선의 색깔입니다
            }else if(contenttypeids[i]==77){
            	strokeColors = '#a024f3';
            }
            
        	var drawLine = new daum.maps.Polyline({
        	    path : linePath,
        	    strokeWeight : 6, // 선의 두께입니다
        	    strokeColor: strokeColors,
        	    strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
        	    strokeStyle : 'dashed' // 선의 스타일입니다
        	});

            drawLines[i] = drawLine;
            drawLine.setMap(map);
            
    	    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
    	    console.log(infowindow);
    	    console.log(marker);
    	    function makeOverListener(map, marker, infowindow) {
    	    	if(isClick){return;}
    	        return function() {
    	            infowindow.open(map, marker);
    	        };
    	    }
    		
    	    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    	    function makeOutListener(infowindow) {
    	    	if(isClick){return;}
    	        return function() {
    	            infowindow.close();
    	        };
    	    }

    	    // 마커를 지도에 표시합니다.
    		marker.setMap(map);
    	              
    		var savedList = document.getElementById('savedList');
    	    
    	    var listitem=document.createElement('li');
    	    listitem.setAttribute('class', 'listName');
    	    listitem.setAttribute('id', 'li'+i);
    	    listitem.setAttribute('data-index', i);
    	    var spanNode=document.createElement('span');
    	    spanNode.setAttribute('class', 'tripnum');
    	    var spanTextNode=document.createTextNode(i);
    	    spanNode.appendChild(spanTextNode);
    	    spanNode.setAttribute('style', 'vertical-align:middle;text-align:center;');
    	    var divNode=document.createElement('div');
    	    divNode.setAttribute('class', 'draggable');
    	    divNode.setAttribute('draggable', 'true');
    	    divNode.setAttribute('style', 'justify-content: center;');
    	    var pNode=document.createElement('span');
    	    pNode.setAttribute('class', 'placeinfo');
    	    var imgNode=document.createElement('img');
    	    imgNode.setAttribute('src', images[i]);
    	    imgNode.setAttribute('style', 'width: 80px; height: 80px; border-radius: 8px;');
    	    pNode.appendChild(imgNode);
    	    var spanNode2=document.createElement('span');
    	    spanNode2.setAttribute('class', 'tripdis');
    	    var spanTextNode2=document.createTextNode(titles[i]);
    	    spanNode2.setAttribute('style', 'word-break: break-all;display:inline-block; vertical-align: top; max-width: 80px;');
    	    spanNode2.appendChild(spanTextNode2);
    	    pNode.appendChild(spanNode2);
    	    pNode.setAttribute('style', 'display:inline; max-width: 80px;');
    	    divNode.appendChild(pNode);
    	    var addBt = document.createElement('input');
    	    addBt.setAttribute('type','button');
    	    addBt.className='del_Bt2';
    	    addBt.id=i;
    	    addBt.setAttribute('value','-');
    	    var hiddenNode=document.createElement('input');
    	    hiddenNode.setAttribute('type', 'hidden');
    	    hiddenNode.setAttribute('name', 'contentid');
    	    hiddenNode.setAttribute('value', contentids[i]);
    	    hiddenNode.setAttribute('class', 'contentid');
    	    divNode.appendChild(addBt);
    	    divNode.appendChild(hiddenNode);
    	    listitem.appendChild(spanNode);
    	    listitem.appendChild(divNode);
    	    savedList.appendChild(listitem);
    	    
    	    listItems[i]=listitem;
    	    
    	    addEventListeners();
    	}
    count2--;
    });
});

/**드래그앤 드랍시 새로 생성 ---아직 안됨 미완성*/
function newlist(){
        $('#savedList').empty();
        hideLines();
        hideMarkers();  
        
    	for(var i=0; i<mapys.length; i++){
    		
    	    var imageSrc;
    	    var imageSrc2;
    	    
    	    if(contenttypeids[i]==12){ //관광지
    	    	imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker1_def.png'; // 마커이미지의 주소입니다
    	    	imageSrc2 = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker1_on.png'; // 마커이미지의 주소입니다
    	    }else if(contenttypeids[i]==39){ //음식점
    	    	imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker6_def.png';
    	    	imageSrc2 = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker6_on.png';
    	    }else if(contenttypeids[i]==32){ //숙박
    	    	imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker5_def.png';
    	    	imageSrc2 = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker5_on.png';
    	    }else if(contenttypeids[i]==38){ //쇼핑
    	    	imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker4_def.png';
    	    	imageSrc2 = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker4_on.png';
    	    }else if(contenttypeids[i]==77){
    	    	imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker7_def.png';
    	    	imageSrc2 = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker7_on.png';
    	    }
    	    
    	    // 결과값으로 받은 위치를 마커로 표시합니다
    		var imageSize = new kakao.maps.Size(26, 36), // 마커이미지의 크기입니다
    		    imageOption = {offset: new kakao.maps.Point(12, 38)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
    		
    		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
    			markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize, imageOption),
    		    markerPosition = new kakao.maps.LatLng(mapys[i], mapxs[i]); // 마커가 표시될 위치입니다
    		
    		// 마커를 생성합니다
    		var marker = new kakao.maps.Marker({
    		  position: markerPosition,
    		  image: markerImage // 마커이미지 설정 
    		});
    	    
    	    var xy = {
    	   		position: new kakao.maps.LatLng(mapys[i], mapxs[i])
    	    }
    	    
    	    latly[i]= xy.position;

    	    // 인포윈도우로 장소에 대한 설명을 표시합니다
    	    var infowindow = new kakao.maps.InfoWindow({
    	        content: '<table border="0" style="width:155px;height:180px;align:center;margin-left:0px;border-color:#E2E2E2;">'+
			    			'<tr style="margin-top:0px;">'+
			    				'<td><img src="'+images[i]+'" style="width:155px;height:100px;"></td>'+
			    			'</tr>'+
			    			'<tr style="height:80px;">'+
			    				'<td><p style="font-size:12px;padding-left:7px;padding-right:7px;word-break:break-all;padding-top:7px;font-weight: bold;">'+
			    				'<i class="fas fa-map-marker-alt"style="color:#64a19d;font-size:15px;"></i>&nbsp;&nbsp;'+titles[i]+'</p>'+
			    				'<p style="font-size:10px;padding-left:7px;padding-right:7px;word-break:break-all;">'+addrs[i]+'<br>'+
			    				'<span style="font-size:17px;float:right;padding:3px;" onclick="popup('+contentids[i]+')">'+
			    				'<i class="fas fa-info-circle" style="color:#64a19d;">'+
			    			'</tr>'+
						'</table>'
    	    });
    	    // 이동할 위도 경도 위치를 생성합니다 
    	    var moveLatLon = new kakao.maps.LatLng(mapys[i], mapxs[i]);
    	   
    	    // 지도 중심을 부드럽게 이동시킵니다
    	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    	    map.panTo(moveLatLon);
    	    
    	    markers[i] = marker;
    	    
    	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
            kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    	    
            isClick =false;
            
    	    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
    	    kakao.maps.event.addListener(marker, 'click', function() {
    	   	 //closeOverlay();
    	        //overlay.setMap(map);
    	    	if(!isClick){
    	        	isClick=true;
    	        }
    	    });
    	    
    	    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    	        isClick=false;
    	        infowindow.close();
    	    });
    	    
    	    var linePath;
    	    var lineLine = new daum.maps.Polyline();

            for (var j = 0; j < i; j++) {
                if (latly.length != 0) {
                    linePath = [ latly[i-1], latly[i] ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
                }
                ;
                
                lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다    
                
            }
            
            var strokeColors;
            
            if(contenttypeids[i]==12){
            	strokeColors = '#db4040'; // 선의 색깔입니다
            }else if(contenttypeids[i]==39){
            	strokeColors = '#f39a24'; // 선의 색깔입니다
            }else if(contenttypeids[i]==32){
            	strokeColors = '#1ee09c'; // 선의 색깔입니다
            }else if(contenttypeids[i]==38){
            	strokeColors = '#a024f3'; // 선의 색깔입니다
            }else if(contenttypeids[i]==77){
            	strokeColors = '#a024f3';
            }
            
        	var drawLine = new daum.maps.Polyline({
        	    path : linePath,
        	    strokeWeight : 6, // 선의 두께입니다
        	    strokeColor: strokeColors,
        	    strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
        	    strokeStyle : 'dashed' // 선의 스타일입니다
        	});

            drawLines[i] = drawLine;
            drawLine.setMap(map);
            
    	    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
    	    function makeOverListener(map, marker, infowindow) {
    	    	if(isClick){return;}
    	        return function() {
    	            infowindow.open(map, marker);
    	        };
    	    }
    		
    	    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    	    function makeOutListener(infowindow) {
    	    	if(isClick){return;}
    	        return function() {
    	            infowindow.close();
    	        };
    	    }

    	    // 마커를 지도에 표시합니다.
    		marker.setMap(map);   
    	    
    		var savedList = document.getElementById('savedList');
    	    
    	    var listitem=document.createElement('li');
    	    listitem.setAttribute('class', 'listName');
    	    listitem.setAttribute('id', 'li'+i);
    	    listitem.setAttribute('data-index', i);
    	    var spanNode=document.createElement('span');
    	    spanNode.setAttribute('class', 'tripnum');
    	    var spanTextNode=document.createTextNode(i);
    	    spanNode.appendChild(spanTextNode);
    	    spanNode.setAttribute('style', 'vertical-align:middle;text-align:center;');
    	    var divNode=document.createElement('div');
    	    divNode.setAttribute('class', 'draggable');
    	    divNode.setAttribute('draggable', 'true');
    	    divNode.setAttribute('style', 'justify-content: center;');
    	    var pNode=document.createElement('span');
    	    pNode.setAttribute('class', 'placeinfo');
    	    var imgNode=document.createElement('img');
    	    imgNode.setAttribute('src', images[i]);
    	    imgNode.setAttribute('style', 'width: 80px; height: 80px; border-radius: 8px;');
    	    pNode.appendChild(imgNode);
    	    var spanNode2=document.createElement('span');
    	    spanNode2.setAttribute('class', 'tripdis');
    	    var spanTextNode2=document.createTextNode(titles[i]);
    	    spanNode2.setAttribute('style', 'word-break: break-all;display:inline-block; vertical-align: top; max-width: 80px;');
    	    spanNode2.appendChild(spanTextNode2);
    	    pNode.appendChild(spanNode2);
    	    pNode.setAttribute('style', 'display:inline; max-width: 80px;');
    	    divNode.appendChild(pNode);
    	    var addBt = document.createElement('input');
    	    addBt.setAttribute('type','button');
    	    addBt.className='del_Bt2';
    	    addBt.id=i;
    	    addBt.setAttribute('value','-');
    	    var hiddenNode=document.createElement('input');
    	    hiddenNode.setAttribute('type', 'hidden');
    	    hiddenNode.setAttribute('name', 'contentid');
    	    hiddenNode.setAttribute('value', contentids[i]);
    	    hiddenNode.setAttribute('class', 'contentid');
    	    divNode.appendChild(addBt);
    	    divNode.appendChild(hiddenNode);
    	    listitem.appendChild(spanNode);
    	    listitem.appendChild(divNode);
    	    savedList.appendChild(listitem);
    	    
    	    listItems[i]=listitem;
    	    
    	    addEventListeners();
    	}
}
    
    
//특별, 광역시, 도 단위 지역 이동시 처리할 함수
function changeAreacode(){
	var sigunguSelector=document.getElementById('sigungucode');
	var optionNodes=sigunguSelector.getElementsByTagName('option');
	for(var i=0;i<optionNodes.length;i++){
		var optionNode=optionNodes[i];
		optionNode.style.display='none';
	}
	sigunguSelector.value='0';
	var areaSelector=document.getElementById('areacode');
	var areacodeVal=areaSelector.options[areaSelector.selectedIndex].value;
	var areacodeText=areaSelector.options[areaSelector.selectedIndex].text;
	var sigunguList = document.getElementsByClassName(areacodeVal);
	var mapxy=areaSelector.options[areaSelector.selectedIndex].getAttribute('data-value');
	var mapxys=mapxy.split(',');
	var mapx=mapxys[1];
	var mapy=mapxys[0];
	for(var i=0;i<sigunguList.length;i++){
		var sigungu=sigunguList[i];
		sigungu.style.display='block';
	}
	var moveLatLon = new kakao.maps.LatLng(mapy, mapx);
	
	map.panTo(moveLatLon);
}
var contentids2=[];
var roopState=false;

/**중복 선택 막는 쿼리*/
$(function() {
   $(document).on("click",".add_Bt",function(){
        var click_id = $(this).attr('id');
      for(var i=0; i<contentids.length; i++){
         if(contentids[i]==click_id){
            $('#'+click_id).hide();
         }
      }
     });
});

var once=false;

/**데이터 검색 테이블 생성*/
function show(){
	var areacodeSelector=document.getElementById('areacode');
	var sigungucodeSelector=document.getElementById('sigungucode');
	var areacode=areacodeSelector.options[areacodeSelector.selectedIndex].value;
	var sigungucode=sigungucodeSelector.options[sigungucodeSelector.selectedIndex].value;
	var contenttype=document.getElementById('cate').value;
	sigungucode=sigungucode==0?'':sigungucode;
	setAreacode=areacode;
	setSigungucode=sigungucode;
	setContenttype=contenttype;
	if(areacode!=''&&(document.getElementById('areaC').value==''||document.getElementById('areaC').value==null)){
		var url='http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList'; /*URL*/
		var param = 'ServiceKey=z8c%2FjRTMz%2FWFvdFuWTueDK74T8y21zFfSv4VYmmMI0hijUh7RsqRZSydypjPZ%2FOSS%2BC6H0sWSqBY9hbjDnYTig%3D%3D&contentTypeId='+contenttype+'&areaCode='+areacode+'&sigunguCode='+sigungucode+'&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=O&numOfRows=100&pageNo=1';
		sendRequest(url, param, showResult, 'GET');   
	}else{
		var url='http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword'; /*URL*/
		var param = 'serviceKey=z8c%2FjRTMz%2FWFvdFuWTueDK74T8y21zFfSv4VYmmMI0hijUh7RsqRZSydypjPZ%2FOSS%2BC6H0sWSqBY9hbjDnYTig%3D%3D&MobileApp=AppTest&MobileOS=ETC&pageNo=1&numOfRows=1000&listYN=Y&arrange=O&contentTypeId='+document.getElementById('cate').value+'&areaCode='+areacode+'&sigunguCode='+sigungucode+'&keyword='+document.getElementById('areaC').value;
		sendRequest(url, param, showResult, 'GET');   
	}
}
function showResult(){
   if(XHR.readyState==4){
      if(XHR.status==200){
		// alert("${mapinfolist[0].contentid}");
		
		if(roopState==false){
			<c:forEach items="${mapinfolist}" var="item1">
			
			contentids2.push("${item1.contentid}");
			
			</c:forEach>
			Info2(contentids2[0]);
		}
		
         var doc = XHR.responseXML;
         var items = doc.getElementsByTagName('item');
         var table = document.getElementById('setTable');
         //table.setAttribute('style','width: 20%; float: left;');
         if(adContents.length!=0){
       		for(var i=0;i<adContents.length;i++){
       			if(setSigungucode==''){
       				if(adContents[i].contenttype==setContenttype && adContents[i].areacode==setAreacode){
       					var title=adContents[i].title;
       					var contentid=adContents[i].contentid;
       					var addr=adContents[i].addr;
       					var image=adContents[i].image;
       					var mapx=adContents[i].mapx;
       					var mapy=adContents[i].mapy;
       					var contenttype=adContents[i].contenttype;
       					
     		             var trNode = document.createElement('tr');
      		             if(mapx==0||mapy==0){
      		             	trNode.setAttribute('style', 'display:none;');
      		             }
      		             var trNode = document.createElement('tr');
      		             if(mapx==0||mapy==0){
      		             	trNode.setAttribute('style', 'display:none;');
      		             }
      		             var tdNode2 = document.createElement('td');
      		             tdNode2.setAttribute('style', 'height: 100px;');
      		             var imgNode = document.createElement('img');
      		             imgNode.setAttribute('src', image);	
      		             imgNode.setAttribute('style', 'width: 85px; height: 85px; border-radius: 12px; ');
      		             
      		             var tdNode3 = document.createElement('td');
      		             tdNode3.setAttribute('style', 'width: 90px;');
      		             var tdTextNode3 = document.createTextNode(title);

      		          
      		             var tdNode4 = document.createElement('td');
      		             var addBt = document.createElement('input');
      		             addBt.setAttribute('type','button');
      		             addBt.setAttribute('value','+');
      		             var image2 = encodeURI(image);
      		             addBt.setAttribute('onclick','makeMarker('+contentid+','+mapy+','+mapx+',"'+title+'","'+image2+'","'+addr+'","'+contenttype+'")');
      		             addBt.className = 'add_Bt';
      		             
      		             table.appendChild(trNode);
      		             trNode.appendChild(tdNode2);
      		             trNode.appendChild(tdNode3);
      		             trNode.appendChild(tdNode4);

      		             tdNode2.appendChild(imgNode);
      		             tdNode3.appendChild(tdTextNode3);
      		             tdNode4.appendChild(addBt);
       				}
       			}else{
       				if(adContents[i].contenttype==setContenttype && adContents[i].areacode==setAreacode && adContents[i].sigungucode==setSigungucode){
       					var title=adContents[i].title;
       					var contentid=adContents[i].contentid;
       					var addr=adContents[i].addr;
       					var image=adContents[i].image;
       					var mapx=adContents[i].mapx;
       					var mapy=adContents[i].mapy;
       					var contenttype=adContents[i].contenttype;
       					
     		             var trNode = document.createElement('tr');
      		             if(mapx==0||mapy==0){
      		             	trNode.setAttribute('style', 'display:none;');
      		             }
      		             var tdNode2 = document.createElement('td');
      		             tdNode2.setAttribute('style', 'height: 100px;');
      		             var imgNode = document.createElement('img');
      		             imgNode.setAttribute('src', image);	
      		             imgNode.setAttribute('style', 'width: 85px; height: 85px; border-radius: 12px; ');
      		             
      		             var tdNode3 = document.createElement('td');
      		             tdNode3.setAttribute('style', 'width: 90px;');
      		             var tdTextNode3 = document.createTextNode(title);

      		          
      		             var tdNode4 = document.createElement('td');
      		             var addBt = document.createElement('input');
      		             addBt.setAttribute('type','button');
      		             addBt.setAttribute('value','+');
      		           	 var image2 = encodeURI(image);
      		             addBt.setAttribute('onclick','makeMarker('+contentid+','+mapy+','+mapx+',"'+title+'","'+image2+'","'+addr+'","'+contenttype+'")');
      		             addBt.className = 'add_Bt';
      		             
      		             table.appendChild(trNode);
      		             trNode.appendChild(tdNode2);
      		             trNode.appendChild(tdNode3);
      		             trNode.appendChild(tdNode4);

      		             tdNode2.appendChild(imgNode);
      		             tdNode3.appendChild(tdTextNode3);
      		             tdNode4.appendChild(addBt);            
       				}
       			}
       		}
       	}
         for(var i=0;i<items.length;i++){
             var item = items[i];
             var count=i+1;
             var title;
             var addr;
 			var mapx;
 			var mapy;
 			var contenttypeid;
 			
 			var contentid = item.getElementsByTagName('contentid').item(0).firstChild.nodeValue;
             var image;
             
             if(item.getElementsByTagName('title').length==0){
 	       		 title='0';
 	       	 }else{
 	       		 title_s=item.getElementsByTagName('title').item(0).firstChild.nodeValue;
 	       		 title=title_s.split('(');
 	       		 title=title[0];
 	       	 }
 	       	 
 	       	 if(item.getElementsByTagName('addr1').length==0){
 	       		 addr='0';
 	       	 }else{
 	       		 addr=item.getElementsByTagName('addr1').item(0).firstChild.nodeValue;
 	       	 }
 	       	if(item.getElementsByTagName('mapx').length==0){
 	       		 mapx=0;
 	       	 }else{
 	       		 mapx=item.getElementsByTagName('mapx').item(0).firstChild.nodeValue;
 	       	 }
 	       	 if(item.getElementsByTagName('mapy').length==0){
 	       		 mapy=0;
 	       	 }else{
 	       		 mapy=item.getElementsByTagName('mapy').item(0).firstChild.nodeValue;
 	       	 }
             
             if(item.getElementsByTagName('firstimage').length==0){
                image='resource/img/noimage.png';
             }else{
                image=item.getElementsByTagName('firstimage').item(0).firstChild.nodeValue;
             }
             
             if(item.getElementsByTagName('contenttypeid').length==0){
            	 contenttypeid=0;
              }else{
            	 contenttypeid=item.getElementsByTagName('contenttypeid').item(0).firstChild.nodeValue;
              }
  
             var trNode = document.createElement('tr');
             trNode.id = contentid;
             if(mapx==0||mapy==0){
             	trNode.setAttribute('style', 'display:none;');
             }
             
             for(var j=0; j<contentids.length; j++){
                 if(contentid==contentids[j]){
                    trNode.setAttribute('style', 'display:none;');
                 }
              }
             
             var tdNode2 = document.createElement('td');
             tdNode2.setAttribute('style', 'height: 100px;');
             var imgNode = document.createElement('img');
             imgNode.setAttribute('src', image);	
             imgNode.setAttribute('style', 'width: 85px; height: 85px; border-radius: 12px; ');
             
             var tdNode3 = document.createElement('td');
             tdNode3.setAttribute('style', 'width: 90px;');
             var tdTextNode3 = document.createTextNode(title);

          
             var tdNode4 = document.createElement('td');
             var addBt = document.createElement('input');
             addBt.setAttribute('type','button');
             addBt.setAttribute('value','+');
             addBt.setAttribute('onclick','makeMarker('+contentid+','+mapy+','+mapx+',"'+title+'","'+image+'","'+addr+'","'+contenttypeid+'")');
             addBt.className = 'add_Bt';
             
             addBt.id = contentid;
             
             table.appendChild(trNode);
             trNode.appendChild(tdNode2);
             trNode.appendChild(tdNode3);
             trNode.appendChild(tdNode4);

             tdNode2.appendChild(imgNode);
             tdNode3.appendChild(tdTextNode3);
             tdNode4.appendChild(addBt);

          }
         
         if(once==false){
        	 show();
        	 once=true;
         }
      }
   }
}


function saveContentid2(){
	/**onload시에 createMap에서 저장된 contentid 가져옴*/
	contentids2.splice(0,1);
	Info2(contentids2[0]);
}

function Info2(contentid){
	<c:forEach items="${tripList}" var="tripdto">
    if(${tripdto.contentid}==contentid){
    	var title='${tripdto.title}';
    	var addr='${tripdto.addr}';
    	var mapy=${tripdto.mapy};
    	var mapx=${tripdto.mapx};
    	var image='${tripdto.firstimage}';
    	var contenttypeid=77;
    	makeMarker(contentid, mapy, mapx, title, image, addr, contenttypeid);
    }
 	</c:forEach>
 	if(contentids2.length>1){
 	   saveContentid2();
    }else{
    	 roopState=true;
    }
}


/**createMap에서 가져온 contentid로 DB placedetail에 테이블 조회 후 저장된 정보 가져옴*/
/**
function Info(contentid) {
   console.log(contentid);
   $.ajax({
        url: "loadPlaceDetail.do",
        type: "POST",
        data: {
           contentid:contentid
        },
        success: function(data){
           if (data.Code == 0 ) {
                   var title = data.data[0].title;
                   var addr = data.data[0].addr;
                   var mapy = data.data[0].mapy;
                   var mapx = data.data[0].mapx;
                   var image = data.data[0].firstimage;
                   var contentid = data.data[0].contentid;          
                       
                   makeMarker(contentid, mapy, mapx, title, image, addr);
           } else {
              alert(data.Msg);
           }
        },
        error: function(){
            alert("err");
        }
     });
   if(contentids2.length>1){
	   saveContentid2();
   }else{
	   roopState==true;
   }
}
*/

function placeDetailInfo(contentid){
	if(contentid<1000){
		saveAdDetail(contentid);
	}else{
		var url='http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon'; /*URL*/
		var param='serviceKey=z8c%2FjRTMz%2FWFvdFuWTueDK74T8y21zFfSv4VYmmMI0hijUh7RsqRZSydypjPZ%2FOSS%2BC6H0sWSqBY9hbjDnYTig%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&contentId='+contentid+'&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y';
		sendRequest(url, param, getResult, 'GET'); 
	}
}
function saveAdDetail(contentid){
	for(var i=0;i<adContents.length;i++){
		if(adContents[i].contentid==contentid){
			var title=adContents[i].title.substr(4, adContents[i].title.length);
			var addr=adContents[i].addr;
			var areacode=adContents[i].areacode;
			var sigungucode=adContents[i].sigungucode;
			var contenttype=adContents[i].contenttype;
			var mapx=adContents[i].mapx;
			var mapy=adContents[i].mapy;
			var overview=adContents[i].overview;
			var homepage=adContents[i].homepage;
			var image=adContents[i].image;

			 var placeDetail={
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
		     	 	firstimage:image
		     	 };
	     	 placeDetails.push(placeDetail);
		}
	}
}

function getResult(){
	 if(XHR.readyState==4){
	      if(XHR.status==200){
	         var doc = XHR.responseXML;
	         var items = doc.getElementsByTagName('item');
	         if(items.length!=0){
	        	 var contentid;
	        	 var title;
	        	 var addr;
	        	 var areacode;
	        	 var sigungucode;
	        	 var contenttype;
	        	 var mapx;
	        	 var mapy;
	        	 var overview;
	        	 var homepage;
	        	 var firstimage;
	        	 if(items[0].getElementsByTagName('contentid').length==0){
	 	       		 contentid=0;
	        	 }else{
		        	 contentid=items[0].getElementsByTagName('contentid').item(0).firstChild.nodeValue;
	 	       	 }
	        	 if(items[0].getElementsByTagName('title').length==0){
	        		 title='알 수 없음';
	        	 }else{
		        	 title=items[0].getElementsByTagName('title').item(0).firstChild.nodeValue;

	        	 }
	        	 if(items[0].getElementsByTagName('addr1').length==0){
	        		 addr1='알 수 없음';
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
	        		 overview='알 수 없음';
	        	 }else{
		        	 overview=items[0].getElementsByTagName('overview').item(0).firstChild.nodeValue;
	        	 }
	        	 if(items[0].getElementsByTagName('homepage').length==0){
	        		 homepage='알 수 없음';
	        	 }else{
		        	 homepage=items[0].getElementsByTagName('homepage').item(0).firstChild.nodeValue;
	        	 }
	        	 if(items[0].getElementsByTagName('firstimage').length==0){
	        		 firstimage='resource/img/noimage.png'
	        	 }else{
		        	 firstimage=items[0].getElementsByTagName('firstimage').item(0).firstChild.nodeValue;
	        	 }
	        	 
	        	 var placeDetail={
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
	        	 	firstimage:firstimage
	        	 };        	 
	        	 placeDetails.push(placeDetail);
				
	         }
	      }
	 }
}

var count2 = 0;
var listItems=[];
var placeDetails = [];

var markers = [];
var latly = [];
var drawLines = [];
var mapys = [];
var mapxs = [];
var titles = [];
var images = [];
var addrs = [];
var contentids = [];
var contenttypeids = [];
  
/**추가 버튼 누른후 마커생성*/
function makeMarker(contentid, mapy, mapx, title, image, addr, contenttypeid){
	
	var state=0;
	
	<c:forEach var="tripdto" items="${tripList}">
	if(${tripdto.contentid}==contentid){
		state=1;
		var title='${tripdto.title}';
		var addr='${tripdto.addr}';
		var areacode=${tripdto.areacode};
		var sigungucode=${tripdto.sigungucode};
		var contenttype=77;
		var mapx=${tripdto.mapx};
		var mapy=${tripdto.mapy};
		var overview='${tripdto.overview}'.replace(/\'/gi,"");
		var homepage='${tripdto.homepage}';
		var image='${tripdto.firstimage}';
		 var placeDetail={
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
	     	 	firstimage:image
	     	 };
     	 placeDetails.push(placeDetail);
	}
	</c:forEach>
	
	if(state!=1){
		placeDetailInfo(contentid);
	}
	
    mapys.push(mapy);
    mapxs.push(mapx);
    titles.push(title);
    images.push(decodeURI(image));
    addrs.push(addr);
    contentids.push(contentid);
    contenttypeids.push(contenttypeid);
    
    var imageSrc;
    var imageSrc2;
    
    if(contenttypeid==12){ //관광지
    	imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker1_def.png'; // 마커이미지의 주소입니다
    	imageSrc2 = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker1_on.png'; // 마커이미지의 주소입니다
    }else if(contenttypeid==39){ //음식점
    	imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker6_def.png';
    	imageSrc2 = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker6_on.png';
    }else if(contenttypeid==32){ //숙박
    	imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker5_def.png';
    	imageSrc2 = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker5_on.png';
    }else if(contenttypeid==38){ //쇼핑
    	imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker4_def.png';
    	imageSrc2 = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker4_on.png';
    }else if(contenttypeid==77){
    	imageSrc = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker7_def.png';
    	imageSrc2 = 'https://korean.visitkorea.or.kr/resources/images/sub/ico_marker7_on.png';
    }
    
    // 결과값으로 받은 위치를 마커로 표시합니다
	var imageSize = new kakao.maps.Size(26, 36), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(12, 38)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize, imageOption),
	    markerPosition = new kakao.maps.LatLng(mapy, mapx); // 마커가 표시될 위치입니다
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	  position: markerPosition,
	  image: markerImage // 마커이미지 설정 
	});
    
    var xy = {
   		position: new kakao.maps.LatLng(mapy, mapx)
    }
    
    latly.push(xy.position);
    
    
    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<table border="0" style="width:155px;height:180px;align:center;margin-left:0px;border-color:#E2E2E2;">'+
        			'<tr style="margin-top:0px;">'+
        				'<td><img src="'+decodeURI(image)+'" style="width:155px;height:100px;"></td>'+
        			'</tr>'+
        			'<tr style="height:80px;">'+
        				'<td><p style="font-size:12px;padding-left:7px;padding-right:7px;word-break:break-all;padding-top:7px;font-weight: bold;">'+
        				'<i class="fas fa-map-marker-alt"style="color:#64a19d;font-size:15px;"></i>&nbsp;&nbsp;'+title+'</p>'+
        				'<p style="font-size:10px;padding-left:7px;padding-right:7px;word-break:break-all;">'+addr+'<br>'+
        				'<span style="font-size:17px;float:right;padding:3px;" onclick="popup('+contentid+')">'+
        				'<i class="fas fa-info-circle" style="color:#64a19d;">'+
        			'</tr>'+
    			'</table>'
    });
    
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(mapy, mapx);
    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);
    
    markers.push(marker);
    
    isClick = false;
    
    
    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    
    var linePath;
    var lineLine = new daum.maps.Polyline();

    var distance;
 
    for (var i = 0; i < 1; i++) {
        if (count2 != 0) {
            linePath = [ latly[count2-1], latly[count2] ] //라인을 그리려면 두 점이 있어야하니깐 두 점을 지정했습니다
        }
        ;
        
        lineLine.setPath(linePath); // 선을 그릴 라인을 세팅합니다
        
    }
    
 // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
    kakao.maps.event.addListener(marker, 'click', function() {
   	 //closeOverlay();
        //overlay.setMap(map);
        popup(contentid);
    	if(!isClick){
        	isClick=true;
        }
    });
    
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
        isClick=false;
        infowindow.close();
    });
 
    var strokeColors;
    
    if(contenttypeid==12){
    	strokeColors = '#db4040'; // 선의 색깔입니다
    }else if(contenttypeid==39){
    	strokeColors = '#f39a24'; // 선의 색깔입니다
    }else if(contenttypeid==32){
    	strokeColors = '#1ee09c'; // 선의 색깔입니다
    }else if(contenttypeid==38){
    	strokeColors = '#a024f3'; // 선의 색깔입니다
    }else if(contenttypeid==77){
    	strokeColors = '#a024f3'; // 선의 색깔입니다
    }
    
	var drawLine = new daum.maps.Polyline({
	    path : linePath,
	    strokeWeight : 6, // 선의 두께입니다
	    strokeColor: strokeColors,
	    strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	    strokeStyle : 'dashed' // 선의 스타일입니다
	});

    drawLines.push(drawLine);
    drawLine.setMap(map);
    
    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
    function makeOverListener(map, marker, infowindow) {
    	if(isClick){return;}
        return function() {
            infowindow.open(map, marker);
        };
    }

    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    function makeOutListener(infowindow) {
    	if(isClick){return;}
        return function() {
        	infowindow.close();
        };
    }

    // 마커를 지도에 표시합니다.
	marker.setMap(map);
       
    //----------------------------------------------------
	var savedList = document.getElementById('savedList');
    
    var listitem=document.createElement('li');
    listitem.setAttribute('class', 'listName');
    listitem.setAttribute('id', 'li'+count2);
    listitem.setAttribute('data-index', count2);
    var spanNode=document.createElement('span');
    spanNode.setAttribute('class', 'tripnum');
    var spanTextNode=document.createTextNode(count2);
    spanNode.appendChild(spanTextNode);
    spanNode.setAttribute('style', 'vertical-align:middle;text-align:center;');
    var divNode=document.createElement('div');
    divNode.setAttribute('class', 'draggable');
    divNode.setAttribute('draggable', 'true');
    divNode.setAttribute('style', 'justify-content: center;');
    var pNode=document.createElement('span');
    pNode.setAttribute('class', 'placeinfo');
    var imgNode=document.createElement('img');
    imgNode.setAttribute('src', decodeURI(image));
    imgNode.setAttribute('style', 'width: 80px; height: 80px; border-radius: 8px;');
    pNode.appendChild(imgNode);
    var spanNode2=document.createElement('span');
    spanNode2.setAttribute('class', 'tripdis');
    var spanTextNode2=document.createTextNode(title);
    spanNode2.setAttribute('style', 'word-break: break-all;display:inline-block; vertical-align: top; max-width: 80px;');
    spanNode2.appendChild(spanTextNode2);
    pNode.appendChild(spanNode2);
    pNode.setAttribute('style', 'display:inline; max-width: 80px;');
    divNode.appendChild(pNode);
    var addBt = document.createElement('input');
    addBt.setAttribute('type','button');
    addBt.className='del_Bt2';
    addBt.id=count2;
    addBt.setAttribute('value','-');
    var hiddenNode=document.createElement('input');
    hiddenNode.setAttribute('type', 'hidden');
    hiddenNode.setAttribute('name', 'contentid');
    hiddenNode.setAttribute('value', contentid);
    hiddenNode.setAttribute('class', 'contentid');
    divNode.appendChild(addBt);
    divNode.appendChild(hiddenNode);
    listitem.appendChild(spanNode);
    listitem.appendChild(divNode);
    savedList.appendChild(listitem);
    
    count2++;
    //---------------------------------------------
    
    /*
	var savedList = document.getElementById('savedList');
	var listitem = savedList.innerHTML;
    
    listitem+= '<li class="listName" id="li"'+count2+'" data-index="'+(count2)+'">';
	    listitem+= '<span class="tripnum" style="vertical-align:middle;text-align:center;">'+count2+'</span>';
	    listitem+= '<div class="draggable" draggable="true">';
		    listitem+= '<p class="placeinfo" style="display:inline;">';
			    listitem+= '<img src="'+image+'" style="width: 80px; height: 80px; border-radius: 8px;">';
			    listitem+= '<span class="tripdis" style="word-break: break-all;display:inline-block; vertical-align: top;">'+title+'</span>';
		    listitem+= '</p>';
		    listitem+= '<input type="button" id="'+count2+'" class="del_Bt2" value="-">';
		    listitem+= '<input type="hidden" name="cotentid" value="'+contentid+'" class="contentid">';
	    listitem+= '</div>';
    listitem+= '</li>';
    
	savedList.innerHTML=listitem;
	
	count2++;
	*/
	
    listItems.push(listitem);

    addEventListeners();
    
}

function popup(contentid){
	var title;
	var areacode;
	var sigungucode;
	var overview;
	var firstimage;
	var areatxt;
	var sigungutxt;
	console.log(placeDetails.length);
	for(var i=0;i<placeDetails.length;i++){
		if(contentid==placeDetails[i].contentid){
			title=placeDetails[i].title;
			areacode=placeDetails[i].areacode;
			sigungucode=placeDetails[i].sigungucode;
			overview=placeDetails[i].overview.replace(/\'/gi,"");
			firstimage=placeDetails[i].firstimage;
		}
	}
	<c:forEach var="areadto" items="${arealist }">
		if(${areadto.areacode}==areacode){
			areatxt='${areadto.areaname}';
		}
	</c:forEach>
	<c:forEach var="sigungudto" items="${sigungulist}">
		if(${sigungudto.areacode}==areacode && ${sigungudto.sigungucode}==sigungucode){
			sigungutxt='${sigungudto.sigungu_name}';
		}
	</c:forEach>
	var modal_title=document.getElementById('staticBackdropLabel');
	var modalTitle='<strong>'+title+'</strong>';
	modalTitle += '<br><span style="font-size:13px;color:dimgray;padding:5px;">&nbsp;&nbsp;'+areatxt+'&nbsp;>&nbsp;'+sigungutxt+'</span>';
	modal_title.innerHTML=modalTitle;
	var modal_body=document.getElementById('modal-body');
	var modalBody='';
	modalBody+='<img src="'+firstimage+'" style="width:458px;">';
	modalBody+='<br><p style="font-size:13px;padding-top:10px;word-break:break-all;">'+overview+'</p>';
	modal_body.innerHTML=modalBody;
	document.getElementById('modalBtn').click();
}


function addEventListeners() {
	  var draggables = document.querySelectorAll('.draggable');
	  var dragListItems = document.querySelectorAll('.savedList li');

	  draggables.forEach(draggable => {
	    draggable.addEventListener('dragstart', dragStart);
	  });

	  dragListItems.forEach(item => {
	    item.addEventListener('dragover', dragOver);
	    item.addEventListener('drop', dragDrop);
	    item.addEventListener('dragenter', dragEnter);
	    item.addEventListener('dragleave', dragLeave);
	  });
	}

	function dragStart() {
	  // console.log('Event: ', 'dragstart');
	  dragStartIndex = +this.closest('li').getAttribute('data-index');
	}

	function dragEnter() {
	  // console.log('Event: ', 'dragenter');
	  this.classList.add('over');
	}

	function dragLeave() {
	  // console.log('Event: ', 'dragleave');
	  this.classList.remove('over'); 
	}

	function dragOver(e) {
	  // console.log('Event: ', 'dragover');
	  e.preventDefault();
	}

	function dragDrop() {
	  // console.log('Event: ', 'drop');
	  const dragEndIndex = +this.getAttribute('data-index');
	  var dragWay=dragEndIndex-dragStartIndex;
	  if(dragWay>0){
		  swapUpToDown(dragStartIndex, dragEndIndex);
	  }else if(dragWay<0){
		  swapDownToUp(dragStartIndex, dragEndIndex);
	  }
	  //swapItems(dragStartIndex, dragEndIndex);

	  this.classList.remove('over');
	  var delBtns=document.getElementsByClassName('del_Bt2');
	  var tripnums=document.getElementsByClassName('tripnum');

	  [mapys[dragStartIndex], mapys[dragEndIndex]] = [mapys[dragEndIndex], mapys[dragStartIndex]];
	  [mapxs[dragStartIndex], mapxs[dragEndIndex]] = [mapxs[dragEndIndex], mapxs[dragStartIndex]];
	  [titles[dragStartIndex], titles[dragEndIndex]] = [titles[dragEndIndex], titles[dragStartIndex]];
	  [images[dragStartIndex], images[dragEndIndex]] = [images[dragEndIndex], images[dragStartIndex]];
	  [addrs[dragStartIndex], addrs[dragEndIndex]] = [addrs[dragEndIndex], addrs[dragStartIndex]];
	  [contentids[dragStartIndex], contentids[dragEndIndex]] = [contentids[dragEndIndex], contentids[dragStartIndex]];
	  [contenttypeids[dragStartIndex], contenttypeids[dragEndIndex]] = [contenttypeids[dragEndIndex], contenttypeids[dragStartIndex]];
	  
	  for(var i=0;i<delBtns.length;i++){
		  var tripnum=tripnums[i].firstChild.nodeValue;
		  var delBtn=delBtns[i];
		  delBtn.id=tripnum;
	  }
	  
	  newlist();
	}
	
	//위에서 아래로 움직일 때 
	function swapUpToDown(fromIndex, toIndex){
		var itemOne = listItems[fromIndex].querySelector('.draggable');
		listItems[toIndex].appendChild(itemOne);
		for(var i=fromIndex+1;i<toIndex+1;i++){
			var temp=listItems[i].querySelector('.draggable');
			listItems[i-1].appendChild(temp);
		}
	}
	
	//아래서 위로 움직일 때
	function swapDownToUp(fromIndex, toIndex){
		var itemOne = listItems[fromIndex].querySelector('.draggable');
		listItems[toIndex].appendChild(itemOne);
		for(var i=toIndex;i<fromIndex;i++){
			var temp=listItems[i].querySelector('.draggable');
			listItems[i+1].appendChild(temp);
		}
	}
</script>
</head>
<body id="page-top" onload="show()">
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop" id="modalBtn" style="display:none;"></button>
	
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				 <div class="modal-header">
				 <h5 class="modal-title" id="staticBackdropLabel"></h5>
				</div>
				<div class="modal-body" id="modal-body">
				  ...
	      		</div>
	      		<div class="modal-footer">
		      		<button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeModalBtn">Close</button>
	      		</div>
      		</div>
		</div>
	</div>
	<script>
// 모달 버튼에 이벤트를 건다.
$('#modalBtn').on('click', function(){
$('#staticBackdrop').modal('show');
idClick=false;
});
// 모달 안의 취소 버튼에 이벤트를 건다.
$('#closeModalBtn').on('click', function(){
$('#staticBackdrop').modal('hide');
});

function alertSave(moveUrl){
	Swal.fire({
		  title: '변경된 데이터가 저장되지 않을 수 있습니다!',
		  text: "페이지를 이동하시겠습니까?",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#d33',
		  cancelButtonColor: '#3085d6',
		  confirmButtonText: 'YES'
		}).then((result) => {
		  if (result.isConfirmed) {
		    location.href=moveUrl;
		  }
		});
}

</script>
 <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="subNav">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" onclick="alertSave('index.do')" style="cursor: pointer;">GooPPl</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" onclick="alertSave('createMap.do')">Plan</a></li>
                    <li class="nav-item"><a class="nav-link" onclick="alertSave('placeList.do')">Place</a></li>
                    <li class="nav-item"><a class="nav-link" onclick="alertSave('community.do')">Community</a></li>
                    <c:choose>
						<c:when test="${!empty sessionNickname}">
							<li class="nav-item dropdown dropend">
								  <c:if test="${sessionScope.sessionMemberType=='M' }">
								  <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
								    <label class="bg-primary text-center"
								    	style="
                                        width: 30px;
                                        border-radius: 50%;
                                        color: #fff;
                                        font-weight: 600;
                                        font-size: 1.2rem;">${profileNick}</label>
								  </a>
								  </c:if>
								  <c:if test="${sessionScope.sessionMemberType=='O' }">
									  <a class="nav-link dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
									    <label class="bg-secondary text-center"
									    	style="
	                                        width: 30px;
	                                        border-radius: 50%;
	                                        color: #fff;
	                                        font-weight: 600;
	                                        font-size: 1.2rem;">${profileNick}</label>
									  </a>
								  </c:if>
								<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<li><a class="dropdown-item" onclick="alertSave('mypage.do')">myPage</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" onclick="alertSave('logout.do')">Logout</a></li>
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
    <!-- Signup-->
    <section class="signup-section bg-light" id="signup"
        style="padding-top: 9rem; background: linear-gradient(to bottom, rgb(255 255 255 / 42%) 0%, rgb(207 255 203 / 28%) 75%, white 100%);">
    <div class="container" style="margin-bottom: 40px; margin-top: -60px;">
    	<div class="col-sm-1 col-md-12">
        	<div class="row">
        		<div class="col-md-12">
        			<input type="text" placeholder="여행 제목을 입력해주세요." style="width: 400px;" id="map_title">
        			<select name="people_num" id="people_num">
        				<option value="1">1인</option>
        				<option value="2">2인</option>
        				<option value="4">4인</option>
        				<option value="8">8인</option>
        			</select>
        			<select name="trip_type" id="trip_type">
        				<option value="1">홀로 여행</option>
        				<option value="2">우정 여행</option>
        				<option value="3">커플 여행</option>
        				<option value="4">가족 여행</option>
        			</select>
        			<select name="areacode" id="areacode" onchange="changeAreacode()">
						<c:forEach var="areadto" items="${arealist }">
							<option value="${areadto.areacode}" data-value="${areadto.latitude },${areadto.longitude}">${areadto.areaname }</option>
						</c:forEach>
        			</select>
        			<select name="sigungucode" id="sigungucode">
        				<option value="0">==전체==</option>
						<c:forEach var="sigungudto" items="${sigungulist }">
							<option value="${sigungudto.sigungucode }" class="${sigungudto.areacode }" style="display:none;">${sigungudto.sigungu_name }</option>
						</c:forEach>
        			</select>
        		</div>
        	</div>
        </div>
    </div>
    <div class="container">
    <div class="row">
        <div class="col-sm-1 col-md-12">
        	<div class="row">
		        <div class="col-md-3">
				    <div class="row">
				        <div class="col-md-5">
							<div id="date_nav" style="float:left;">
								<div id="calender" style="border:1px;width: 130px;height:700px;align:center;overflow: auto;">
									<div style="text-align: center;">
										<form>
										Start<br>
										<input type="date" name="startDate" id="startDate" id="startDate" style="width: 110px;height: 21px;" onchange="createDay()" data-date-inline-picker="true"><br>
										End<br>
										<input type="date" name="endDate" id="endDate" id="endDate" style="width: 110px;height: 21px;" onchange="createDay()" data-date-inline-picker="true"><br>
										</form>
									</div>
									<div id="dayBtDiv" align="center" style="margin-top: 20px;">
										<input type="button" value="Please" style="width: 90px; height: 30px; margin-bottom: 10px;">
										<input type="button" value="Choice" style="width: 90px; height: 30px; margin-bottom: 10px;">
										<input type="button" value="Day" style="width: 90px; height: 30px; margin-bottom: 10px;">
									</div>
								</div>
							</div>
				        </div>
				        <div class="col-md-7" >
				        	<div style="height: 665px; overflow: auto;">
				        		<div style="text-align: center;">My Travel</div>
								<ul id="savedList" style="width:100%; font-size: 14px;" class="savedList">
								</ul>
							</div>
							<div style="text-align: center;">
	                       		<button type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 0.5em;" onclick="deleteThisday()" id="del_Bt">Delete</button>
	                       		<button type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 0.5em;" onclick="saveThisDay('${day_num}')" id="save_Bt">Saved</button>
	                    	</div>
				        </div>
				    </div>
		        </div>
		        <div class="col-md-7" style="width: 690px;">
		        	<div id="map" style="width:100%; height:700px;float:right;"></div>
		        </div>
		        <div class="col-md-2" style="text-align: center; width: 300px;">
		        	<select id="cate">
						<option value="12">관광지</option>
						<option value="32">숙박</option>
						<option value="39">음식점</option>
						<option value="38">쇼핑</option>
					</select>
					<div style="height: 4px;"></div>
		        	<input type="text" name="areaCode" id="areaC">
		        	<div class="row">
	                    <div class="col-md-12" style="text-align: center; margin-top: 5px; margin-bottom: 5px;">
	                        <button type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 1.5em;" onclick="show()" id="search_bt">Search</button>
	                    </div>
	                </div>
					<div style="height: 584px; overflow: auto;">
						<table id="setTable" style="width: 100%; text-align: center;">
						</table>
					</div>
					<div>
					<!-- TestCode
					<table>
						<c:forEach var="dto" items="${mapinfolist}">
							<tr>
								<td>${dto.contentid}</td>
							</tr>
						</c:forEach>
					</table>
					 -->
					</div>
		        </div>
		    </div>
        </div>
    </div>
</div>
 <div id="adInfo" style="display:none;">
	<table id="adSite">
		<c:if test="${empty adlist }">
			<tr class="noContent">
				<td colspan="5" align="center">
				등록된 광고가 없습니다.
				</td>
			</tr>
		</c:if>
		<c:forEach var="addto" items="${adlist }">
			<tr>
				<td class="adlist">
					<span class="ad_idx">${addto.owner_idx }</span>
					<span class="adimg" style="cursor: pointer;">${addto.firstimg }</span>
					<span class="adaddr">${addto.addr }</span>
					<span class="adtitle">[AD] ${addto.title }</span>
					<span class="adcontenttype">${addto.contenttype }</span>
					<span class="adareacode">${addto.areacode }</span>
					<span class="adsigungucode">${addto.sigungucode }</span>
					<span class="admapx">${addto.mapx }</span>
					<span class="admapy">${addto.mapy }</span>
					<span class="adoverview">${addto.ad_content }</span>
					<span class="adreadnum">1</span>
					<span class="adhomepage">${addto.business_tel }</span>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
 </section>
<script>

var adContents=[];
var table=document.getElementById('adSite');
var datay_n=document.getElementsByClassName('noContent')[0];
if(datay_n!='undefined'){
	adList=table.getElementsByClassName('adlist');
	for(var i=0;i<adList.length;i++){
		var ad_idx=adList[i].getElementsByClassName('ad_idx')[0].firstChild.nodeValue;
		var adaddr=adList[i].getElementsByClassName('adaddr')[0].firstChild.nodeValue;
		var adimage=adList[i].getElementsByClassName('adimg')[0].firstChild.nodeValue;
		var adtitle=adList[i].getElementsByClassName('adtitle')[0].firstChild.nodeValue;
		var adcontenttype=adList[i].getElementsByClassName('adcontenttype')[0].firstChild.nodeValue;
		var adareacode=adList[i].getElementsByClassName('adareacode')[0].firstChild.nodeValue;
		var adsigungucode=adList[i].getElementsByClassName('adsigungucode')[0].firstChild.nodeValue;
		var adhomepage=adList[i].getElementsByClassName('adhomepage')[0].firstChild.nodeValue;
		var admapx=adList[i].getElementsByClassName('admapx')[0].firstChild.nodeValue;
		var admapy=adList[i].getElementsByClassName('admapy')[0].firstChild.nodeValue;
		var adoverview=adList[i].getElementsByClassName('adoverview')[0].firstChild.nodeValue;
		var adreadnum=adList[i].getElementsByClassName('adreadnum')[0].firstChild.nodeValue;
		var adContent={
			contentid:ad_idx,
			title:adtitle,
			addr:adaddr,
			areacode:adareacode,
			sigungucode:adsigungucode,
			mapx:admapx,
			mapy:admapy,
			overview:adoverview,
			readnum:adreadnum,
			homepage:adhomepage,
			image:adimage,
			contenttype:adcontenttype
		};
		adContents.push(adContent);
	}
}


var setMapx;
var setMapy;
function deleteThisday(){
	Swal.fire({
		title: '일정을 모두 삭제하시겠습니까?',
		  text: '한 번 삭제한 일정은 복구가 불가능합니다!',
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'DELETE'
		}).then((result) => {
		  if (result.isConfirmed) {
			  delThisDayAllInfo();
		  }else { //취소
			return;
		}
	});
}

function delThisDayAllInfo(){
	param='map_idx='+${map_idx}+'&day_num='+${day_num};
	sendRequest('delThisDayAllInfo.do', param, delThisDayAllInfoResult, 'GET');
}
function delThisDayAllInfoResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			if(data>0){
				Swal.fire(
						'일정이 삭제되었습니다!',
						'계속해서 일정을 계획해보세요!',
						'success'
					);
				location.href='existMap.do?map_idx='+${map_idx}+'&day_num='+${day_num};
			}else{
				Swal.fire({
					  icon: 'error',
					  title: '일시적인 오류입니다.',
					  text: '고객센터로 문의해주세요',
					  footer: '<a href="">Why do I have this issue?</a>'
					});
			}
		}
	}
}
document.getElementById('map_title').value='${mapdto.map_title}';
selectedOption('people_num', '${mapdto.people_num}', 'value');
selectedOption('trip_type', '${mapdto.trip_type}', 'value');
function selectedOption(id, value, type){
	var obj=document.getElementById(id);
	for(i=0;i<obj.length;i++){
		switch(type){
		case 'value' : 
			if(obj[i].value==value){
				obj[i].selected=true;
			}
			break;
		case 'text' :
			if(obj[i].text==value){
				obj[i].selected=true;
			}
			break;
		}
	}
}
document.getElementById('startDate').value='${mapdto.startdate}';
document.getElementById('endDate').value='${mapdto.enddate}';
createDay();
//초기 지도 중심좌표 처리 
var setAreacode=${areacode};
var setSigungucode=${sigungucode};
setArea(setAreacode, setSigungucode);
function setArea(areacode, sigungucode){
	var areaSelector=document.getElementById('areacode');
	var optionNodes=areaSelector.getElementsByTagName('option');
	for(var i=0;i<optionNodes.length;i++){
		var optionarea=optionNodes[i].value;
		if(areacode==optionarea){
			optionNodes[i].setAttribute('selected', 'seleted');
			var mapxy=optionNodes[i].getAttribute('data-value');
			var mapxys=mapxy.split(',');
			setMapx=mapxys[1];
			setMapy=mapxys[0];
		}
	}
	var sigunguSelector=document.getElementById('sigungucode');
	var sioptionNodes=sigunguSelector.getElementsByClassName(areacode);
	for(var i=0;i<sioptionNodes.length;i++){
		var sioptionNode=sioptionNodes[i];
		var temp=sioptionNode.value;
		if(temp==sigungucode){
			sioptionNode.style.display='block';
			sioptionNode.setAttribute('selected', 'seleted');
		}else{
			sioptionNode.style.display='block';
		}
	}
}
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(setMapy, setMapx), // 지도의 중심좌표
    level: 8, // 지도의 확대 레벨
    mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
}; 

// 지도를 생성한다 
var map = new kakao.maps.Map(mapContainer, mapOption);

//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
function setMarkers(map) {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(map);
    }            
}
function setLines(map) {
    for (var i = 0; i < drawLines.length; i++) {
    	drawLines[i].setMap(map);
    }
}
// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
function hideMarkers() {
    setMarkers(null);
    listItems.splice(0, listItems.length);
    markers.splice(0, placeDetails.length);
}
function hideLines() {
    setLines(null);
}
var day;
function createDay() {
	var start1 = document.getElementById('startDate').value;
	var end1 = document.getElementById('endDate').value;
	
	var start2 = start1.split("-");         //입력값을 '-'을 기준으로 나누어 배열에 저장해 주는 함수 split
	var end2 = end1.split("-");         //입력값을 '-'을 기준으로 나누어 배열에 저장해 주는 함수 split

	var InputDate_s = new Date(start2[0],start2[1],start2[2]); // 20211110
	var InputDate_e = new Date(end2[0],end2[1],end2[2]);
	
	if((InputDate_e-InputDate_s)/(60*60*24*1000)+1<day){
		Swal.fire({
			  title: '여행 일자가 변경되었습니다!',
			  text: '기존에 저장된 데이터를 잃을 수 있습니다.',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'CHANGE'
			}).then((result) => {
			  if (result.isConfirmed) {
				  day = (InputDate_e-InputDate_s)/(60*60*24*1000)+1;
					
					if(day<=0){
						Swal.fire(
								  '여행 일정을 확인해주세요',
								  '종료일이 시작일보다 빠를 수 없습니다!',
								  'warning'
								);
						document.getElementById('startDate').value='${mapdto.startdate}';
						document.getElementById('endDate').value='${mapdto.enddate}';
						createDay();
					}else{
						
						$("#dayBtDiv").empty();
						
						count=0;
						for(var i=0;i<day;i++){
							count++;
							var dayBt = document.createElement('input');
							dayBt.setAttribute('type','button');
							dayBt.setAttribute('value','Day'+count);
							if(count==${day_num}){
								dayBt.setAttribute('style','width: 90px; height: 30px; margin-bottom: 10px;');
							}else{
								dayBt.setAttribute('style','width: 90px; height: 30px; margin-bottom: 10px;background-color:#64a19d;');
							}
							dayBt.setAttribute('onclick','saveThisDay('+count+')');
							var div = document.getElementById('calender');
							dayBtDiv.appendChild(dayBt);
						}
						var startdate = document.getElementById('startDate').value;
						var enddate = document.getElementById('endDate').value;
						var start2=startdate.split("-"); 
						var end2=enddate.split("-");
						delDateData(start2[0],start2[1],start2[2],end2[0],end2[1],end2[2],day);
					}
			  }else { //취소
				  document.getElementById('startDate').value='${mapdto.startdate}';
				  document.getElementById('endDate').value='${mapdto.enddate}';
				  createDay();
			}
		});
	}else{
		day = (InputDate_e-InputDate_s)/(60*60*24*1000)+1;
		
		if(day<=0){
			Swal.fire(
					  '여행 일정을 확인해주세요',
					  '종료일이 시작일보다 빠를 수 없습니다!',
					  'warning'
					);
			document.getElementById('startDate').value='${mapdto.startdate}';
			document.getElementById('endDate').value='${mapdto.enddate}';
			createDay();
		}else{
			
			$("#dayBtDiv").empty();
			
			count=0;
			for(var i=0;i<day;i++){
				count++;
				var dayBt = document.createElement('input');
				dayBt.setAttribute('type','button');
				dayBt.setAttribute('value','Day'+count);
				if(count==${day_num}){
					dayBt.setAttribute('style','width: 90px; height: 30px; margin-bottom: 10px;');
				}else{
					dayBt.setAttribute('style','width: 90px; height: 30px; margin-bottom: 10px;background-color:#64a19d;');
				}
				dayBt.setAttribute('onclick','saveThisDay('+count+')');
				var div = document.getElementById('calender');
				dayBtDiv.appendChild(dayBt);
			}	
		}
	}
	
}
function delDateData(starty,startm,startd,endy,endm,endd,day){
	var param='map_idx='+${map_idx}+'&starty='+starty+'&startm='+startm+'&startd='+startd+'&endy='+endy+'&endm='+endm+'&endd='+endd+'&day='+day;
	sendRequest('delDateData.do',param,delDateDataResult,'GET');
}
function delDateDataResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			console.log();
			Swal.fire(
					'변경되었습니다!',
					'계속해서 일정을 계획해보세요!',
					'success'
				);
			if(day<${day_num}){
				location.href='existMap.do?map_idx='+${map_idx}+'&day_num=1';
			}
		}
	}
}
function saveThisDay(dayCount){
	
	var text=${tripNum}==0?'나만의 여행 일정을 만들어보세요!':'기존에 저장한 일정은 삭제됩니다.';
	
	Swal.fire({
		  title: '일정을 저장하시겠습니까?',
		  text: text,
		  icon: 'question',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Save'
		}).then((result) => {
		  if (result.isConfirmed) {
			  var map_title=document.getElementById('map_title').value;
			  if(map_title==''){
					Swal.fire(
							  '일정 이름이 무엇인가요?',
							  '여행에 이름을 지어주세요!',
							  'warning'
							);
					return;
				}else if(listItems.length==0){
					Swal.fire(
							  '원하는 여행지를 선택해주세요',
							  '적어도 한 곳은 담아주세요!',
							  'warning'
							);
					return;
				}else if(document.getElementById('endDate').value==''){
					Swal.fire(
							  '여행 날짜를 정해주세요!',
							  '일정은 언제든지 수정 가능합니다',
							  'warning'
							);
					return;
				}else{
					var people_num = document.getElementById('people_num').value;
					var trip_type= document.getElementById('trip_type').value;
					var startdate = document.getElementById('startDate').value;
					var enddate = document.getElementById('endDate').value;
					var start2=startdate.split("-"); 
					var end2=enddate.split("-"); 
					moveToDay(map_title,member_idx,people_num,trip_type,start2[0],start2[1],start2[2],end2[0],end2[1],end2[2],'n','n',dayCount);
				}
		  }else { //취소
			return;
		}
	});
}
function moveToDay(map_title,member_idx,people_num,trip_type,starty,startm,startd,endy,endm,endd,share_ok,del_ok,dayCount){
	moveDay=dayCount;
	var param='map_idx='+${map_idx}+'&day_num='+${day_num}+'&map_title='+map_title+'&member_idx='+member_idx+'&people_num='+people_num+'&trip_type='+trip_type+'&starty='+starty+'&startm='+startm+'&startd='+startd+'&endy='+endy+'&endm='+endm+'&endd='+endd+'&share_ok='+share_ok+'&del_ok='+del_ok;
	sendRequest('changeMap.do', param, getResultMap, 'GET'); 
}
function getResultMap(){
	 if(XHR.readyState==4){
	      if(XHR.status==200){
	         var data = XHR.responseText;
	         map_idx=data;
	         saveMapData(map_idx);
	      }
	 }
	 
}
function saveMapData(map_idx){
	
	var param='map_idx='+map_idx+'&day_num='+${day_num};
	for(var i=0;i<listItems.length;i++){
		var contentid=listItems[i].getElementsByClassName('contentid').item(0).value;
		param+='&';
		param+='contentid='+contentid;
	}
	sendRequest('addMapInfo_newMap.do', param, getResultAdd, 'GET');
}
function getResultAdd(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			console.log(data);
			savePlaceDetailData();
		}
	}
}
function savePlaceDetailData(){
	if(placeDetails.length!=0){
		var param='map_idx='+map_idx;
		var contentid=placeDetails[0].contentid;
		param+='&contentid='+contentid;
		var title=placeDetails[0].title;
		title=encodeURIComponent(title);
		param+='&title='+title;
		var addr=placeDetails[0].addr;
		addr=encodeURIComponent(addr);
		param+='&addr='+addr;
		var areacode=placeDetails[0].areacode;
		param+='&areacode='+areacode;
		var sigungucode=placeDetails[0].sigungucode;
		param+='&sigungucode='+sigungucode;
		var mapx=placeDetails[0].mapx;
		param+='&mapx='+mapx;
		var mapy=placeDetails[0].mapy;
		param+='&mapy='+mapy;
		var overview=placeDetails[0].overview;
		if(overview.length>900){
			overview=overview.substr(0, 900)+'...';
		}
		//overview=encodeURI(decodeURI(overview));
		overview=encodeURIComponent(overview);
		param+='&overview='+overview;
		var readnum=1;
		param+='&readnum='+readnum;
		var homepage=placeDetails[0].homepage;
		//homepage=encodeURI(decodeURI(homepage));
		homepage=encodeURIComponent(homepage);
		param+='&homepage='+homepage;
		var firstimage=placeDetails[0].firstimage;
		firstimage=encodeURI(firstimage);
		param+='&firstimage='+firstimage;
		console.log(param);
		sendRequest('savePlaceDetail.do', param, getResultAdd2, 'POST');
	}else{
		location.href='existMap.do?map_idx='+map_idx+'&day_num='+moveDay;
	}
	
}
function getResultAdd2(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			console.log(data);
			placeDetails.splice(0,1);
			if(placeDetails.length!=0){
				savePlaceDetailData();
			}else{
				Swal.fire(
						'저장되었습니다',
						'다음 일정도 계획해보세요!',
						'success'
					);
					setTimeout(function() {
						location.href='existMap.do?map_idx='+map_idx+'&day_num='+moveDay;
					}, 500);
			}
		}
	}
}
</script>
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
	<%@include file="/WEB-INF/views/member/faq.jsp" %>
	<footer class="footer bg-light small text-center">
		<div class="container px-4 px-lg-5">Copyright &copy; Ezen&Team1 2021</div>
	</footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="resource/js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>