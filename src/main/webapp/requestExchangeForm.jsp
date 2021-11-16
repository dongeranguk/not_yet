<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<script src="/muscle/js/common.js" charset="utf-8"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div style="height: 160px;"></div>
<div align="center">
	<h3>1:1 문의</h3>
</div>
<div style="height: 50px;"></div>

<div class="container" style="width:50%;">
	<table class="table">
		<tr>
			<th>주문번호</th>
			<td>20210104-1234567</td>
		</tr>
		<tr>
			<th>상품명/옵션</th>
			<td>트레이닝 글러브</td>
		</tr>
	</table>
	
	<table class="table">
		<tr>
			<th>문의유형</th>
			<td>
			<select>
				<option>교환</option>
				<option>환불</option>
				<option>취소</option>
			</select>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="5" class="form-control" style="width:50%;"></textarea></td>
		</tr>
	</table>
	
	<hr>
	
	<div align="center">
		<input type="button" class="btn btn-primary" value="등록">
		<input type="button" class="btn btn-outline-primary" value="취소"> 
	</div>
</div>


</body>
</html>