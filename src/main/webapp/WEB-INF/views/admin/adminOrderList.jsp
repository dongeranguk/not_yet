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
<title>주문메인</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>

<script type="text/javascript">

   /* 필요한거 이페이지가 돌아왔을때 order_state값이 0이면  id="o1"에 추가class="active" */

   $(document).ready(function(){
      $("#o1").on("click", function(e){
         e.preventDefault();
         fn_openBoardList();
      });

      $("a[name='title']").on("click", function(e){
         e.preventDefault();
         order_detail(${order.AORDER_ORDER_NUM});
      });
   });

   function order_detail(no){
      var comSubmit = new ComSubmit();
      var AORDER_ORDER_NUM = no;
      comSubmit.setUrl("<c:url value='/admin/order_detail.do' />");
      comSubmit.addParam("AORDER_ORDER_NUM", AORDER_ORDER_NUM);
      comSubmit.submit();    
   }
   
   function fn_openBoardList(){
      var comSubmit = new ComSubmit();
      var state = 0;
      comSubmit.setUrl("<c:url value='/muscle/admin/order_admin_a.do' />");
      comSubmit.addParam("AORDER_STATE", state);
      comSubmit.submit();
   }
</script>

<script>
function order_state(state, no){ //주문상태변경*아직 변경전
    var AORDER_STATE = state;
    var AORDER_ORDER_NUM = no;
    var AORDER_TRACKING = $("#AORDER_TRACKING").val();
 
   if(confirm("확인하시겠습니까?")){
    $.ajax({
         url: "/muscle/admin/order_admin_a.do",
         data : {"AORDER_STATE": AORDER_STATE, "AORDER_ORDER_NUM": AORDER_ORDER_NUM, "AORDER_TRACKING": AORDER_TRACKING},
         type: "POST",
         async:false,
         success : function(data){
            alert("주문상태가 변경되었습니다.");
             location.href = "/muscle/admin/order_admin_a.do?os="+AORDER_STATE;
             window.opener.location.reload(); 
              self.close(); 
         }
      })}else{
         return;
   }
}


</script>



</head>


<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<!-- header -->
<div style="height: 160px;"></div>
<div align="center">
   <h3><b>주문관리</b></h3> 
</div>
<div style="height: 30px;"></div>
<div align="center" style="width:1000px; margin-left:auto; margin-right:auto;">
<ul class="nav nav-tabs">
     <li class="active">
       <a style=color:hotpink; class="nav-link active" href="<c:url value='/admin/order_admin_a.do'/>">주문관리</a>
     </li>
     <li class="nav-item">
       <a style=color:pink; class="nav-link" href="<c:url value='/admin/as_admin.do?as=4'/>">교환/반품/취소</a>
     </li>
</ul>

