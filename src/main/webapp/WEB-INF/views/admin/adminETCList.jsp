<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<script src="<c:url value='/js/common_s.js'/>" charset="utf-8"></script>
<title>adminAS리스트</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>

<script>

$(document).ready(function() {
	$(".list_title").click(function(){
		
		$(".message").each(function(index, item){
			if (!$(this).hasClass("list_hidden")){
				$(this).addClass("list_hidden");
			}
        });
        
		if ($(this).next().hasClass("list_hidden")){
            //$(this).children("div").addClass("select-list");
            $(this).next().removeClass("list_hidden");
		}
	})
});


function as_cancle(AORDER_NUM, AORDER_ORDER_NUM, AORDER_STATE){
	alert("as취소");
	var AORDER_NUM = AORDER_NUM;
	var AORDER_ORDER_NUM = AORDER_ORDER_NUM;
	var AORDER_STATE = AORDER_STATE;
	
	if(AORDER_NUM == null || AORDER_ORDER_NUM == null || AORDER_STATE == null
		|| AORDER_STATE == '' || AORDER_ORDER_NUM == '' || AORDER_NUM == '') {
		alert("오류입니다.");
		return false;
	}
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/admin/as_cancle.do' />");
	comSubmit.addParam("AORDER_NUM", AORDER_NUM);
	comSubmit.addParam("AORDER_ORDER_NUM", AORDER_ORDER_NUM);
	comSubmit.addParam("AORDER_STATE", AORDER_STATE);
	comSubmit.submit();
}

function as_ok(AORDER_NUM, AORDER_ORDER_NUM, AORDER_STATE){
	alert("as접수");
	var AORDER_NUM = AORDER_NUM;
	var AORDER_ORDER_NUM = AORDER_ORDER_NUM;
	var AORDER_STATE = AORDER_STATE;
		
	if(AORDER_NUM == null || AORDER_ORDER_NUM == null || AORDER_STATE == null 
			|| AORDER_STATE == '' || AORDER_ORDER_NUM == '' || AORDER_NUM == '' ) {
		alert("오류입니다.");
		return false;
	}
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/admin/as_ok.do'/>");
	comSubmit.addParam("AORDER_NUM", AORDER_NUM);
	comSubmit.addParam("AORDER_ORDER_NUM", AORDER_ORDER_NUM);
	comSubmit.addParam("AORDER_STATE", AORDER_STATE);
	comSubmit.submit();
}

</script>

<style>
.list_hidden{display:none; cursor: pointer;}
</style>
 
</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<!-- header -->
<div style="height: 160px;"></div>
<div align="center">
   <h3>교환/반품/취소 처리</h3> 
</div>
<div style="height: 30px;"></div>
<div align="center" style="width:1000px; margin-left:auto; margin-right:auto;">
<ul class="nav nav-tabs">
     <li class="active">
       <a class="nav-link" href="<c:url value='/admin/order_admin_a.do'/>">주문관리</a>
     </li>
     <li class="nav-item">
       <a class="nav-link active" href="<c:url value='/admin/as_admin.do?as=4'/>">교환/반품/취소</a>
     </li>
</ul>

<div class="container" style="margin-top:20px;"></div>

