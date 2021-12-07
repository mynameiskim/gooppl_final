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
var setAreacode;
var setSigungucode;
var setContenttype;
var map_idx;
var moveDay;

var adContents=[];
<c:if test="${empty adlist }">
	console.log('없음.');
</c:if>
<c:forEach var="addto" items="${adlist }">
	var ad_idx=${addto.owner_idx };
	var adtitle='[AD] ${addto.title }';
	var adaddr='${addto.addr }';
	var adareacode=${addto.areacode };
	var adsigungucode=${addto.sigungucode };
	var admapx=${addto.mapx };
	var admapy=${addto.mapy };
	var adoverview='${addto.ad_content }';
	var adreadnum=1;
	var adhomepage='${addto.business_tel }';
	var adimg='${addto.firstimg }';
	var adcontenttype=${addto.contenttype };
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
		image:adimg,
		contenttype:adcontenttype
	};
	adContents.push(adContent);
</c:forEach>
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
        listItems.splice(click_id, 1);        
        
    	for(var i=0; i<mapys.length; i++){
    		
    	   	var marker = new kakao.maps.Marker({
    	        position: new kakao.maps.LatLng(mapys[i], mapxs[i])
    	    });
    	    
    	    var xy = {
    	   		position: new kakao.maps.LatLng(mapys[i], mapxs[i])
    	    }
    	    
    	    latly[i]= xy.position;

    	    // 인포윈도우로 장소에 대한 설명을 표시합니다
    	    var infowindow = new kakao.maps.InfoWindow({
    	        content: '<table border="1"; width=250px; height=120px;><tr><th style="background-color: pink;" colspan="2">'+titles[i]+'</th></tr>'+'<tr><td><img src="'+images[i]+'" style="width: 100px; height: 100px;"></td><td>'+addrs[i]+'</td></tr></table>'
    	    });
    	    
    	    // 이동할 위도 경도 위치를 생성합니다 
    	    var moveLatLon = new kakao.maps.LatLng(mapys[i], mapxs[i]);
    	   
    	    // 지도 중심을 부드럽게 이동시킵니다
    	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    	    map.panTo(moveLatLon);
    	    
    	    markers[i] = marker;
    	    
    	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    	    
    	    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
    	    kakao.maps.event.addListener(marker, 'click', function() {
    	   	 closeOverlay();
    	        overlay.setMap(map);
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
            
    		var drawLine = new daum.maps.Polyline({
    		    path : linePath,
    		    strokeWeight : 3, // 선의 두께입니다 
    		    strokeColor : '#db4040', // 선의 색깔입니다
    		    strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
    		    strokeStyle : 'solid' // 선의 스타일입니다
    		});

            drawLines[i] = drawLine;
            drawLine.setMap(map);
            
    	    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
    	    function makeOverListener(map, marker, infowindow) {
    	        return function() {
    	            infowindow.open(map, marker);
    	        };
    	    }
    		
    	    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    	    function makeOutListener(infowindow) {
    	        return function() {
    	            infowindow.close();
    	        };
    	    }

    	    // 마커를 지도에 표시합니다.
    		marker.setMap(map);
    	       
    	    
    	    /*
     		var savedList = document.getElementById('savedList');
    		var listitem = savedList.innerHTML;

    	    listitem+= '<li class="listName" id="li"'+i+'" data-index="'+i+'">';
    		    listitem+= '<span class="tripnum" style="vertical-align:middle;text-align:center;">'+i+'</span>';
    		    listitem+= '<div class="draggable" draggable="true">';
    			    listitem+= '<p class="placeinfo" style="display:inline;">';
    				    listitem+= '<img src="'+images[i]+'" style="width: 80px; height: 80px;">';
    				    listitem+= '<span class="tripdis" style="word-break: break-all;display:inline-block; vertical-align: top;">'+titles[i]+'</span>';
    			    listitem+= '</p>';
    			    listitem+= '<input type="button" id="'+i+'" class="del_Bt2" value="-">';
    			    listitem+= '<input type="hidden" name="cotentid" value="'+contentids[i]+'" class="contentid">';
    		    listitem+= '</div>';
    	    listitem+= '</li>';
    	    
    		savedList.innerHTML=listitem;

    	    */
    	    
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
        
        /**
        latly.splice(0, latly.length);
        drawLines.splice(0, drawLines.length);
		markers.splice(0, markers.length);
        mapys.splice(0, mapys.length);
        mapxs.splice(0, mapxs.length);
        titles.splice(0, titles.length);
        images.splice(0, images.length);
        addrs.splice(0, addrs.length);
        contentids.splice(0, contentids.length);
        */
        
    	for(var i=0; i<mapys.length; i++){
    		
    	   	var marker = new kakao.maps.Marker({
    	        position: new kakao.maps.LatLng(mapys[i], mapxs[i])
    	    });
    	    
    	    var xy = {
    	   		position: new kakao.maps.LatLng(mapys[i], mapxs[i])
    	    }
    	    
    	    latly[i]= xy.position;

    	    // 인포윈도우로 장소에 대한 설명을 표시합니다
    	    var infowindow = new kakao.maps.InfoWindow({
    	        content: '<table border="1"; width=250px; height=120px;><tr><th style="background-color: pink;" colspan="2">'+titles[i]+'</th></tr>'+'<tr><td><img src="'+images[i]+'" style="width: 100px; height: 100px;"></td><td>'+addrs[i]+'</td></tr></table>'
    	    });
    	    
    	    // 이동할 위도 경도 위치를 생성합니다 
    	    var moveLatLon = new kakao.maps.LatLng(mapys[i], mapxs[i]);
    	   
    	    // 지도 중심을 부드럽게 이동시킵니다
    	    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    	    map.panTo(moveLatLon);
    	    
    	    markers[i] = marker;
    	    
    	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    	    
    	    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
    	    kakao.maps.event.addListener(marker, 'click', function() {
    	   	 closeOverlay();
    	        overlay.setMap(map);
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
            
    		var drawLine = new daum.maps.Polyline({
    		    path : linePath,
    		    strokeWeight : 3, // 선의 두께입니다 
    		    strokeColor : '#db4040', // 선의 색깔입니다
    		    strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
    		    strokeStyle : 'solid' // 선의 스타일입니다
    		});

            drawLines[i] = drawLine;
            drawLine.setMap(map);
            
    	    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
    	    function makeOverListener(map, marker, infowindow) {
    	        return function() {
    	            infowindow.open(map, marker);
    	        };
    	    }
    		
    	    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    	    function makeOutListener(infowindow) {
    	        return function() {
    	            infowindow.close();
    	        };
    	    }

    	    // 마커를 지도에 표시합니다.
    		marker.setMap(map);
    	       
    	    
    	    /*
    		var savedList = document.getElementById('savedList');
    		var listitem = savedList.innerHTML;

    	    listitem+= '<li class="listName" id="li"'+i+'" data-index="'+i+'">';
    		    listitem+= '<span class="tripnum" style="vertical-align:middle;text-align:center;">'+i+'</span>';
    		    listitem+= '<div class="draggable" draggable="true">';
    			    listitem+= '<p class="placeinfo" style="display:inline;">';
    				    listitem+= '<img src="'+images[i]+'" style="width: 80px; height: 80px;">';
    				    listitem+= '<span class="tripdis" style="word-break: break-all;display:inline-block; vertical-align: top;">'+titles[i]+'</span>';
    			    listitem+= '</p>';
    			    listitem+= '<input type="button" id="'+i+'" class="del_Bt2" value="-">';
    			    listitem+= '<input type="hidden" name="cotentid" value="'+contentids[i]+'" class="contentid">';
    		    listitem+= '</div>';
    	    listitem+= '</li>';
    	    
    		savedList.innerHTML=listitem;

    	    */
    	    
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
		var param = 'ServiceKey=fX3lnf27RmPng52xVKCEdpQCWJLVPWN%2Fz4fBH0k1vtwxf%2BhoF9j%2Fvu5ZuJ%2FgYC5FK2AETjgxz0eeSMWThJbCYw%3D%3D&contentTypeId='+document.getElementById('cate').value+'&areaCode='+areacode+'&sigunguCode='+sigungucode+'&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=O&numOfRows=100&pageNo=1';
		sendRequest(url, param, showResult, 'GET');   
	}else{
		var url='http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword'; /*URL*/
		var param = 'serviceKey=fX3lnf27RmPng52xVKCEdpQCWJLVPWN%2Fz4fBH0k1vtwxf%2BhoF9j%2Fvu5ZuJ%2FgYC5FK2AETjgxz0eeSMWThJbCYw%3D%3D&MobileApp=AppTest&MobileOS=ETC&pageNo=1&numOfRows=1000&listYN=Y&arrange=O&contentTypeId='+contenttype+'&areaCode='+areacode+'&sigunguCode='+sigungucode+'&keyword='+document.getElementById('areaC').value;
		sendRequest(url, param, showResult, 'GET');   
	}
}
function showResult(){
   if(XHR.readyState==4){
      if(XHR.status==200){
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
      					
      					var trNode = document.createElement('tr');
      		             var tdNode2 = document.createElement('td');
      		             var tdTextNode2 = document.createTextNode(title);
      		             var tdNode3 = document.createElement('td');
      		             var tdTextNode3 = document.createTextNode(addr);
      		             var tdNode4 = document.createElement('td');
      		            
      		             var imgNode = document.createElement('img');
      		             imgNode.setAttribute('src', image);
      		             imgNode.setAttribute('style', 'width: 90px; height: 90px; border-radius: 8px;');
      		          
      		             var tdNode5 = document.createElement('td');
      		             var addBt = document.createElement('input');
      		             addBt.setAttribute('type','button');
      		             addBt.setAttribute('value','+');
      		             addBt.setAttribute('onclick','makeMarker('+contentid+','+mapy+','+mapx+',"'+title+'","'+image+'","'+addr+'")');
      		             table.appendChild(trNode);
      		             trNode.appendChild(tdNode2);
      		             trNode.appendChild(tdNode3);
      		             trNode.appendChild(tdNode4);
      		             trNode.appendChild(tdNode5);
      		             tdNode2.appendChild(tdTextNode2);
      		             tdNode3.appendChild(tdTextNode3);
      		             tdNode4.appendChild(imgNode);
      		             tdNode5.appendChild(addBt);
      		             console.log(trNode);
      				}
      			}else{
      				if(adContents[i].contenttype==setContenttype && adContents[i].areacode==setAreacode && adContents[i].sigungucode==setSigungucode){
      					var title=adContents[i].title;
      					var contentid=adContents[i].contentid;
      					var addr=adContents[i].addr;
      					var image=adContents[i].image;
      					var mapx=adContents[i].mapx;
      					var mapy=adContents[i].mapy;
      					
      					var trNode = document.createElement('tr');
      		             var tdNode2 = document.createElement('td');
      		             var tdTextNode2 = document.createTextNode(title);
      		             var tdNode3 = document.createElement('td');
      		             var tdTextNode3 = document.createTextNode(addr);
      		             var tdNode4 = document.createElement('td');
      		            
      		             var imgNode = document.createElement('img');
      		             imgNode.setAttribute('src', image);
      		             imgNode.setAttribute('style', 'width: 90px; height: 90px; border-radius: 8px;');
      		          
      		             var tdNode5 = document.createElement('td');
      		             var addBt = document.createElement('input');
      		             addBt.setAttribute('type','button');
      		             addBt.setAttribute('value','+');
      		             addBt.setAttribute('onclick','makeMarker('+contentid+','+mapy+','+mapx+',"'+title+'","'+image+'","'+addr+'")');
      		             
      		             table.appendChild(trNode);
      		             trNode.appendChild(tdNode2);
      		             trNode.appendChild(tdNode3);
      		             trNode.appendChild(tdNode4);
      		             trNode.appendChild(tdNode5);
      		             tdNode2.appendChild(tdTextNode2);
      		             tdNode3.appendChild(tdTextNode3);
      		             tdNode4.appendChild(imgNode);
      		             tdNode5.appendChild(addBt);
      		             
      		             
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
  
             var trNode = document.createElement('tr');
             if(mapx==0||mapy==0){
             	trNode.setAttribute('style', 'display:none;');
             }
             var tdNode2 = document.createElement('td');
             var tdTextNode2 = document.createTextNode(title);
             var tdNode3 = document.createElement('td');
             var tdTextNode3 = document.createTextNode(addr);
             var tdNode4 = document.createElement('td');
            
             var imgNode = document.createElement('img');
             imgNode.setAttribute('src', image);
             imgNode.setAttribute('style', 'width: 90px; height: 90px; border-radius: 8px; ');
          
             var tdNode5 = document.createElement('td');
             var addBt = document.createElement('input');
             addBt.setAttribute('type','button');
             addBt.setAttribute('value','+');
             addBt.setAttribute('onclick','makeMarker('+contentid+','+mapy+','+mapx+',"'+title+'","'+image+'","'+addr+'")');
             addBt.className = 'add_Bt';
             
             table.appendChild(trNode);
             trNode.appendChild(tdNode2);
             trNode.appendChild(tdNode3);
             trNode.appendChild(tdNode4);
             trNode.appendChild(tdNode5);
             tdNode2.appendChild(tdTextNode2);
             tdNode3.appendChild(tdTextNode3);
             tdNode4.appendChild(imgNode);
             tdNode5.appendChild(addBt);
          }
         
      }
   }
}

function placeDetailInfo(contentid){
	if(contentid<1000){
		saveAdDetail(contentid);
	}else{
		var url='http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon'; /*URL*/
		var param='serviceKey=fX3lnf27RmPng52xVKCEdpQCWJLVPWN%2Fz4fBH0k1vtwxf%2BhoF9j%2Fvu5ZuJ%2FgYC5FK2AETjgxz0eeSMWThJbCYw%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&contentId='+contentid+'&defaultYN=Y&firstImageYN=Y&areacodeYN=Y&catcodeYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y';
		sendRequest(url, param, getResult, 'GET'); 
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
	        	 	firstimage:firstimage,
	        	 };
	        	 placeDetails.push(placeDetail);
	         }
	      }
	 }
}

