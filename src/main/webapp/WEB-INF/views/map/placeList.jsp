<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지 데이터 게시판</title>
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
    align: center;
}
</style>
</head>
<link href="resource/css/styles.css" rel="stylesheet" />
<link href="resource/css/bootstrap.min.css" rel="stylesheet" />
<script src="resource/js/httpRequest.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
var cp;
var viewContents=[];
var setAreacode;
var setSigungucode;
var setContenttype;
var contentids=[];
var images=[];
var addrs=[];
var titles=[];
var paramAreacodes=[];
var paramSigungucodes=[];
var addContents=[];

function show(){
	$('#viewTable').empty();
	contentids.splice(0, contentids.length);
	images.splice(0, images.length);
	addrs.splice(0, addrs.length);
	titles.splice(0, titles.length);
	var sigungucode=document.getElementById('sigungucode').value;
	setContenttype=document.getElementById('contenttype').value;
	setAreacode=document.getElementById('areacode').value;
	setSigungucode=sigungucode==''?'':sigungucode;
	var sigunguList = document.getElementsByClassName(setAreacode);
	for(var i=0;i<sigunguList.length;i++){
		var sigungu=sigunguList[i];
		sigungu.style.display='block';
	}
	if(addContents.length!=0){
		for(var i=0;i<addContents.length;i++){
			if(setSigungucode==''){
				if(addContents[i].contenttype==setContenttype && addContents[i].areacode==setAreacode){
					contentids.push(addContents[i].contentid);
					addrs.push(addContents[i].addr);
					images.push(addContents[i].image);
					titles.push(addContents[i].title);
					paramAreacodes.push(addContents[i].areareacode);
					paramSigungucodes.push(addContents[i].sigunguCode);
				}
			}else{
				if(addContents[i].contenttype==setContenttype && addContents[i].areacode==setAreacode && addContents[i].sigungucode==setSigungucode){
					contentids.push(addContents[i].contentid);
					addrs.push(addContents[i].addr);
					images.push(addContents[i].image);
					titles.push(addContents[i].title);
					paramAreacodes.push(addContents[i].areareacode);
					paramSigungucodes.push(addContents[i].sigunguCode);
				}
			}
		}
	}
	var url='http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList';
	var param='ServiceKey=fX3lnf27RmPng52xVKCEdpQCWJLVPWN%2Fz4fBH0k1vtwxf%2BhoF9j%2Fvu5ZuJ%2FgYC5FK2AETjgxz0eeSMWThJbCYw%3D%3D&contentTypeId='+setContenttype+'&areaCode='+setAreacode+'&sigunguCode='+setSigungucode+'&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=B&numOfRows=40000&pageNo=1';
	sendRequest(url, param, showResult, 'GET');
}

function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var doc=XHR.responseXML;
			viewContents=doc.getElementsByTagName('item');
			setTable();
		}
	}
}
function setTable(){
	for(var i=0;i<viewContents.length;i++){
		var contentid;
		var image;
		var addr;
		var title;
		var paramAreacode;
		var paramSigunguCode;
		
		if(viewContents[i].getElementsByTagName('contentid').length==0){
			contentid=0;
		}else{
			contentid=viewContents[i].getElementsByTagName('contentid').item(0).firstChild.nodeValue;
		}
		
		if(viewContents[i].getElementsByTagName('areacode').length==0){
			paramAreacode=0;
		}else{
			paramAreacode=viewContents[i].getElementsByTagName('areacode').item(0).firstChild.nodeValue;
		}
		
		if(viewContents[i].getElementsByTagName('sigungucode').length==0){
			paramSigunguCode=0;
		}else{
			paramSigunguCode=viewContents[i].getElementsByTagName('sigungucode').item(0).firstChild.nodeValue;
		}
		
		if(viewContents[i].getElementsByTagName('firstimage').length==0){
			image='resource/img/noimage.png';
		}else{
			image=viewContents[i].getElementsByTagName('firstimage').item(0).firstChild.nodeValue;
		}
		
		if(viewContents[i].getElementsByTagName('addr1').length==0){
			addr='정보 없음';
		}else{
			addr=viewContents[i].getElementsByTagName('addr1').item(0).firstChild.nodeValue;
		}
		
		if(viewContents[i].getElementsByTagName('title').length==0){
			title='정보 없음';
		}else{
			title=viewContents[i].getElementsByTagName('title').item(0).firstChild.nodeValue;
		}
		if(contentid!=0 && addr!='정보 없음' && paramAreacode!=0 && paramSigunguCode!=0){
			contentids.push(contentid);
			addrs.push(addr);
			images.push(image);
			titles.push(title);
			paramAreacodes.push(paramAreacode);
			paramSigungucodes.push(paramSigunguCode);
		}
	}
	
	document.getElementById('placenum').innerHTML='검색결과 :<strong> '+contentids.length+'개</strong>';
	var cp=1;
	tableSet(cp);
	pagingModule(cp);
}

