<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="" />
<meta name="author" content="" />
<title>일정만들기</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/gooppl/resource/css/styles.css" rel="stylesheet" /> 
   <!-- <link href="css/bootstrap.min.css" rel="stylesheet"/> -->
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
table{
	font-family: "Varela Round", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    font-size: 80%;
}

.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
</style>
<script src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=b8cc8a9140ffda30a4356a4ac796f64b&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="/gooppl/resource/js/httpRequest.js"></script>


<script src="//code.jquery.com/jquery.min.js"></script>
<script>
/**관광데이터 테이블 초기화 제이쿼리*/
$(function () {
    $('#search_bt').click( function() {
        $('#setTable').empty();
    });
});
$(function () {
    $('#del_Bt').click( function() {
        $('#listTable td').empty();
        hideLines();
        latly.splice(0, latly.length);
        drawLines.splice(0, drawLines.length);
		markers.splice(0, markers.length);
        mapys.splice(0, mapys.length);
        mapxs.splice(0, mapxs.length);
        titles.splice(0, titles.length);
        images.splice(0, images.length);
        addrs.splice(0, addrs.length);  
        count2 = 0;
    });
});
/**동적으로 생성된 태그에 접근하는 방법*/
$(function() {
	$(document).on("click",".del_Bt2",function(){
        var click_id = $(this).attr('id');
        $('#listTable td').empty();
        hideMarkers();
        hideLines();
 
        latly.splice(click_id, 1);
        drawLines.splice(click_id-1, 1);
		markers.splice(click_id, 1);
        mapys.splice(click_id, 1);
        mapxs.splice(click_id, 1);
        titles.splice(click_id, 1);
        images.splice(click_id, 1);
        addrs.splice(click_id, 1);    
        
        
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
	    	
	        var distance;
	        	
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
			
	        
		    var table = document.getElementById('listTable');
		    
		    var trNode = document.createElement('tr');
		    trNode.id=i; 
		 
		    var tdNode = document.createElement('td');
		    tdNode.className='listnum';
		    var tdTextNode = document.createTextNode(i);
		    var tdNode2 = document.createElement('td');
		    var tdTextNode2 = document.createTextNode(titles[i]);

		    var tdNode4 = document.createElement('td');
		   
		    var imgNode = document.createElement('img');
		    imgNode.setAttribute('src', images[i]);
		    imgNode.setAttribute('style', 'width: 80px; height: 80px;');
		 
		    var tdNode5 = document.createElement('td');
		    var addBt = document.createElement('input');
		    addBt.setAttribute('type','button');
		    addBt.className='del_Bt2';
		    addBt.id=i;

		    addBt.setAttribute('value','-');
		    
		    table.appendChild(trNode);
		    trNode.appendChild(tdNode);
		    trNode.appendChild(tdNode2);

		    trNode.appendChild(tdNode4);
		    trNode.appendChild(tdNode5);
		    tdNode.appendChild(tdTextNode);
		    tdNode2.appendChild(tdTextNode2);

		    tdNode4.appendChild(imgNode);
		    tdNode5.appendChild(addBt);
		}
        count2--;
    });
});
</script>

<script>
/**데이터 검색 테이블 생성*/
function show(){
   var url='http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword'; /*URL*/
   var param = 'serviceKey=fX3lnf27RmPng52xVKCEdpQCWJLVPWN%2Fz4fBH0k1vtwxf%2BhoF9j%2Fvu5ZuJ%2FgYC5FK2AETjgxz0eeSMWThJbCYw%3D%3D&MobileApp=AppTest&MobileOS=ETC&pageNo=1&numOfRows=1000&listYN=Y&arrange=O&contentTypeId='+document.getElementById('cate').value+'&keyword='+document.getElementById('areaC').value;
   sendRequest(url, param, showResult, 'GET');
}
function showResult(){
   if(XHR.readyState==4){
      if(XHR.status==200){
         var doc = XHR.responseXML;
         
         var items = doc.getElementsByTagName('item');
         var table = document.getElementById('setTable');
         //table.setAttribute('style','width: 20%; float: left;');
         for(var i=0;i<items.length;i++){
            var item = items[i];
            var count=i+1;
            var title = item.getElementsByTagName('title').item(0).firstChild.nodeValue;
            var addr = item.getElementsByTagName('addr1').item(0).firstChild.nodeValue;
			var mapx = item.getElementsByTagName('mapx').item(0).firstChild.nodeValue;
			var mapy = item.getElementsByTagName('mapy').item(0).firstChild.nodeValue;
			var contentid = item.getElementsByTagName('contentid').item(0).firstChild.nodeValue;
           
            var image;
            
            if(item.getElementsByTagName('firstimage').length==0){
               image='img/noimage.png';
            }else{
               image=item.getElementsByTagName('firstimage').item(0).firstChild.nodeValue;
            }
 
            var trNode = document.createElement('tr');
//            var tdNode = document.createElement('td');
//            var tdTextNode = document.createTextNode(count+'번 결과');
            var tdNode2 = document.createElement('td');
            var tdTextNode2 = document.createTextNode(title);
            var tdNode3 = document.createElement('td');
            var tdTextNode3 = document.createTextNode(addr);
            var tdNode4 = document.createElement('td');
           
            var imgNode = document.createElement('img');
            imgNode.setAttribute('src', image);
            imgNode.setAttribute('style', 'width: 80px; height: 80px;');
         
            var tdNode5 = document.createElement('td');
            var addBt = document.createElement('input');
            addBt.setAttribute('type','button');
            addBt.setAttribute('value','+');
            addBt.setAttribute('onclick','makeMarker('+mapy+','+mapx+',"'+title+'","'+image+'","'+addr+'","'+contentid+'")');
            
            table.appendChild(trNode);
 //           trNode.appendChild(tdNode);
            trNode.appendChild(tdNode2);
            trNode.appendChild(tdNode3);
            trNode.appendChild(tdNode4);
            trNode.appendChild(tdNode5);
//            tdNode.appendChild(tdTextNode);
            tdNode2.appendChild(tdTextNode2);
            tdNode3.appendChild(tdTextNode3);
            tdNode4.appendChild(imgNode);
            tdNode5.appendChild(addBt);
         }
         
      }
   }
}