function saveAdDetail(contentid){
	for(var i=0;i<adContents.length;i++){
		if(adContents[i].contentid==contentid){
			var title=adContents[i].title.substr(5, adContents[i].title.length);
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
		     	 	firstimage:image,
		     	 };
			 console.log(placeDetail);
	     	 placeDetails.push(placeDetail);
		}
	}
}
var count2 = 0;
var listItems=[];
var placeDetails=[];

var markers = [];
var latly = [];
var drawLines = [];
var mapys = [];
var mapxs = [];
var titles = [];
var images = [];
var addrs = [];
var contentids = [];


  
/**추가 버튼 누른후 마커생성*/
function makeMarker(contentid, mapy, mapx, title, image, addr){
	placeDetailInfo(contentid);
	
    mapys.push(mapy);
    mapxs.push(mapx);
    titles.push(title);
    images.push(image);
    addrs.push(addr);
    contentids.push(contentid);
	
    // 결과값으로 받은 위치를 마커로 표시합니다
  
   	var marker = new kakao.maps.Marker({
        position: new kakao.maps.LatLng(mapy, mapx)
    });
    
    var xy = {
   		position: new kakao.maps.LatLng(mapy, mapx)
    }
    
    latly.push(xy.position);
    
    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<table border="1"; width=250px; height=120px;><tr><th style="background-color: pink;" colspan="2">'+title+'</th></tr>'+'<tr><td><img src="'+image+'" style="width: 100px; height: 100px;"></td><td>'+addr+'</td></tr></table>'
    });
    
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(mapy, mapx);
    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);
    
    markers.push(marker);
    
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
    
    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
    kakao.maps.event.addListener(marker, 'click', function() {
   	 closeOverlay();
        overlay.setMap(map);
    });
    
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
 
	var drawLine = new daum.maps.Polyline({
	    path : linePath,
	    strokeWeight : 3, // 선의 두께입니다 
	    strokeColor : '#db4040', // 선의 색깔입니다
	    strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
	    strokeStyle : 'solid' // 선의 스타일입니다
	});

    drawLines.push(drawLine);
    drawLine.setMap(map);
    
    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
    function makeOverListener(map, marker, infowindow) {
        return function() {
            infowindow.open(map, marker);
        };
    }

    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
    function makeOutListener(infowindow) {
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
    imgNode.setAttribute('src', image);
    imgNode.setAttribute('style', 'width: 80px; height: 80px; border-radius: 8px;');
    imgNode.setAttribute('hover', '');
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
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="subNav">
        <div class="container px-4 px-lg-5">
            <a class="navbar-brand" href="#page-top">GooPPl</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="#">Plan</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Community</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">MyPage</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">LogIn</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Signup-->
    <section class="signup-section bg-light" id="signup"
        style="padding-top: 10rem; background: linear-gradient(to bottom, rgb(255 255 255 / 42%) 0%, rgb(207 255 203 / 28%) 75%, #f6f2f2 100%);">
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
										시작일<br>
										<input type="date" name="startDate" id="startDate" id="startDate" style="width: 110px;height: 21px;" onchange="createDay()"><br>
										종료일<br>
										<input type="date" name="endDate" id="endDate" id="endDate" style="width: 110px;height: 21px;" onchange="createDay()"><br>
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
				        		<div style="text-align: center;">추가한 여행지</div>
								<ul id="savedList" style="width:100%;" class="savedList">
								</ul>
							</div>
							<div style="text-align: center;">
	                       		<button type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 0.5em;" onclick="hideMarkers()" id="del_Bt">전체삭제</button>
	                       		<button type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 0.5em;" onclick="saveAll()" id="save_Bt">저장하기</button>
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
	                        <button type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 1.5em;" onclick="show()" id="search_bt">여행지 검색</button>
	                    </div>
	                </div>
					<div style="height: 584px; overflow: auto;">
						<table id="setTable" style="width: 100%; text-align: center;">
							<tr>
								<th colspan="5">여행지를 검색해 주세요</th>
							</tr>
						</table>
					</div>
		        </div>
		    </div>
        </div>
    </div>
</div>
 </section>
<script>
var setMapx;
var setMapy;
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
    placeDetails.splice(0, placeDetails.length);
    markers.splice(0, placeDetails.length);
}
function hideLines() {
    setLines(null);
}
function createDay() {
	var start1 = document.getElementById('startDate').value;
	var end1 = document.getElementById('endDate').value;
	
	var start2 = start1.split("-");         //입력값을 '-'을 기준으로 나누어 배열에 저장해 주는 함수 split
	var end2 = end1.split("-");         //입력값을 '-'을 기준으로 나누어 배열에 저장해 주는 함수 split

	var InputDate_s = new Date(start2[0],start2[1],start2[2]); // 20211110
	var InputDate_e = new Date(end2[0],end2[1],end2[2]);
	
	var day = (InputDate_e-InputDate_s)/(60*60*24*1000)+1;
	
	if(day<=0){
		window.alert('여행 종료일이 여행 시작일보다 빠를 수 없습니다.');
		document.getElementById('endDate').value='';
	}else{
		$("#dayBtDiv").empty();
		
		count=0;
		for(var i=0;i<day;i++){
			count++;
			var dayBt = document.createElement('input');
			dayBt.setAttribute('type','button');
			dayBt.setAttribute('value','Day'+count);
			dayBt.setAttribute('style','width: 90px; height: 30px; margin-bottom: 10px;');
			dayBt.setAttribute('onclick','saveThisDay('+count+')');
			var div = document.getElementById('calender');
			dayBtDiv.appendChild(dayBt);
		}	
	}
}
	document.getElementById('startDate').value = new Date().toISOString().substring(0, 10);

