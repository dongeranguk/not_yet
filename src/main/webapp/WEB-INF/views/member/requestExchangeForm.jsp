<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
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
         <td>${map.ORDER_DETAIL_DNUM}
      </tr>
      <tr>
         <th>상품명/옵션</th>
         <td>${map.GOODS_NAME}  ${map.ORDER_DETAIL_AMOUNT} ${map.ORDER_DETAIL_SIZE} ${map.ORDER_DETAIL_COLOR}</td>
      </tr>
   </table>
   
   <table class="table">
      <tr>
         <th>문의유형</th>
         <td>
         <select id="AORDER_STATE" name="AORDER_STATE">
            <option>선택</option>
            <option value="6">교환</option>
            <option value="9">반품</option>
            <option value="4">취소</option>
         </select>
         </td>
      </tr>
      <tr>
         <th>내용</th>
         <td><textarea rows="5" class="form-control" id="ORDER_REPORT_COMMENT" name="ORDER_REPORT_COMMENT" style="width:50%;">${map.ORDER_REPORT_COMMENT}</textarea></td>
      </tr>
   </table>
 
   <hr>
   
   <div align="center">
      <a href="#this" name="okk">
      <input type="button" class="btn btn-primary" value="등록">
      <input type="hidden" name="ORDER_DETAIL_DNUM" id="ORDER_DETAIL_DNUM" value="${map.ORDER_DETAIL_DNUM}">
      <input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}">
      <input type="hidden" id="ORDER_NUM" name="ORDER_NUM" value="${map.ORDER_DETAIL_DNUM}">
      </a>
     <input type="button" class="btn btn-outline-primary" value="취소" onclick="javascript:history.go(-1);">
      
     
   </div>
   
  
</div>

<script type="text/javascript">
   
   $(document).ready(function() {
      $("a[name='okk']").on("click", function(e) {
         e.preventDefault();
         fn_ok();
      });
   });
   function fn_ok() {
      var comSubmit = new ComSubmit();
      comSubmit.setUrl("<c:url value='/member/updateMyChange.do' />");
      if (!$("#ORDER_REPORT_COMMENT").val()) {
         alert("내용을 입력하세요.");
         $("#ORDER_REPORT_COMMENT").focus();
         return false;
      }
      if ($("#AORDER_STATE").val() == "선택") {
          alert("내용을 선택하세요.");
          $("#AORDER_STATE").focus();
          return false;
       }
      comSubmit.addParam("ORDER_DETAIL_DNUM", $("#ORDER_DETAIL_DNUM").val());
      comSubmit.addParam("ORDER_REPORT_COMMENT", $("#ORDER_REPORT_COMMENT").val());
      comSubmit.addParam("AORDER_STATE", $("#AORDER_STATE").val());
      comSubmit.addParam("MEM_NUM", $("#MEM_NUM").val());
      comSubmit.addParam("ORDER_NUM", $("#ORDER_NUM").val());

      alert("문의가 접수되었습니다.");
      comSubmit.submit();
   }
</script>

<%@ include file="/WEB-INF/include/include-body.jspf"%>
</body>
</html>