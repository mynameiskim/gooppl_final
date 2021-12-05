<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mapidx 이미 있는 지도</title>
<script>
function checkGetTripInfo(){
	var contents=[];
	<c:if test="${empty tripdto }">
		console.log('없음.');
	</c:if>
	<c:forEach var="tripdto" items="${tripdto }">
		var tripcontentid=${tripdto.contentid };
		var triptitle='${tripdto.title }';
		var tripaddr='${tripdto.addr }';
		var tripareacode=${tripdto.areacode };
		var tripsigungucode=${tripdto.sigungucode };
		var tripmapx=${tripdto.mapx };
		var tripmapy=${tripdto.mapy };
		var tripoverview='${tripdto.overview }';
		var tripreadnum=${tripdto.readnum };
		var triphomepage='${tripdto.homepage }';
		var tripimg='${tripdto.firstimage }';
		var content={
			contentid:tripcontentid,
			title:triptitle,
			addr:tripaddr,
			areacode:tripareacode,
			sigungucode:tripsigungucode,
			mapx:tripmapx,
			mapy:tripmapy,
			overview:tripoverview,
			readnum:tripreadnum,
			homepage:triphomepage,
			img:tripimg
		};
		contents.push(content);
	</c:forEach>
	console.log(contents);
}
</script>
</head>
<body onload="checkGetTripInfo()">
<h1>이미 map_idx 부여받은 지도</h1>
<h5>member_idx 비교하여 같으면 유지, 다르면 쫒아낼것임</h5>
<h5>newMap의 경우 day1한정(한번만 들어가는 페이지), 일단 map_idx가 부여되면 페이지 이동시 mapinfoDTO list를 불러와 뿌리는 existMap.do페이지로 이동됨.</h5>
<h5>부여받은 map_idx : ${map_idx}, 부여받은 day_num : ${day_num}</h5>
</body>
</html>