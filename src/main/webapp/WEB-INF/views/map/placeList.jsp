﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/resource/meta/meta.jsp" %>
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
			pageStr+='<li class="page-item active" onclick="movePage('+i+')"><p class="page-link">'+i+'</p></li>';
		}else{
			pageStr+='<li class="page-item" onclick="movePage('+i+')"><p class="page-link">'+i+'</p></li>';
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
<body id="page-top" onload="show()" style="background-color: white;">
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
	<%@include file="/WEB-INF/views/member/header.jsp" %>
 <section class="signup-section bg-light" id="signup"
        style="padding-top: 7rem; background: linear-gradient(to bottom, rgb(255 255 255 / 42%) 0%, rgb(207 255 203 / 28%) 75%, white 100%);">
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
    <%@include file="/WEB-INF/views/member/faq.jsp" %>
	<%@include file="/WEB-INF/views/member/footer.jsp" %>
	<script>
		function placeLogin(){
			location.href="index.do?login_result=need";
		}
	</script>
  <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/gooppl/resource/js/scripts.js"></script>
</body>
</html>