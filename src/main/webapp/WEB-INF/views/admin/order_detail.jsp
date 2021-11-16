<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>admin주문디테일</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>

 
 <script>
$(document).ready(function(){
	
});

function order_list() {
	var os = "";
	<c:forEach items="${order_detail}" var="detail">
		os = ${detail.AORDER_STATE}
	</c:forEach>
	location.href="/muscle/admin/order_admin_a.do?os="+os;
	return;	
}
	

 </script>
 
</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<!-- header -->
<div style="height: 160px;"></div>
<div align="center">
   <h3>Admin</h3> 
</div>
<div style="height: 50px;"></div>

<div class="container" style="width:50%;">
	<div class="row">
        
        <c:forEach items="${order_detail}" var="detail">
        
        <table class="table">
        	<tr>
        		<th colspan="2"><font style="font-size:18pt;">배송지 정보</font></th>
        	</tr>
        	<tr>
        		<th>수령인</th><td>${detail.ORDER_USER_NAME }</td>
        	</tr>
        	<tr>
        		<th>연락처</th><td>${detail.ORDER_PHONE1 }</td>
        	</tr>
        	<tr>
        		<th>배송지</th><td>${detail.ORDER_DZIPCODE } <br> ${detail.ORDER_DADD1 } ${detail.ORDER_DADD2 }</td>
        	</tr>
        	<tr>
        		<th>배송메모</th><td>${detail.ORDER_DMEMO }</td>
        	</tr>
        </table>

        <table class="table">
			<tbody>
			<tr>
				<th colspan="2"><font style="font-size:18pt;">주문자정보</font>
				</th>
			</tr>
				<tr>
					<th>주문번호</th><td>${detail.ORDER_NUM }</td>
				</tr>
				<tr>									
					<th>주문자</th><td>${detail.MEM_NAME }</td>
				</tr>
				<tr>	
					<th>연락처</th><td>${detail.MEM_PHONE }</td>
				</tr>
				<tr>	
					<th>이메일</th><td>${detail.MEM_EMAIL }</td>
				</tr>
				<tr>
					<th>배송상태</th><td>${detail.AORDER_STATE }</td>
				</tr>
				<tr>
					<th>결제수단</th><td>${detail.ORDER_PAY }</td>
				</tr>
				<tr>	
					<th>제품가격</th><td>${detail.ORDER_PRICE }원</td>
				</tr>
				<tr>	
					<th>배송비</th><td>${detail.ORDER_DCOST }원</td>
				</tr>
				<tr>	
					<th>최종결제금액</th><td>${detail.ORDER_TCOST }원</td>
				</tr>								

			</tbody>
		</table>
        </c:forEach>
	</div>
	<hr />
	<div class="table-responsive">
		<table class="table table-striped">
			<colgroup>
			<col width="*" />
			<col width="15%" />
			<col width="10%" />
			<col width="15%" />
			<col width="15%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">제품명</th>
					<th scope="col">사이즈</th>
					<th scope="col">색상</th>
					<th scope="col">수량</th>
					<th scope="col">판매가격</th>
				</tr>
			</thead>
			
			<tbody>
			<c:choose>
				<c:when test="${fn:length(order_detail_sub) > 0}">
					<c:forEach items="${order_detail_sub }" var="detail_sub">					
						<tr>
							<td>${detail_sub.GOODS_NAME }</td>
							<td>${detail_sub.ORDER_DETAIL_SIZE }</td>
							<td>${detail_sub.ORDER_DETAIL_COLOR }</a>
							<td>${detail_sub.ORDER_DETAIL_AMOUNT }개</td>
							<td>${detail_sub.GOODS_MPRICE*detail_sub.ORDER_DETAIL_AMOUNT}원</td>

<%-- 							<td><input type="button" onclick="order_detail(${order.ORDER_NO })" value="상세보기">
							<br /><input type="button" onclick="order_state(${order.ORDER_STATE }, ${order.ORDER_NO })" value="확인버튼"></td> --%>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			
			</tbody>
		
		</table>
	</div>
	<hr>
	<div style="float:right; margin-right:20px;">
			<input type="button" class="btn btn-outline-primary btn-sm" onclick="order_list(); return false;" value="목록으로">
	</div>
</div>






	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
	
	<!-- footer -->
<div style="height:80px;"> 
</div>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>
</body>
</html>