function saveThisDay(dayCount){
	if (confirm("일정을 저장하시겠습니까?") == true) { //확인
		var map_title=document.getElementById('map_title').value;
		if(map_title==''){
			window.alert('일정 제목을 입력해주세요.');
			return;
		}else if(listItems.length==0){
			window.alert('일정을 선택해주세요.');
			return;
		}else if(document.getElementById('endDate').value==''){
			window.alert('여행 기간을 다시 확인해주세요.');
		}else{
			var people_num = document.getElementById('people_num').value;
			var trip_type= document.getElementById('trip_type').value;
			var startdate = document.getElementById('startDate').value;
			var enddate = document.getElementById('endDate').value;
			var start2=startdate.split("-"); 
			var end2=enddate.split("-"); 
			moveToDay(map_title,member_idx,people_num,trip_type,start2[0],start2[1],start2[2],end2[0],end2[1],end2[2],'n','n',dayCount);
		}
	} else { //취소
		return;
	}
}
function moveToDay(map_title,member_idx,people_num,trip_type,starty,startm,startd,endy,endm,endd,share_ok,del_ok,dayCount){
	moveDay=dayCount;
	var param='map_title='+map_title+'&member_idx='+member_idx+'&people_num='+people_num+'&trip_type='+trip_type+'&starty='+starty+'&startm='+startm+'&startd='+startd+'&endy='+endy+'&endm='+endm+'&endd='+endd+'&share_ok='+share_ok+'&del_ok='+del_ok;
	sendRequest('addNewMap.do', param, getResultMap, 'GET'); 
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
	
	var param='map_idx='+map_idx+'&day_num='+1;
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
	var param='map_idx='+map_idx;
	var contentid=placeDetails[0].contentid;
	param+='&contentid='+contentid;
	var title=placeDetails[0].title;
	param+='&title='+title;
	var addr=placeDetails[0].addr;
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
	overview=encodeURI(decodeURI(overview));
	param+='&overview='+overview;
	var readnum=1;
	param+='&readnum='+readnum;
	var homepage=placeDetails[0].homepage;
	homepage=encodeURI(decodeURI(homepage));
	param+='&homepage='+homepage;
	var firstimage=placeDetails[0].firstimage;
	param+='&firstimage='+firstimage;
	console.log(param);
	sendRequest('savePlaceDetail.do', param, getResultAdd2, 'GET');
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
				location.href='existMap.do?map_idx='+map_idx+'&day_num='+1;
			}
		}
	}
}
</script>
    <!-- Contact-->
    <section class="contact-section bg-primary align-items-center">
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-md-center">
                <div class="col-md-3 mb-3 mb-md-0" style="padding:0px 10px">
                    <div class="card py-1 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-map-marked-alt text-primary mb-2"></i>
                            <h4 class="text-uppercase m-0">Address</h4>
                            <hr class="my-4 mx-auto" />
                            <div class="small text-black-50">은평구 동서로 101-2</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3 mb-md-0" style="padding:0px 10px">
                    <div class="card py-1 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-envelope text-primary mb-2"></i>
                            <h4 class="text-uppercase m-0">Email</h4>
                            <hr class="my-4 mx-auto" />
                            <div class="small text-black-50"><a href="#">hello@yourdomain.com</a></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 mb-3 mb-md-0" style="padding:0px 10px">
                    <div class="card py-1 h-100">
                        <div class="card-body text-center">
                            <i class="fas fa-mobile-alt text-primary mb-2"></i>
                            <h4 class="text-uppercase m-0">FAQ</h4>
                            <hr class="my-4 mx-auto" />
                            <div class="small text-black-50"><a href="#">문의하기</a></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="social d-flex justify-content-center">
                <a class="mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                <a class="mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                <a class="mx-2" href="#!"><i class="fab fa-github"></i></a>
            </div>
        </div>
    </section>
    <footer class="footer bg-primary small text-center text-white-50">
        <div class="container px-4 px-lg-5">Copyright &copy; Your Website 2021</div>
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