<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
   <h3>My Order</h3>
</div>
<div style="height: 50px;"></div>



<div class="container" style="width:70%;">

<div align="center">
   <table style="border:1 solid #dbdbdb; margin-left:auto; margin-right:auto;" class="table">
      <tr>
         <th>주문일자</th>
         <td><fmt:formatDate pattern="yyyy/MM/dd" value="${map.ORDER_DATE}" /></td>
         <th>주문번호</th>
         <td>${map.ORDER_NUM}</td>
      </tr>
   </table>
</div>


<div class="table-responsive">
         <table class="table table-striped">
            <colgroup>
               <col width="15%" />
               <col width="15%" />
               <col width="15%" />
               <col width="15%" />
            </colgroup>
            <thead>
               
               <tr>
                  <th style="text-align: center">상품명/옵션</th>
                  <th style="text-align: center">수량</th>
                  <th style="text-align: center">상품가</th>
                  <th style="text-align: center">송장번호</th>
                  <th style="text-align: center">문의하기</th>
               </tr>
            </thead>
            <tbody>
                  <c:choose>
                  <c:when test="${fn:length(list) > 0 }">
					<c:forEach items="${list}" var="row">
                        <tr>
                             <td align="center">${row.GOODS_NAME} ${row.GOODS_NUM} </td>
                             <td align="center">${row.ORDER_DETAIL_AMOUNT}</td>
                             <td align="center">${row.GOODS_CPRICE}</td>
							
	                        	<td align="center">
	                      		<form Name="trackingForm" action="/muscle/client/tracking.do" method="post" >
	                      		<input type="hidden" id="TrackingNumber" name="TrackingNumber" value="${row.AORDER_TRACKING}" />
	                      		<%-- <input type="submit" id="TrackingNumber" onClick="javascript:openTracking();" value="${row.AORDER_TRACKING}"> --%>
 								<%-- <a href="#this" onClick="javascript:openTracking();">${row.AORDER_TRACKING}</a> --%>
<%-- 								<input type="submit" value="${row.AORDER_TRACKING}" > --%>								
								<a href='javascript:void(window.open("/muscle/client/tracking.do?TrackingNumber="+${row.AORDER_TRACKING}, "주문배송조회", "width=600, height=700, location=no, 
								status=no, toolbar=no, menubar=no, scrollbars=no, resizable=yes, fullscreen=no"))'>${row.AORDER_TRACKING}</a>
								</form>
								</td>
	                        <td><a href="#this" name="shit"><input type="button" value="취소" style="float:right; margin-right:20px;" class="btn btn-outline-dark btn-sm">
								<input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}">
								<input type="hidden" id="ORDER_NUM" name="ORDER_NUM" value="${row.ORDER_NUM}">
								<input type="hidden" id="ORDER_DETAIL_GNUM" name="ORDER_DETAIL_GNUM" value="${row.ORDER_DETAIL_GNUM}">
								<input type="hidden" id="ORDER_DETAIL_SIZE" name="ORDER_DETAIL_SIZE" value="${row.ORDER_DETAIL_SIZE}">
								<input type="hidden" id="ORDER_DETAIL_COLOR" name="ORDER_DETAIL_COLOR" value="${row.ORDER_DETAIL_COLOR}"></a>
	                        </td>                              
                       </tr>
                   	</c:forEach>
                   </c:when>
                   </c:choose>                     
            </tbody>
         </table>
      </div>
      <hr>
   <!-- 배송 정보 -->
      <div class="table-responsive">
      
      <table style="width:100%;">
         <colgroup>
               <col width="15%" />
               <col width="*" />
         </colgroup>
          <tr>
                 <th colspan="7">배송정보 <hr></th>
          </tr>

         <tr>
            <td>받는 사람</td>            
            <td>${map.ORDER_USER_NAME}</td>                        
         </tr>
         <tr>
            <td>연락처1</td>
            <td>${map.ORDER_PHONE1}</td>
         </tr>
         <tr>
            <td>연락처2</td>
            <td>${map.ORDER_PHONE2}</td>
         </tr>
         <tr>
            <td> 주 소</td>
            <td>
               ${map.ORDER_DZIPCODE}<br>
               ${map.ORDER_DADD1} ${map.ORDER_DADD2}
            </td>
         </tr>
         <tr>
            <td>배송 메모</td>
            <td>${map.ORDER_DMEMO}</td>
         </tr>
      </table>
      </div>
      <hr>

    <!-- 결제 정보 -->
      <div class="table-responsive">
      <table style="width:100%; cellpadding:10px;">
         <colgroup>
               <col width="20%" />
               <col width="*" />
         </colgroup>
         <tr>
            <th colspan="2">결제 정보<hr></th>
         </tr>
         <tr>
            <th>결제 금액</th>
            <th>${map.ORDER_TCOST}원</th>
         </tr>
         <tr>
            <td>결제 방법</td>
            <td>무통장입금</td>
         </tr>
         <tr>
            <td>입금자명</td>
            <td>${map.ORDER_PAY_NAME}</td>
         </tr>
         <tr>
            <td>환불 계좌</td>
            <td>
               ${ORDER_PAY_RBANK} ${map.ORDER_PAY_RACCOUNT}
         </td>
         </tr>
         <tr>
            <td>현금영수증 번호</td>
            <td>
            ${map.ORDER_PAY_CASHRE}
            </td>
         </tr>
      </table>
      </div>
      <hr>
      <div style="float:right;">
      	<a href="#this" name="bt"><input type="button" class="btn btn-outline-primary" value="주문목록">
      	<input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}">
		<input type="hidden" id="ORDER_NUM" name="ORDER_NUM" value="${row.ORDER_NUM}">
      	</a>
      </div>
      
</div>

<script type="text/javascript">
   $(document).ready(function(){
         $("a[name='shit']").on("click", function(e){
         e.preventDefault();
         fn_shit($(this));
             });

         $("a[name='bt']").on("click", function(e){
             e.preventDefault();
             fn_bt();
                 });
         
      });


     function fn_shit(obj){
        var comSubmit = new ComSubmit();
        comSubmit.setUrl("<c:url value='/member/openMyChangeForm.do' />");
         comSubmit.addParam("MEM_NUM", obj.parent().find("#MEM_NUM").val());
         comSubmit.addParam("ORDER_NUM", obj.parent().find("#ORDER_NUM").val());
         comSubmit.addParam("GOODS_NUM", obj.parent().find("#GOODS_NUM").val());
         comSubmit.addParam("ORDER_DETAIL_GNUM", obj.parent().find("#ORDER_DETAIL_GNUM").val());
         comSubmit.addParam("ORDER_DETAIL_SIZE", obj.parent().find("#ORDER_DETAIL_SIZE").val());
         comSubmit.addParam("ORDER_DETAIL_COLOR", obj.parent().find("#ORDER_DETAIL_COLOR").val());
         
         comSubmit.submit();
     }

     function fn_bt(){
    	 var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/member/openMyOrderList.do' />");
         comSubmit.addParam("ORDER_NUM", $("#ORDER_NUM").val());
         comSubmit.addParam("MEM_NUM", $("#MEM_NUM").val());
         comSubmit.submit();
         }
     
   </script>

<!-- footer       -->
<div style="height: 80px;"></div>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<footer style="border-top: 1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%>
</footer>   
</body>
</html>