function movePage(cp){
	tableSet(cp);
	pagingModule(cp);
}

function pagingModule(cp){
	var totalCnt=contentids.length;
	var listSize=12;
	var pageSize=10;
	var totalPage=Math.floor(totalCnt/listSize+1);
	if(totalCnt%listSize==0){
		totalPage=totalPage-1;
	}
	var userGroup=Math.floor(cp/pageSize);
	if(cp%pageSize==0){
		userGroup=userGroup-1;
	}
	
	var pageStr='';
	
	if(userGroup!=0) {
		var num=(userGroup-1)*pageSize+pageSize;
		pageStr+='<li class="page-item" onclick="movePage('+num+')"><p class="page-link">Prev</p></li>';
	}
	for(var i=userGroup*pageSize+1;i<=userGroup*pageSize+pageSize;i++){
		if(i==cp){
			pageStr+='<li class="page-item active" onclick="movePage('+i+')"><p class="page-link">'+i+'</p></div>';
		}else{
			pageStr+='<li class="page-item" onclick="movePage('+i+')"><p class="page-link">'+i+'</p></div>';
		}
		if(i==totalPage){
			break;
		}
	}
	if(userGroup!=(Math.floor(totalPage/pageSize))-(totalPage%pageSize==0?1:0)){
		var num=(userGroup+1)*pageSize+1;
		pageStr+='<li class="page-item" onclick="movePage('+num+')"><p class="page-link">Next</p></div>';
	}
	var pageUl=document.getElementsByClassName('pagination');
	pageUl[0].innerHTML=pageStr;
} 

