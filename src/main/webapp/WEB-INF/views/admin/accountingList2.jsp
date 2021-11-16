<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
  <script src="<c:url value='/js/common.js'/>" charset="utf-8"></script> 
</head> 
<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div style="height: 160px;"></div>
<div align="center">
   <c:if test="${session_MEMBER.MEM_ADMIN == 'Y'}">
      <h3>매출관리</h3> 
   </c:if>
</div>
<div style="height: 30px;"></div>
<div align="center" style="width:1000px; margin-left:auto; margin-right:auto;">
<c:if test="${session_MEMBER.MEM_ADMIN == 'Y'}">
   <ul class="nav nav-tabs">
      <li class="nav-item">
       <a class="nav-link" href="<c:url value='/admin/openAdminMember.do'/>">회원관리</a>
     </li>
     <li class="nav-item">
       <a class="nav-link" href="<c:url value='/admin/openAdminGoods.do'/>">상품관리</a>
     </li>
     <li class="nav-item">
       <a class="nav-link" href="<c:url value='/report/openAdminReport.do'/>">신고관리</a>
     </li>
     <li class="nav-item">
       <a class="nav-link" href="<c:url value='/admin/acsBoardList.do'/>">공지관리</a>
     </li>
     <li class="nav-item">
       <a class="nav-link active" href="<c:url value='/admin/openDailyAccountingList.do'/>">매출관리</a>
     </li>
   </ul>
</c:if>
</div><br>

<div align="left" style="width:400px; margin-left:270px;">
	<nav>
		<ul class="nav nav-justified">
					<a href="/muscle/admin/openDailyAccountingList.do" style="text-decoration:none; color:navy;">일별 매출 조회&nbsp;&nbsp;</a> | </li>&nbsp;
					<a href="/muscle/admin/openMonthlyAccountingList.do" style="text-decoration:none; color:navy;">월별 매출 조회</a></li>&nbsp;
		</ul>
	</nav>
</div>

<span>
<p></p>
</span>

<form id="dateForm" action="<c:url value='/admin/adminMonthlyAccountingList.do'/>"  method="POST" >
	<div align="left" style="width:400px; margin-left:270px;">
	<font color="black">'월간 조회' 입니다.<br>날짜를 입력하세요.</font>&nbsp;&nbsp;&nbsp;</div>
	<div class="form-inline form-group" align="left" style="width:400px; margin-left:270px;">
		<select name = "cate1">
			<option value="전체">전체</option>
			<option value="홈트레이닝">홈트레이닝</option>
			<option value="식품">식품</option>
			<option value="홈케어">홈케어</option>
		</select>
		<input type="text" id="Adate" name="Adate" placeholder="'21/11' 형식으로 입력" class="form-control"/>
		<input type="submit" value="제출" class="btn btn-primary btn-sm" style="display:inline-block; margin-bottom:5px;"/>
	</div>
</form>
<br>

<div align="center" style="width:1000px; margin-left:auto; margin-right:auto;">
<table class="table table-hover" style="cellpadding:7px;" name="memList">
<colgroup>
<col width="5%" />
<col width="40%" />
</colgroup>
<thead>
	<tr style="background-color:#EAEAEA;">
		<th scope="col">매출액: </th>
		<c:if test="${order_price != '해당일은 집계될 매출액이 없습니다.'}">
		<th scope="col"><fmt:formatNumber value="${order_price}" pattern="#,###"> </fmt:formatNumber> 원</th></c:if>
		<c:if test="${order_price eq '해당일은 집계될 매출액이 없습니다.' }">
		<th scope="col">${order_price}</th></c:if>
	</tr>
</thead>
</table>
</div>


<script type="text/javascript">

</script>   
<%@ include file="/WEB-INF/include/include-body.jspf" %>
   <!-- footer       -->
   <div style="height:100px;"></div>
   <footer style="border-top:1px solid #D5D5D5;">
   <%@ include file="/WEB-INF/views/template/footer.jsp"%> 
   </footer>
</body>
</html>