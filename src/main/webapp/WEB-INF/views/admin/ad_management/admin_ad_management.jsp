<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="wrap">
<div id="container">
	<div class="d-flex flex-column flex-shrink-0 p-3 text-white" style="margin-top: 27px; width: 210px; float: left; color: #24292f !important;">
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none" style="margin-left:15px;"
    ">
      <svg width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-6"><b>광고관리</b></span>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item" style="margin: 10px 0;">
        <a href='admin_ownerAppli.do' style="padding-left:18px; font-size: 13px; background-color: #24292f; color: white !important;" class="nav-link active" aria-current="page">
          <svg width="16" height="16"><use xlink:href='admin_ownerAppli.do'></use></svg>
          광고주 신청 관리
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_allOwner.do' class="nav-link text-white" style="padding-left:18px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_allOwner.do'></use></svg>
          광고주 정보 관리
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_adAppli.do' class="nav-link text-white" style="padding-left:22px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_adAppli.do'></use></svg>
          광고 신청 관리
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_adCancel.do' class="nav-link text-white" style="padding-left:22px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_adCancel.do'></use></svg>
          환불 신청 관리
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_paymentStatus.do' class="nav-link text-white" style="padding-left:22px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_paymentStatus.do'></use></svg>
          결제 내역 관리
        </a>
      </li>
      <li style="margin: 10px 0;">
        <a href='admin_adStatus.do' class="nav-link text-white" style="padding-left:22px; font-size: 13px; background-color: #24292f; color: white !important;">
          <svg width="16" height="16"><use xlink:href='admin_adStatus.do'></use></svg>
          광고 상태 관리
        </a>
      </li>
    </ul>
    <hr>
     </div>
	<div id="contents">
		<h6><b>광고 관리</b></h6>
			<ul class='helpbox'>
				<li>광고주 회원들의 정보와 광고, 결제 상태를 관리하는 메뉴입니다.</li>
			</ul>
		<div class="section_head">
			<h4>광고주 관리</h4>
		</div>					
		<dl class="menu_list">
			<dt><a href="admin_ownerAppli.do" style="color: white !important;"
				>광고주 신청 관리</a>
			</dt>
			<dd>
				<a href='admin_ownerAppli.do'
				>신청된 광고주 정보를 확인하고 승인 및 거절을 할 수 있는 메뉴입니다.
				</a>
			</dd>
		</dl>
		<dl class="menu_list">
			<dt>
				<a href='admin_allOwner.do' style="color: white !important;"
				>광고주 정보 관리
				</a>
			</dt>
			<dd>
				<a href='admin_allOwner.do'
				>광고주 회원들의 정보를 관리하는 메뉴입니다.
				</a>
			</dd>
		</dl>
		<div class="section_head">
			<h4>광고 문의 관리</h4>
		</div>					
		<dl class="menu_list">
			<dt>
				<a href='admin_adAppli.do' style="color: white !important;"
				>광고 신청 문의
				</a>
			</dt>
			<dd>
				<a href='admin_adAppli.do'
					>광고 신청관련 문의를 확인 및 승인/거절할 수 있는 메뉴입니다.
				</a>
			</dd>
		</dl>
		<dl class="menu_list">
			<dt>
				<a href='admin_adCancel.do' style="color: white !important;"
				>광고 취소 문의
				</a>
			</dt>
			<dd>
				<a href='admin_adCancel.do'
					>광고 취소관련 문의를 확인및 관리할 수 있는 메뉴입니다.
				</a>
			</dd>
		</dl>
		<div class="section_head">
			<h4>광고 상태 관리</h4>
		</div>					
		<dl class="menu_list">
			<dt>
				<a href='admin_paymentStatus.do' style="color: white !important;"
					>결제 상태 관리
				</a></dt>
			<dd>
				<a href='admin_paymentStatus.do'
					>결제정보를 관리할 수 있는 메뉴입니다.
				</a>
			</dd>
		</dl>
		<dl class="menu_list">
			<dt>
				<a href='admin_adStatus.do' style="color: white !important;"
					>광고 상태 관리
				</a></dt>
			<dd>
				<a href='admin_adStatus.do'
					>광고를 관리할 수 있는 메뉴입니다.
				</a>
			</dd>
		</dl>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>