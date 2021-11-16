<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
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
   <h3>Report</h3> 
</div>
<div style="height: 50px;"></div>


<div class="container" style="width:50%;">
<form id="frm">
<table class="joinFormView table" style="border:0;cellpadding:1; cellspacing:1; width:100%;" align="center">
   
     <tr>
      <th style="width:30%;">
         신고 번호
      </th>
      
      <td align="center" style="width:*;">
         ${map.REPORT_NUM}
      </td>   
   </tr>
   
   <tr>
      <th>
         회원 번호
      </th>
      
      <td align="center" colspan="4">
         <c:if test="${map.REPORT_BOARD_NUM != null}">
             ${map.REPORT_MEM_NUM1}
             <input type="hidden" id="REPORT_MEM_NUM1" name="REPORT_MEM_NUM1" value=${map.REPORT_MEM_NUM1 }>
         </c:if>
         <c:if test="${map.REPORT_COMMENT_NUM != null}">
             ${map.REPORT_MEM_CNUM}
             <input type="hidden" id="REPORT_MEM_CNUM" name="REPORT_MEM_CNUM" value=${map.REPORT_MEM_CNUM }>
         </c:if>
      </td>   
   </tr>
   
   <tr>
      <th>
         아이디
      </th>
      
      <td align="center" colspan="4">
         ${map.MEM_ID}
      </td>   
   </tr>
   
   <tr>
      <th>
         닉네임
      </th>
      
      <td align="center" colspan="4">
         ${map.MEM_NICK}
      </td>   
   </tr>
   
   <tr>
      <th>
         비고
      </th>
      
      <td align="center" colspan="4">
         <c:if test="${map.REPORT_MEM_NUM1 == null}">
         댓글 ${map.REPORT_NUM}
         </c:if>
         <c:if test="${map.REPORT_MEM_NUM1 != null}">
         게시판 ${map.REPORT_NUM}
         </c:if>
      </td>   
   </tr>
   
   <tr>
      <th>
         신고 사유
      </th>
      
      <td align="center" colspan="4">
         ${map.REPORT_COMMENT}
      </td>   
   </tr>
   
   <tr>
      <th>
         처리 상태
         <input type="hidden" name="REPORT_NUM" id="REPORT_NUM" value="${map.REPORT_NUM}">
         
         
      </th>
      
      <td align="center" colspan="4">
         <select id="REPORT_STATE" name="REPORT_STATE">
             <option value="3"><c:if test="${map.REPORT_STATE == '0'}">
                        선택
                     </c:if>
                     <c:if test="${map.REPORT_STATE == '1'}">
                        선택
                     </c:if>
                     <c:if test="${map.REPORT_STATE == '2'}">
                        선택
                     </c:if></option>
            <option value="0">대기</option>
            <option value="2">완료</option>
            <option value="1">취소</option>
         </select>
      </td>   
   </tr>

</table>
</form>
<hr>
<div align="center">
<a href="#this" name="ok"><input type="button" class="btn btn-primary" value="확인"></a>
<input type="button" class="btn btn-outline-primary" value="취소" onclick="location.href='http://localhost:8007/muscle/report/openAdminReport.do'">
</div>
</div>

<!-- footer -->
<div style="height:80px;"> 
</div>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>


<script type="text/javascript">
   $(document).ready(function(){
      $("a[name='ok']").on("click", function(e){
            e.preventDefault();
            fn_ok();
         });
      });
   function fn_ok(){
      var comSubmit = new ComSubmit("frm");
      if ($("#REPORT_STATE").val() == "3") {
            alert("상태를 선택하세요.");
            return false;
         }   
      comSubmit.setUrl("<c:url value='/report/updateAdminReport.do' />");
      comSubmit.submit();
      alert("수정이 완료 되었습니다.");
   }

</script>





<%@ include file="/WEB-INF/include/include-body.jspf" %>
</body>
</html>