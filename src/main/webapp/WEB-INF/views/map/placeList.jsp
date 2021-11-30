<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관광지 데이터 게시판</title>
</head>
<script src="resource/js/httpRequest.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
var cp;
var viewContents=[];
function show(){
	$('#viewTable').empty();
	var sigungucode=document.getElementById('sigungucode').value;
	var setContenttype=document.getElementById('contenttype').value;
	var setAreacode=document.getElementById('areacode').value;
	var setSigungucode=sigungucode==''?'':sigungucode;
	console.log('contentTypeId='+setContenttype+'&areaCode='+setAreacode+'&sigunguCode='+setSigungucode);
	var url='http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList';
	var param='ServiceKey=fX3lnf27RmPng52xVKCEdpQCWJLVPWN%2Fz4fBH0k1vtwxf%2BhoF9j%2Fvu5ZuJ%2FgYC5FK2AETjgxz0eeSMWThJbCYw%3D%3D&contentTypeId='+setContenttype+'&areaCode='+setAreacode+'&sigunguCode='+setSigungucode+'&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=40000&pageNo=1';
	sendRequest(url, param, showResult, 'GET');
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var doc=XHR.responseXML;
			console.log(doc);
			viewContents=doc.getElementsByTagName('item');
			setTable();
		}
	}
}
function setTable(){
	var table=document.getElementById('viewTable');
	var contentids=[];
	var images=[];
	var addrs=[];
	var titles=[];
	for(var i=0;i<viewContents.length;i++){
		var contentid;
		var image;
		var addr;
		var title;
		
		if(viewContents[i].getElementsByTagName('contentid').length==0){
			contentid=0;
		}else{
			contentid=viewContents[i].getElementsByTagName('contentid').item(0).firstChild.nodeValue;
		}
		
		if(viewContents[i].getElementsByTagName('firstimage').length==0){
			image='img/noimage.png';
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
		contentids.push(contentid);
		images.push(image);
		addrs.push(addr);
		titles.push(title);
	}
	
	for(var i=0;i<viewContents.length;i++){
		var trNode;
        if(i%4==0 && i!=11){
	    	trNode=document.createElement('tr');
	    	table.appendChild(trNode);
	    }
		var tdNode=document.createElement('td');
		var imgNode=document.createElement('img');
	    imgNode.setAttribute('src', images[i]);
	    imgNode.setAttribute('style', 'width: 200px; height: 200px;');
	    var pNode=document.createElement('p');
	    var pTextNode=document.createTextNode(titles[i]);
	    pNode.appendChild(pTextNode);
	    var pNode2=document.createElement('span');
	    var pTextNode2=document.createTextNode(addrs[i]);
	    pNode2.appendChild(pTextNode2);
	    tdNode.appendChild(imgNode);
	    tdNode.appendChild(pNode);
	    tdNode.appendChild(pNode2);
	    trNode.appendChild(tdNode);
	    
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
</script>
<body onload="show()">
<h1>실험</h1>
<select name="contenttype" id="contenttype">
	<option value="12">관광지</option>
	<option value="14">문화시설</option>
	<option value="32">숙박</option>
	<option value="38">쇼핑</option>
	<option value="39">음식점 </option>
</select>
<select name="areacode" id="areacode" onchange="changeAreacode()">
	<c:forEach var="areadto" items="${arealist }">
		<option value="${areadto.areacode}" data-value="${areadto.latitude },${areadto.longitude}">${areadto.areaname }</option>
	</c:forEach>
</select>
<select name="sigungucode" id="sigungucode">
    <option value="" selected disabled>==전체==</option>
	<c:forEach var="sigungudto" items="${sigungulist }">
		<option value="${sigungudto.sigungucode }" class="${sigungudto.areacode }" style="display:none;">${sigungudto.sigungu_name }</option>
	</c:forEach>
</select>
<input type="button" id="searchBtn" onclick="show()" value="검색">
<table border="1">
	<tr>
		<td colspan="4" id="placenum">검색결과 : 0개</td>
	</tr>
</table>
<table border="1" name="viewTable" id="viewTable">
</table>
</body>
</html>