<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="resource/js/httpRequest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<div id="di2">
<fieldset style="border: 3px solid #0000008c; padding: 12px 14px 10px;
		margin-bottom: 20px;">
	<div class="row">
	    <div class="col-md-3 mb-1">
	        <h5>회원정보</h5>
	    </div>
	</div>
	<form name="member_update" action="member_update.do">
	<table class="table table-bordered" style="font-size: 13px;">
	    <tr>
	        <th class="tr_bg active text-white">회원번호</th>
	        <td style="width:25%;">${mdto.member_idx}
	        <input type="hidden" id="member_idx" name="member_idx" value="${mdto.member_idx}">
	        </td>
	        <th class="tr_bg active text-white">회원유형</th>
	        <td style="width:25%;">${mdto.member_type}</td>
	    </tr>
	    <tr>
	    	<th class="tr_bg active text-white">구플 아이디</th>
	        <td style="width:25%;">${mdto.goo_id}</td>
	        <th class="tr_bg active text-white">네이버 아이디</th>
	        <td style="width:25%;">${mdto.naver_id}</td>
	    </tr>
	    <tr>
	    	<th class="tr_bg active text-white">카카오 아이디</th>
	        <td style="width:25%;">${mdto.kakao_id}</td>
	    	<th class="tr_bg active text-white">닉네임</th>
	        <td style="width:25%;"><input type="text" id="nickname" value="${mdto.nickname}" name="nickname" required="required"></td>
	    </tr>
	    <tr>
	        <th class="tr_bg active text-white">회원가입일</th>
	        <td colspan="3" style="width:25%;">${mdto.join_date}</td>
	    </tr>
	    <tr>
        	<td colspan="4" style="text-align: center;">
                <input class="bt btn-secondary" type="button" style="border-radius: 3px;" onclick="memberUpdate()" value="회원정보 수정" >
            </td>
        </tr>
    </table>
    </form>
</fieldset>
</div>