<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="wrap">
<div id="container">
	<div id="aside">
		<h5><b>광고 관리</b></h5>
		<dl>
			<dt>광고주 관리</dt>
			<dd>
				<a href='admin_ownerAppli.do' style="color: white !important;"
				>-광고주 신청 관리</a><br />
				<a href='admin_allOwner.do' style="color: white !important;"
				>-광고주 정보 관리</a>
			</dd>
			<dt>광고 문의 관리</dt>
			<dd>
				<a href='admin_adAppli.do' style="color: white !important;"
				>-광고 신청 관리</a><br />
				<a href='admin_adCancel.do' style="color: white !important;"
				>-광고 취소 관리</a>
			</dd>
			<dt>광고 상태 관리</dt>
			<dd>
				<a href='admin_paymentStatus.do' style="color: white !important;"
				>-결제 상태 관리</a><br />
				<a href='admin_adStatus.do' style="color: white !important;"
				>-광고 상태 관리</a>
			</dd>
		</dl>
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