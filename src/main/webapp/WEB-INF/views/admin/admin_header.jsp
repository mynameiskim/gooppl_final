<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>${sessionScope.dto.web_browser_title}</title>
<meta name="description" content="${sessionScope.dto.description}">
<meta name="keyword" content="${sessionScope.dto.keyword}">
<link rel="shortcut icon" href="${sessionScope.dto.favicon}" type="image/x-icon" />
<link rel="icon" href="${sessionScope.dto.favicon}" type="image/x-icon" />
<link href="${pageContext.request.contextPath}/resource/css/admin_header.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/admin_common.css" type="text/css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resource/css/admin_footer.css" type="text/css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="resource/js/httpRequest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="resource/js/httpRequest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script><!-- jQuery CDN --->
<script type="text/javascript" src="/gooppl/resource/js/httpRequest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=454cf995c30c224dddca3632f6bb1f65&libraries=services"></script>
<!-- jquery -->
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<header class="text-light bg_c_n">
  <nav class="navbar navbar-expand-lg navbar-light p-1 text-light bg-opacity-10">
    <div class="container-fluid">
    	<div class="welcome"><b>${sessionScope.sessionNickname}님 안녕하세요</b> <br>Today:&nbsp;${sessionScope.now}</div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <span><a href="admin_basic_settings.do" style="color: white !important;"><b style="font-size:18px;">관리자페이지</b></a></span>&nbsp;&nbsp;
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active text-light text-opacity-75" style="color: #f6f8fa !important;" aria-current="page" href="admin_basic_settings.do">기본설정</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active text-light text-opacity-75" style="color: #f6f8fa !important;"  href="admin_member_management.do">회원관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active text-light text-opacity-75" style="color: #f6f8fa !important;" href="admin_ad_management.do">광고관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active text-light text-opacity-75" style="color: #f6f8fa !important;" href="admin_statistics.do">통계/분석</a>
          </li>
        </ul>
        <span class="navbar-text">
            <li class="li_1">
              <a href="index.do" class="nav-link active text-light text-opacity-75" style="color: #f6f8fa !important;" >GooPPl</a>
            </li>
            <li class="li_1">
              <a href="logout.do?sessionId=${sessionScope.sessionId}" class="nav-link active text-light text-opacity-75" style="color: #f6f8fa !important;" >Logout</a>
            </li>   
          </ul>
        </span>
      </div>
    </div>
  </nav>
</header>
</body>