var markers = [];
var latly = [];
var drawLines = [];
var count2 = 0;

var mapys = [];
var mapxs = [];
var titles = [];
var images = [];
var addrs = [];
/**추가 버튼 누른후 마커생성*/
function makeMarker(mapy, mapx, title, image, addr, contentid){
	//alert(mapy+'\n'+mapx+'\n'+title+'\n'+image);
	
    // 결과값으로 받은 위치를 마커로 표시합니다
  
    mapys.push(mapy);
    mapxs.push(mapx);
    titles.push(title);
    images.push(image);
    addrs.push(addr);
    

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
    
	var table = document.getElementById('listTable');
	var str=table.innerHTML;
    
     str+='<tr id="'+count2+'"><td>'+title+'</td>';
     str+='<td><img src="'+image+'" style="width: 80px; height:80px;"></td>';
     str+='<td><input type="button" class="del_Bt2" id="'+count2+'" value="-"></td></tr>';
       
    table.innerHTML=str;
     
    count2++;
}



</script>

</head>
<body id="page-top">
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
        			<input type="text" placeholder="여행 제목을 입력해주세요." style="width: 400px;">
        			<select>
        				<option>1인</option>
        				<option>2인</option>
        				<option>4인</option>
        				<option>8인</option>
        			</select>
        			<select>
        				<option>홀로 여행</option>
        				<option>커플 여행</option>
        				<option>가족 여행</option>
        			</select>
        			<select>
        				<option>서울 특별시</option>
        				<option>인천</option>
        				<option>대구</option>
        			</select>
        			<select>
        				<option>은평구</option>
        				<option>마포구</option>
        				<option>서대문구</option>
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
										<input type="date" name="startDate" id="startDate" id="startDate" style="width: 110px;" onchange="createDay()"><br>
										종료일<br>
										<input type="date" name="endDate" id="endDate" id="endDate" style="width: 110px;" onchange="createDay()"><br>
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
								<table id="listTable" align="center" style="width: 100%; text-align: center;">
									<tr>
										<th colspan="5">선택목록</th>
									</tr>
								</table>
							</div>
							<div style="text-align: center;">
	                       		<button type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 1.5em;" onclick="hideMarkers()" id="del_Bt">전체삭제</button>
	                    	</div>
				        </div>
				    </div>
		        </div>
		        <div class="col-md-7">
		        	<div id="map" style="width:100%; height:700px;float:right;"></div>
		        </div>
		        <div class="col-md-2" style="text-align: center;">
		        	<select id="cate">
						<option value="12">관광지</option>
						<option value="32">숙박</option>
						<option value="39">음식점</option>
						<option value="38">쇼핑</option>
					</select>
		        	<input type="text" name="areaCode" id="areaC">
		        	<div class="row">
	                    <div class="col-md-12" style="text-align: center; margin-top: 5px; margin-bottom: 5px;">
	                        <button type="button" class="btn btn-primary btn-sm" style="padding: 0.5rem 1.5em;" onclick="show()" id="search_bt">여행지 검색</button>
	                    </div>
	                </div>
					<div style="height: 626px; overflow: auto;">
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
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(37.56728, 126.98003), // 지도의 중심좌표
    level: 10, // 지도의 확대 레벨
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
	
	$("#dayBtDiv").empty();
	
	count=0;
	for(var i=0;i<day;i++){
		count++;
		var dayBt = document.createElement('input');
		dayBt.setAttribute('type','button');
		dayBt.setAttribute('value','Day'+count);
		dayBt.setAttribute('style','width: 90px; height: 30px; margin-bottom: 10px;');
		var div = document.getElementById('calender');
		dayBtDiv.appendChild(dayBt);
	}
}
	document.getElementById('startDate').value = new Date().toISOString().substring(0, 10);
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
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

</body>
</html>