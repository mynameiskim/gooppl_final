<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/myweb3//admin_css/admin_common.css" type="text/css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, address, big, cite, code, del, dfn, em, font, img, ins, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
    margin: 0;
    padding: 0;
    border: none 0;
}
#wrap {
    position: relative;
    width: 100%;
}
#container {
    overflow: hidden;
    min-width: 1031px;
}
#aside{
	text-align: left;
	width: 170px;
    margin-left: 10px;
    margin-right: 10px;
    overflow: hidden;
    float: left;
    padding: 30px 0 0;
}
#contents {
    min-width: 800px;
    width: auto !important;
    padding: 45px 20px 50px;
    overflow: hidden;
    margin: 0;
    border-left: solid 1px #ebebeb;
}
h5{
    font-size: 14px;
    font-weight: bold;
    color: #000;
    padding: 18px 10px 6px;
}
h6{
    padding: 3px 0 0 20px;
    height: 31px;
    font-size: 16px;
    color: #000;
    float: left;
}
#aside dl{
    border-top: solid 2px #e3e3e3;
    border-bottom: solid 2px #e3e3e3;
    padding: 4px 5px 15px;
    font-size: 11px;
}
#aside dl dt {
    letter-spacing: -0.1em;
    padding: 12px -1px 4px 18px;
}
#aside dl dd {
    background: #1987541f;
    line-height: 16px;
    letter-spacing: -0.1em;
    padding: 5px 0 5px 18px;
}
ul.helpbox {
    overflow: hidden;
    border: solid 3px #dde0e5;
    padding: 12px 14px 10px;
    margin-bottom: 20px;
    clear: both;
}
ul.helpbox li {
    font-size: 11px;
    color: #666;
    line-height: 16px;
    padding: 0 0 0 8px;
}
ul.navi{
    float: right;
    padding: 8px 8px 0 0;
}
ul.navi li.home{
    float: left;
    font-size: 11px;
    color: #858585;
    padding: 0 8px 0 0;
    background: none;
}
ul.navi li{
    float: left;
    font-size: 11px;
    color: #858585;
    padding: 0 6px 0 10px;
}
ul, li, ol{
    list-style-type: none;
}
ul{
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.section_head{
    font-size: 12px;
    color: #444;
    text-align: left;
    margin-top: 20px;
    position: relative;
}
.section_head h4{
    float: left;
    height: 25px;
    padding-left: 17px;
    margin: 0;
    line-height: 25px;
    font-size: 12px;
    font-weight: bold;
}
ul.helpbox li {
    font-size: 11px;
    color: #666;
    line-height: 16px;
    padding: 0 0 0 8px;
}
.section_head:after{
    content: '.';
    display: block;
    clear: both;
    line-height: 0;
    height: 0;
    visibility: hidden;
}
.menu_list{
	margin-bottom:0px;
    overflow: hidden;
    border-top: solid 1px #ddd;
}
.menu_list dt{
    float: left;
    width: 20%;
    height: 45px;
    background: #1987541f;
    border-bottom: solid 1px #ddd;
    padding: 9px 0 0;
}
.menu_list dd{
    float: left;
    width: 80%;
    height: 45px;
    border-bottom: solid 1px #ddd;
    padding: 8px 0 0;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
ul.navi li.home a {
    color: #858585;
}
.menu_list dt a{
    color: #444;
    padding: 0 15px;
}
.menu_list dd a{
    padding: 0 8px;
    color: #777;
    font-size: 11px;
}
a {
    display: inline-block;
    text-decoration: none !important;
    color: #555 !important;
}
td{
	padding: 10px;
    border: 1px solid #e3e3e3 !important;
}
.tb_hover{
       --bs-table-hover-bg: lightgray !important;
}
.tr_bg{
       --bs-table-accent-bg: #24292f !important;
}
</style>
</head>
<body>
<div id="wrap">
<%@include file="/WEB-INF/views/admin/admin_header.jsp" %>
<div id="container">
	<div id="aside">
		<h5><b>게시판관리</b></h5>
		<dl>
			<dt>게시판관리</dt>
			<dd>
				 <a href='admin_share.do' style="color: white !important;"
				>-공유게시판 관리</a><br />
				 <a href='admin_review.do' style="color: white !important;"
				>-후기게시판 관리</a><br />
				 <a href='admin_relpy.do' style="color: white !important;"
				>-댓글 관리 </a><br />
				 <a href='#' style="color: white !important;"
				>-문의 관리 </a>
			</dd>
		</dl>
	</div>
	<div id="contents">
		<h6><b >게시판관리</b></h6>
			<ul class='helpbox'>
				<li>회원들의 게시글과 댓글을 관리하는 메뉴입니다.</li>
			</ul>
		<div class="section_head">
			<h4>공유게시판 관리</h4>
		</div>					
		<dl class="menu_list">
			<dt><a href="admin_share.do" class="active text-white" style="color: white !important;"
				>공유게시판 관리</a>
			</dt>
			<dd>
				<a href="admin_share.do"
				>공유게시판의 게시글을 관리합니다.
				</a>
			</dd>
		</dl>
		<div class="section_head">
			<h4>후기게시판 관리</h4>
		</div>
		<dl class="menu_list">
			<dt>
				<a href="admin_review.do" class="active text-white" style="color: white !important;"
				>후기게시판 관리
				</a>
			</dt>
			<dd>
				<a href="admin_review.do"
				>후기게시판의 게시글을 관리합니다.
				</a>
			</dd>
		</dl>
		<div class="section_head">
			<h4>댓글 관리</h4>
		</div>					
		<dl class="menu_list">
			<dt>
				<a href="admin_relpy.do" class="active text-white" style="color: white !important;"
				>댓글 관리
				</a>
			</dt>
			<dd>
				<a href="admin_relpy.do"
					>모든 게시글의 댓글을 관리하는 곳입니다.
				</a>
			</dd>
		</dl>
		<div class="section_head">
			<h4>문의 관리</h4>
		</div>					
		<dl class="menu_list">
			<dt>
				<a href="admin_relpy.do" class="active text-white" style="color: white !important;"
				>문의 관리
				</a>
			</dt>
			<dd>
				<a href="admin_relpy.do"
					>사용자들의 문의를 관리하는 곳입니다.
				</a>
			</dd>
		</dl>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/admin/admin_footer.jsp" %>
</body>
</html>