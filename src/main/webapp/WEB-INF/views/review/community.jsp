﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/resource/meta/meta.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />8
    <meta name="author" content="" />
    <title>Grayscale - Start Bootstrap Theme</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="resource/css/styles.css" rel="stylesheet" />
    <link href="resource/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/modals/">
</head>
<style>
    #pagepath span {
        font-size: x-small;
    }
    #title label {
        font-size: xx-large;
        font-weight: lighter;
    }
    </style>
<body>
    <!-- Navigation@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
<%@include file="/WEB-INF/views/member/header.jsp" %>
    <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
    <section class="signup-section bg-light" id="signup"
        style="padding-top: 3rem; background: linear-gradient(to bottom, rgb(255 255 255 / 42%) 0%, rgb(207 255 203 / 28%) 75%, #f6f2f2 100%);">
        <h1 class="display-6 fw-bolder mb-5 text-center"></h1>
        <div class="container-sm mb-5">


            <div class="row">

                <!--     페이지경로 -->

                <div id="pagepath" class="col-md-4" style="height: 128px;">
                    <span>커뮤니티</span>
                </div>
                <!--         제목 -->

                <div id="title" class="col-md-4">
                    <h5 class="display-6 fw-bolder text-center">Community</h5>
                </div>
                <div class="col-md-4"></div>
            </div>
            <!--     일정공유게시판 컨텐츠 이동  -->

            <div class="row">
                <div class="col-xs-12" style="height: 32px;"></div>
            </div>
            <div class="row justify-content-md-center">
                <div class="col-md-8">
                    <a href="share.do" style="color:whitesmoke; text-decoration: none;">
                    <div class="card bg-dark text-white" style="border: ghostwhite 0.5px solid;">
                        <img src="http://img.etoday.co.kr/pto_db/2017/08/20170811033432_1111517_710_340.jpg" class="card-img" alt="..."
                            style="width: 95%; height:360px;">
                        <div class="card-img-overlay">
                            <h5 class="card-title">일정 공유게시판</h5>
                            <p class="card-text">다른 사람들과 함께 여행 일정을 공유하세요.</p>
                        </div>
                    </div></a>
                </div>
            </div>
            <!--     후기게시판 컨텐츠 이동  -->
            <div class="row">
                <div class="col-xs-12" style="height:32px;">&nbsp;&nbsp;&nbsp;</div>
            </div>
            <div class="row justify-content-md-center">
                <div class="col-md-8">
                <a href="review.do" style="color:whitesmoke; text-decoration: none;">
                    <div class="card bg-primary text-white" style="border: ghostwhite 0.5px solid;">
                        <img src="https://youimg1.tripcdn.com/target/0104x1200067h0lsdB5F1_C_640_320_Q70.jpg_.webp?proc=source%2Ftrip"
                            class="card-img" alt="..." style="width: 95%; height: 360px;">
                        <div class="card-img-overlay">
                            <h5 class="card-title">여행 후기게시판</h5>
                            <p class="card-text">멋진 경험들과 여행의 즐거움을 다른사람들과 함께 나누세요.</p>
                        </div>
                    </div></a>
                </div>
            </div>



        </div>
    </section>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    <!-- Contact-->
    <%@include file="/WEB-INF/views/member/faq.jsp" %>
	<%@include file="/WEB-INF/views/member/footer.jsp" %>
</body>

</html>