<div class="container" style="margin-top:20px;"></div>
<!-- body -->
<div class="container" style="text-decoration:none;">
<div class="masthead" style="margin-bottom:10px;">
      
      <nav>
         <ul class="nav nav-justified">
         <c:choose>
            <c:when test="${fn:length(order_a) > 0}">
               <c:forEach items="${order_a }" var="state" begin="0" end="0">
               <c:choose>
                  <c:when test="${state.AORDER_STATE eq '0' }">
                  |&nbsp;<li class="active"><a href="/muscle/admin/order_admin_a.do?os=0" style="text-decoration:none;  color:black;"><strong>신규주문</strong></a> | </li>&nbsp;
                  </c:when>
                  <c:otherwise>
                  |&nbsp;<li><a style=color:hotpink; href="/muscle/admin/order_admin_a.do?os=0">신규주문</a> | </li>&nbsp;
                  </c:otherwise>
               </c:choose>
               <c:choose>
                  <c:when test="${state.AORDER_STATE eq '1' }">
                  <li class="active"><a href="/muscle/admin/order_admin_a.do?os=1" style="text-decoration:none; color:black;"><strong>배송준비</strong></a> |</li>&nbsp;
                  </c:when>
                  <c:otherwise>
                  <li><a href="/muscle/admin/order_admin_a.do?os=1">배송준비</a> | </li>&nbsp;
                  </c:otherwise>
               </c:choose>
               <c:choose>
                  <c:when test="${state.AORDER_STATE eq '2' }">
                  <li class="active"><a href="/muscle/admin/order_admin_a.do?os=2" style="text-decoration:none; color:black;"><strong>배송중</strong></a> | </li>&nbsp;
                  </c:when>
                  <c:otherwise>
                  <li><a href="/muscle/admin/order_admin_a.do?os=2">배송중</a> | </li>&nbsp;
                  </c:otherwise>
               </c:choose>
               <c:choose>
                  <c:when test="${state.AORDER_STATE eq '3' }">
                  <li class="active"><a href="/muscle/admin/order_admin_a.do?os=3" style="text-decoration:none; color:black;"><strong>거래완료</strong></a> | </li>&nbsp;
                  </c:when>
                  <c:otherwise>
                  <li><a href="/muscle/admin/order_admin_a.do?os=3">거래완료</a> | </li>&nbsp;
                  </c:otherwise>
               </c:choose>
                
               
               </c:forEach>
            </c:when>
            <c:otherwise>
            <c:forEach items="${AORDER_STATE }" var="state" begin="0" end="0">
               <c:choose>
                  <c:when test="${state eq '0' }">
                  |&nbsp;<li class="active"><a href="/muscle/admin/order_admin_a.do?os=0">신규주문</a> | </li>
                  </c:when>
                  <c:otherwise>
                  |&nbsp;<li><a href="/muscle/admin/order_admin_a.do?os=0">신규주문</a> | </li>
                  </c:otherwise>
               </c:choose>
               <c:choose>
                  <c:when test="${state eq '1' }">
                  <li class="active"><a href="/muscle/admin/order_admin_a.do?os=1">배송준비</a> | </li>
                  </c:when>
                  <c:otherwise>
                  <li><a href="/muscle/admin/order_admin_a.do?os=1">배송준비</a> | </li>
                  </c:otherwise>
               </c:choose>
               <c:choose>
                  <c:when test="${state eq '2' }">
                  <li class="active"><a href="/muscle/admin/order_admin_a.do?os=2">배송중</a> | </li>
                  </c:when>
                  <c:otherwise>
                  <li><a href="/muscle/admin/order_admin_a.do?os=2">배송중</a> | </li>
                  </c:otherwise>
               </c:choose>
               <c:choose>
                  <c:when test="${state eq '3' }">
                  <li class="active"><a href="/muscle/admin/order_admin_a.do?os=3">거래완료</a> | </li>
                  </c:when>
                  <c:otherwise>
                  <li><a href="/muscle/admin/order_admin_a.do?os=3">거래완료</a> | </li>
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
            <tr align="center" style="background-color:#EAEAEA;">
               <th width="10%" align="center">주문날짜</th>
               <th width="10%" align="center">주문번호</th>
               <th width="10%" align="center">아이디</th>
               <th width="8%" align="center">이름</th>
               <th width="*" align="center">구매상품</th>
               <th width="10%" align="center">총 개수</th>
               <th width="10%" align="center">총 금액</th>
               <th width="12%" colspan="2" align="center">진행상황</th>
            </tr>
         </thead>
         
         <tbody align="center">
         <c:choose>
            <c:when test="${fn:length(order_a) > 0}">
               <c:forEach items="${order_a }" var="order">               
                  <tr>
                     <td>${order.ORDER_DATE}</td>
                     <td>${order.ORDER_NUM}</td>
                     <td>${order.MEM_ID}</td>
                     <td>${order.MEM_NAME}</td>
                     <%-- 주문상태${order.ORDER_STATE } --%>
                     <c:choose>
                        <c:when test="${order.AORDER_STATE == 0 }">
                        <td>${order.GOODS_NAME }</td>
                        </c:when>
                        <c:when test="${order.AORDER_STATE == 1 }">
                        <td>${order.GOODS_NAME }<br>
                        <input type="text" id="AORDER_TRACKING" class="form-control" style="height:28px; width:200px;" /></td>
                        </c:when>
                        <c:when test="${order.AORDER_STATE == 2 }">
                        <td>${order.GOODS_NAME } <br> 송장 : ${order.AORDER_TRACKING}</td>
                        </c:when>
                        <c:when test="${order.AORDER_STATE == 3 }">
                        <td>${order.GOODS_NAME }<br> 송장 : ${order.AORDER_TRACKING}</td>
                        </c:when>
                        <c:when test="${order.AORDER_STATE == 5 }">
                        <td>${order.GOODS_NAME }</td>
                        </c:when>
                     </c:choose>
                     <%-- <td ><a href="#this" name="title">${order.GOODS_NAME }</a>
                        <input type="hidden" id="member_no" value="${order.MEMBER_NO }"></td> --%>
                     <td>${order.HAP_CNT}건</td>
                     <td>${order.ORDER_TCOST}원</td>
                     <c:choose>
                     <c:when test="${order.AORDER_STATE == 0 }">
                        <td><input type="button" class="btn btn-outline-primary btn-sm" onclick="order_detail(${order.AORDER_ORDER_NUM })" value="상세보기" /><br>
                        <input type="button" class="btn btn-primary btn-sm" onclick="order_state(${order.AORDER_STATE }, ${order.AORDER_ORDER_NUM })" value="상태변경" style="margin-top:2px;"/>
                        </c:when>
                     <c:when test="${order.AORDER_STATE == 1 }">
                        <td><input type="button" class="btn btn-outline-primary btn-sm" onclick="order_detail(${order.AORDER_ORDER_NUM })" value="상세보기" /><br>
                        <input type="button" class="btn btn-primary btn-sm" onclick="order_state(${order.AORDER_STATE }, ${order.AORDER_ORDER_NUM })" value="상태변경" style="margin-top:2px;"/>
                        <input type="hidden" id="AORDER_TRACKING" name="AORDER_TRACKING" value="${order.AORDER_TRACKING}"></td>
                        </c:when>
                     <c:when test="${order.AORDER_STATE == 2 }">
                        <td><input type="button" class="btn btn-outline-primary btn-sm" onclick="order_detail(${order.AORDER_ORDER_NUM })" value="상세보기" /><br>
                        <input type="button" class="btn btn-primary btn-sm" onclick="order_state(${order.AORDER_STATE }, ${order.AORDER_ORDER_NUM })" value="상태변경" style="margin-top:2px;"/>
                        </td>
                        </c:when>
                        <c:when test="${order.AORDER_STATE == 3 }">
                        <td><input type="button" class="btn btn-outline-primary btn-sm" onclick="order_detail(${order.AORDER_ORDER_NUM })" value="상세보기" /><br>
                            <strong>거래완료</strong>
                        </td>
                        </c:when>
                        <c:when test="${order.AORDER_STATE == 4 }">
                        <td><input type="button" class="btn btn-outline-primary btn-sm" onclick="order_detail(${order.AORDER_ORDER_NUM })" value="상세보기" />
                        <input type="button" class="btn btn-primary btn-sm" onclick="order_state(${order.AORDER_STATE }, ${order.AORDER_ORDER_NUM })" value="상태변경" />
                        </td>
                        </c:when>
                        <c:when test="${order.AORDER_STATE == 5 }">
                        <td><input type="button" class="btn btn-outline-primary btn-sm" onclick="order_detail(${order.AORDER_ORDER_NUM })" value="상세보기" />
                            [거래완료]
                        </td>
                        </c:when>
                     </c:choose>
                  </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="9">조회된 결과가 없습니다.</td>
               </tr>
            </c:otherwise>
         </c:choose>
      </tbody>
      
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