<div class="container">
	<div class="masthead" style="margin-bottom:10px;">
		<nav>
			<ul class="nav nav-justified">
			<c:choose>
				<c:when test="${fn:length(as_admin_list) > 0}">
					<c:forEach items="${as_admin_list }" var="state" begin="0" end="0">
					<c:choose>
                  <c:when test="${state.AORDER_STATE eq '4' }">
                  |&nbsp;<li class="active"><a href="/muscle/admin/as_admin.do?as=4" style="text-decoration:none; color:black;"><strong>취소 접수</strong></a> | </li>&nbsp;
                  </c:when>
                  <c:otherwise>
                  |&nbsp;<li><a href="/muscle/admin/as_admin.do?as=4">취소 접수</a> | </li>&nbsp;
                  </c:otherwise>
               </c:choose>
               <c:choose>
                  <c:when test="${state.AORDER_STATE eq '5' }">
                  <li class="active"><a href="/muscle/admin/as_admin.do?as=5" style="text-decoration:none; color:black;"><strong>취소 완료</strong></a> | </li>&nbsp;
                  </c:when>
                  <c:otherwise>
                  <li><a href="/muscle/admin/as_admin.do?as=5">취소 완료</a> | </li>&nbsp;
                  </c:otherwise>
               </c:choose>
					<c:choose>
						<c:when test="${state.AORDER_STATE eq '6' }">
						<li class="active"><a href="/muscle/admin/as_admin.do?as=6" style="text-decoration:none; color:black;"><strong>교환 접수 </strong></a> | </li>&nbsp;
						</c:when>
						<c:otherwise>
						<li><a href="/muscle/admin/as_admin.do?as=6">교환 접수 </a> | </li>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state.AORDER_STATE eq '7' }">
						<li class="active"><a href="/muscle/admin/as_admin.do?as=7" style="text-decoration:none; color:black;"><strong>교환 중 </strong></a> | </li>&nbsp;
						</c:when>
						<c:otherwise>
						<li><a href="/muscle/admin/as_admin.do?as=7">교환 중 </a> | </li>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state.AORDER_STATE eq '8' }">
						<li class="active"><a href="/muscle/admin/as_admin.do?as=8" style="text-decoration:none; color:black;"><strong>교환 완료 </strong></a> | </li>&nbsp;
						</c:when>
						<c:otherwise>
						<li><a href="/muscle/admin/as_admin.do?as=8">교환 완료 </a> | </li>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state.AORDER_STATE eq '9' }">
						<li class="active"><a href="/muscle/admin/as_admin.do?as=9" style="text-decoration:none; color:black;"><strong>반품 접수 </strong></a> | </li>&nbsp;
						</c:when>
						<c:otherwise>
						<li><a href="/muscle/admin/as_admin.do?as=9">반품 접수 </a> | </li>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state.AORDER_STATE eq '10' }">
						<li class="active"><a href="/muscle/admin/as_admin.do?as=10" style="text-decoration:none; color:black;"><strong>반품 완료</strong></a> | </li>&nbsp;
						</c:when>
						<c:otherwise>
						<li><a href="/muscle/admin/as_admin.do?as=10">반품 완료</a> | </li>&nbsp;
						</c:otherwise>
					</c:choose>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach items="${AORDER_STATE}" var="state" begin="0" end="0">
					<c:choose>
                  <c:when test="${state eq '4' }">
                  |&nbsp;<li class="active"><a href="/muscle/admin/as_admin.do?as=4" style="text-decoration:none; color:black;"><strong>취소 접수</strong></a> | </li>&nbsp;
                  </c:when>
                  <c:otherwise>
                  |&nbsp;<li><a href="/muscle/admin/as_admin.do?as=4">취소 접수</a> | </li>&nbsp;
                  </c:otherwise>
               </c:choose>
               <c:choose>
                  <c:when test="${state eq '5' }">
                  <li class="active"><a href="/muscle/admin/as_admin.do?as=5" style="text-decoration:none; color:black;">취소 완료</a> | </li>&nbsp;
                  </c:when>
                  <c:otherwise>
                  <li><a href="/muscle/admin/as_admin.do?as=5">취소 완료</a> | </li>&nbsp;
                  </c:otherwise>
               </c:choose>
					<c:choose>
						<c:when test="${state eq '6' }">
						<li class="active"><a href="/muscle/admin/as_admin.do?as=6" style="text-decoration:none; color:black;">교환 접수</a> | </li>&nbsp;
						</c:when>
						<c:otherwise>
						<li><a href="/muscle/admin/as_admin.do?as=6">교환 접수 </a> | </li>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state eq '7' }">
						<li class="active"><a href="/muscle/admin/as_admin.do?as=7" style="text-decoration:none; color:black;">교환 중</a> | </li>&nbsp;
						</c:when>
						<c:otherwise>
						<li><a href="/muscle/admin/as_admin.do?as=7">교환 중 </a> | </li>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state eq '8' }">
						<li class="active"><a href="/muscle/admin/as_admin.do?as=8" style="text-decoration:none; color:black;">교환 완료</a> | </li>&nbsp;
						</c:when>
						<c:otherwise>
						<li><a href="/muscle/admin/as_admin.do?as=8">교환 완료 </a> | </li>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state eq '9' }">
						<li class="active"><a href="/muscle/admin/as_admin.do?as=9" style="text-decoration:none; color:black;">반품 접수</a> | </li>&nbsp;
						</c:when>
						<c:otherwise>
						<li><a href="/muscle/admin/as_admin.do?as=9">반품 접수 </a> | </li>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state eq '10' }">
						<li class="active"><a href="/muscle/admin/as_admin.do?as=10" style="text-decoration:none; color:black;"><strong>반품 완료</strong></a> | </li>&nbsp;
						</c:when>
						<c:otherwise>
						<li><a href="/muscle/admin/as_admin.do?as=10">반품 완료</a> | </li>&nbsp;
						</c:otherwise>
					</c:choose>
					</c:forEach>
				</c:otherwise>
			</c:choose>				
			</ul>
			
		</nav>
	</div>
	

	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr style="background-color:#EAEAEA;">
					<th width="15%" align="center">신청날짜</th>
               		<th width="10%" align="center">신청번호</th>
               		<th width="10%" align="center">주문번호</th>
					<th width="16%" align="center">아이디</th>
					<th width="*" align="center">사유</th>
					<th width="14%" align="center">확인</th>
				</tr>
			</thead>
			<form id="order_select">
			<tbody>
			<c:choose>
				<c:when test="${fn:length(as_admin_list) > 0}">
					<c:forEach items="${as_admin_list }" var="aal">
						<tr class="list_title">
							<td>${aal.AS_SDATE }</td>
							<td>${aal.AORDER_NUM }</td>
							<td>${aal.AORDER_ORDER_NUM }</td>
							<td>${aal.MEM_ID }</td>
							<td >${aal.ORDER_REPORT_COMMENT }</td>
							<c:choose>
								<c:when test="${aal.AORDER_STATE eq '4'}">
									<td><input type="button" onclick="as_ok(${aal.AORDER_NUM }, ${aal.AORDER_STATE }, ${aal.AORDER_ORDER_NUM })" value="요청확인"  class="btn btn-primary btn-sm" style="margin-bottom:2px;"/>
									<br /><input type="button" onclick="as_cancle(${aal.AORDER_NUM }, ${aal.AORDER_STATE }, ${aal.AORDER_ORDER_NUM })" value="요청취소" class="btn btn-outline-primary btn-sm"/></td>
								</c:when>
									<c:when test="${aal.AORDER_STATE eq '5' }">
									<td>취소 완료 <br /> [처리완료]</td>
								</c:when>
								<c:when test="${aal.AORDER_STATE eq '6'}">
									<td><input type="button" onclick="as_ok(${aal.AORDER_NUM }, ${aal.AORDER_STATE }, ${aal.AORDER_ORDER_NUM })" value="요청확인"  class="btn btn-primary btn-sm" style="margin-bottom:2px;"/>
									<br /><input type="button" onclick="as_cancle(${aal.AORDER_NUM }, ${aal.AORDER_STATE }, ${aal.AORDER_ORDER_NUM })" value="요청취소" class="btn btn-outline-primary btn-sm" /></td>
								</c:when>
								<c:when test="${aal.AORDER_STATE eq '7' }">
									<td><input type="button" onclick="as_ok(${aal.AORDER_NUM }, ${aal.AORDER_STATE }, ${aal.AORDER_ORDER_NUM })" value="교환완료" class="btn btn-primary btn-sm" style="margin-bottom:2px;"/>
									<br /><input type="button" onclick="as_cancle(${aal.AORDER_NUM }, ${aal.AORDER_STATE }, ${aal.AORDER_ORDER_NUM })" value="요청취소" class="btn btn-outline-primary btn-sm"/></td>
								</c:when>
								<c:when test="${aal.AORDER_STATE eq '8' }">
									<td>교환 완료 <br /> [처리완료]</td>
								</c:when>
								<c:when test="${aal.AORDER_STATE eq '9'}">
									<td><input type="button" onclick="as_ok(${aal.AORDER_NUM }, ${aal.AORDER_STATE }, ${aal.AORDER_ORDER_NUM })" value="요청확인"  class="btn btn-primary btn-sm" style="margin-bottom:2px;"/>
									<br /><input type="button" onclick="as_cancle(${aal.AORDER_NUM }, ${aal.AORDER_STATE }, ${aal.AORDER_ORDER_NUM })" value="요청취소" class="btn btn-outline-primary btn-sm"/></td>
								</c:when>
								<c:otherwise>
									<td>반품 완료<br /> [처리완료]</td>
								</c:otherwise>
							</c:choose>
						</tr>
						
						<tr class ="message list_hidden">
							<th>요청사항</th>
					        <td colspan="4">
							회원이름 : ${aal.MEM_NAME } <br />
							회원연락처 : ${aal.MEM_PHONE } / 회원이메일 : ${aal.MEM_EMAIL }<br />
							교환/환불 사유 : <br />
					        ${aal.ORDER_REPORT_COMMENT } <br />
					        <p> </p></td>
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
		</form>
		</table>
		<hr>
	</div>
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