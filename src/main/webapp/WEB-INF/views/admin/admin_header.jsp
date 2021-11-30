<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${sessionScope.dto.web_browser_title}</title>
<meta name="description" content="${sessionScope.dto.description}">
<meta name="keyword" content="${sessionScope.dto.keyword}">
<meta name="favicon" content="${sessionScope.dto.favicon}">
<link href="${pageContext.request.contextPath}/resource/css/admin_header.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/admin_common.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/admin_footer.css" type="text/css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="resource/js/httpRequest.js"></script>
</head>
<body>
<header class="bg-success p-2 text-dark bg-opacity-10">
  <nav class="navbar navbar-expand-lg navbar-light p-1 text-dark bg-opacity-10">
    <div class="container-fluid">
    	<div class="welcome">${sessionScope.sessionNickname}님 안녕하세요 <br>today :${sessionScope.now}</div>&nbsp;&nbsp;&nbsp;
      <b>관리자페이지</b>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="admin_basic_settings.do">기본설정</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="admin_member_management.do">회원관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="admin_board_management.do">게시판관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">광고관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="admin_statistics.do">통계/분석</a>
          </li>
        </ul>
        <span class="navbar-text">
          <ul class="ul_1">
            <li class="li_1">
              <a class="nav-link disabled">GooPPl</a>
            </li>
            <li class="li_1">
              <a class="nav-link disabled" href="logout.do">Logout</a>
            </li>   
          </ul>
        </span>
      </div>
    </div>
  </nav>
</header>
</body>
</html>