function tableSet(cp){
	$('#viewTable').empty();
	var table=document.getElementById('viewTable');
	var startNum;
	var endNum;
	if(cp==1){
		startNum=0;
	}else{
		startNum=(cp-1)*12;
	}
	if((cp*12)+1>contentids.length){
		endNum=contentids.length;
	}else{
		endNum=cp*12;
	}
	for(var i=startNum;i<endNum;i++){
		var trNode;
        if(i%4==0){
	    	trNode=document.createElement('tr');
	    	table.appendChild(trNode);
	    }
		var tdNode=document.createElement('td');
		var imgNode=document.createElement('img');
	    imgNode.setAttribute('src', images[i]);
	    imgNode.setAttribute('style', 'width: 200px; height: 200px; border-radius: 15px; cursor: pointer;');
	    var pNode=document.createElement('p');
	    pNode.setAttribute('style','font-size:10px;');
	    var temp=[]; 
	    temp = titles[i].split("[");
	    var title;
	    if(temp.length==1){
	    	title=titles[i];
	    }else{
	    	title=temp[0];
	    }
	    temp =  titles[i].split("(");
	    if(temp.length==1){
	    	title=title;
	    }else{
	    	title=temp[0];
	    }
	    var pTextNode=document.createTextNode(title);
	    pNode.appendChild(pTextNode);
	    var pNode2=document.createElement('span');
	    var pTextNode2=document.createTextNode(addrs[i]);
	    pNode2.appendChild(pTextNode2);
	    tdNode.appendChild(imgNode);
	    tdNode.appendChild(pNode);
	    trNode.appendChild(tdNode);
	    if(titles[i].substr(0, 3)=='[AD'){
	    	tdNode.setAttribute('onclick', 'getAdPlaceDetail('+contentids[i]+','+paramAreacodes[i]+','+paramSigungucodes[i]+')');
	    }else{
	    	tdNode.setAttribute('onclick', 'getPlaceDetail('+contentids[i]+','+paramAreacodes[i]+','+paramSigungucodes[i]+')');
	    }
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
	sigunguSelector.value='';
	var areaSelector=document.getElementById('areacode');
	var areacodeVal=areaSelector.options[areaSelector.selectedIndex].value;
	var areacodeText=areaSelector.options[areaSelector.selectedIndex].text;
	var sigunguList = document.getElementsByClassName(areacodeVal);
	for(var i=0;i<sigunguList.length;i++){
		var sigungu=sigunguList[i];
		sigungu.style.display='block';
	}
}

function getAdPlaceDetail(contentid, paramAreacode, paramSigungucode){
	location.href='goAdPlaceDetail.do?contentid='+contentid+'&areacode='+paramAreacode+'&sigungucode='+paramSigungucode;
}

function getPlaceDetail(contentid, paramAreacode, paramSigungucode){
	location.href='goPlaceDetail.do?contentid='+contentid+'&areacode='+paramAreacode+'&sigungucode='+paramSigungucode;
}
</script>
<body onload="show()" style="background-color: white;">
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
					<span class="adtitle">${addto.title }</span>
					<span class="adcontenttype">${addto.contenttype }</span>
					<span class="adareacode">${addto.areacode }</span>
					<span class="adsigungucode">${addto.sigungucode }</span>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
<script>
var table=document.getElementById('adSite');
var datay_n=document.getElementsByClassName('noContent')[0];
if(datay_n!='undefined'){
	adList=table.getElementsByClassName('adlist');
	for(var i=0;i<adList.length;i++){
		var ad_idx=adList[i].getElementsByClassName('ad_idx')[0].firstChild.nodeValue;
		var adaddr=adList[i].getElementsByClassName('adaddr')[0].firstChild.nodeValue;
		var image=adList[i].getElementsByClassName('adimg')[0].firstChild.nodeValue;
		var adtitle='[AD] '+adList[i].getElementsByClassName('adtitle')[0].firstChild.nodeValue;
		var adcontenttype=adList[i].getElementsByClassName('adcontenttype')[0].firstChild.nodeValue;
		var adareacode=adList[i].getElementsByClassName('adareacode')[0].firstChild.nodeValue;
		var adsigungucode=adList[i].getElementsByClassName('adsigungucode')[0].firstChild.nodeValue;
		var addContent={
			contentid:ad_idx,
			addr:adaddr,
			image:image,
			title:adtitle,
			contenttype:adcontenttype,
			areacode:adareacode,
			sigungucode:adsigungucode
		};
		addContents.push(addContent);
	}
}
</script>
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
<section class="signup-section" style="background-color: white;">
	<div class="container-sm text-center">
		<div class="row justify-content-md-center mb-3">
			<div class="col-md-2">
				<select name="contenttype" id="contenttype">
					<option value="12">관광지</option>
					<option value="14">문화시설</option>
					<option value="32">숙박</option>
					<option value="38">쇼핑</option>
					<option value="39">음식점</option>
				</select>
			</div>
			<div class="col-md-2">
				<select name="areacode" id="areacode" onchange="changeAreacode()">
					<c:forEach var="areadto" items="${arealist }">
						<option value="${areadto.areacode}" data-value="${areadto.latitude },${areadto.longitude}">${areadto.areaname }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-md-2">
				<select name="sigungucode" id="sigungucode">
				    <option value="">==전체==</option>
					<c:forEach var="sigungudto" items="${sigungulist }">
						<option value="${sigungudto.sigungucode }" class="${sigungudto.areacode }" style="display:none;">${sigungudto.sigungu_name }</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-md-2">
				<input type="button" class="btn btn-secondary" id="searchBtn" onclick="show()" value="검색" style="width:100%; height:100%;">
			</div>
		</div>
		<div class="row justify-content-md-center mb-3">
			<div class="col-md-8">
				<div class="col-md-10">
				
				</div>
				<div class="col-md-2">
				<table>
					<tr>
						<td colspan="4" id="placenum"><strong>검색결과 : 0개</strong></td>
					</tr>
				</table>
				</div>
			</div>
		</div>
		<div class="row justify-content-md-center mb-3 ">
			<div class="col-md-8" style="margin:0px auto;">
			<table name="viewTable" id="viewTable" style="word-break:break-all;width:100%;align:center;text-align: center;">
			</table>
			</div>
			<div id="pageModule" style="align:center; margin-top:30px;">
				<div class="row justify-content-md-center">
			         <div class="col-md-6 ">
			         	<div class="col-md-8" style="margin:0px auto;">
			             <ul class="pagination justify-content-center">
			             </ul>
			            </div>
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
	<footer class="footer bg-light small text-center">
		<div class="container px-4 px-lg-5">Copyright &copy; Ezen&Team1 2021</div>
	</footer>
  <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>