<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/resource/meta/meta.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시군구 데이터 넣기</title>
<script type="text/javascript" src="resource/js/httpRequest.js"></script>
<script>
var areacode;
var items;

function setTable(){
	for(var i=0;i<items.length;i++){
		var item=items[i];
		var sigungucode = item.getElementsByTagName('code').item(0).firstChild.nodeValue;
		var sigunguname = item.getElementsByTagName('name').item(0).firstChild.nodeValue;
		var param='areacode='+areacode+'&sigungucode='+sigungucode+'&sigungu_name='+sigunguname;
		console.log(param+'\n');
		sendRequest('addSigunguTable.do', param, addResult, 'GET');
	}
}
function addResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			console.log(data);
		}
	}
}

function show(){
	var url='http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaCode'; /*URL*/
	var param = 'serviceKey=fX3lnf27RmPng52xVKCEdpQCWJLVPWN%2Fz4fBH0k1vtwxf%2BhoF9j%2Fvu5ZuJ%2FgYC5FK2AETjgxz0eeSMWThJbCYw%3D%3D&numOfRows=50&pageNo=1&MobileOS=ETC&MobileApp=AppTest&areaCode='+document.getElementById('areaCode').value;
	areacode=document.getElementById('areaCode').value;
	sendRequest(url, param, showResult, 'GET');
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var doc = XHR.responseXML;
			console.log(doc);
			items = doc.getElementsByTagName('item');
			if(items.length==0){
				var table = document.getElementById('sigunguTable');
				var trNode = document.createElement('tr');
				var tdNode = document.createElement('tr');
				var tdTextNode = document.createTextNode('검색된 결과가 없습니다.');
				tdNode.appendChild(tdTextNode);
				trNode.appendChild(tdNode);
				table.appendChild(trNode);
			}else{
				var table;
				for(var i=0;i<items.length;i++){
					table = document.getElementById('sigunguTable');
					var item = items[i];
					var trNode = document.createElement('tr');
					trNode.setAttribute('id','tr'+i+1);
					var tdNode = document.createElement('td');
					var tdTextNode = document.createTextNode(areacode);
					tdNode.setAttribute('class', 'areacode');
					var tdNode2 = document.createElement('td');
					var code=item.getElementsByTagName('code').item(0).firstChild.nodeValue;
					var tdTextNode2 = document.createTextNode(code);
					tdNode2.setAttribute('class', 'sigungucode');
					var tdNode3 = document.createElement('td');
					var name=item.getElementsByTagName('name').item(0).firstChild.nodeValue;
					var tdTextNode3 = document.createTextNode(name);
					tdNode3.setAttribute('class', 'sigunguname');
					tdNode.appendChild(tdTextNode);
					tdNode2.appendChild(tdTextNode2);
					tdNode3.appendChild(tdTextNode3);
					trNode.appendChild(tdNode);
					trNode.appendChild(tdNode2);
					trNode.appendChild(tdNode3);
					table.appendChild(trNode);
				}
				var saveTrNode=document.createElement('tr');
				var saveTdNode=document.createElement('td');
				saveTdNode.setAttribute('colspan','3');
				var saveBtn=document.createElement('input');
				saveBtn.setAttribute('type', 'button');
				saveBtn.setAttribute('onclick', 'setTable()');
				saveBtn.setAttribute('value', '저장하기');
				saveTdNode.appendChild(saveBtn);
				saveTrNode.appendChild(saveTdNode);
				table.appendChild(saveTrNode);
			}
		}
	}
}
</script>
</head>
<body>
<input type="text" id="areaCode">
<input type="button" onclick="show()" value="시군구 정보 확인하기">
<table id="sigunguTable"> 
	
</table>
</body>
</html>