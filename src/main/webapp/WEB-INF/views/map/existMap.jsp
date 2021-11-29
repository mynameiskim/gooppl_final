<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mapidx 이미 있는 지도</title>
</head>
<body>
<h1>이미 map_idx 부여받은 지도</h1>
<h5>member_idx 비교하여 같으면 유지, 다르면 쫒아낼것임</h5>
<h5>newMap의 경우 day1한정(한번만 들어가는 페이지), 일단 map_idx가 부여되면 페이지 이동시 mapinfoDTO list를 불러와 뿌리는 existMap.do페이지로 이동됨.</h5>
<h5>부여받은 map_idx : ${map_idx}, 부여받은 day_num : ${day_num}</h5>
</body>
</html>