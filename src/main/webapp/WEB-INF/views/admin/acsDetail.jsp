
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
   <script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
</head>
<body>
   <%@ include file="/WEB-INF/views/template/header.jsp"%>
   <div style="height: 160px;"></div>

   <!-- title -->
   <div align="center">
      <h3>NOTICE</h3>

   </div>
   <div style="height: 30px;"></div>
   
   <div class="container" style="width:65%">
      <div style="display:inline-block; float:right;">
      </div>
      <br>
      <hr>
      
      <div>
         <h4>[${map.NOTICE_TYPE}] ${map.NOTICE_TITLE}</h4>
         <span>작성자 ${map.NOTICE_WRITER}</span>
         <span style="float:right;"> ${map.NOTICE_DATE} | 조회 ${map.NOTICE_COUNT} | 추천 0</span>
      </div>
      
      <hr>
      
      <div style="padding:20px; margin-bottom:100px; white-space:pre-wrap;">
         <span>${map.NOTICE_CONTENT}</span>
      </div>
      
      <hr>

      <div style="float:right;">
         <c:if test="${session_MEMBER.MEM_NICK == map.NOTICE_WRITER}">
         <input type="hidden" name="NOTICE_NUM" id="NOTICE_NUM" value="${map.NOTICE_NUM}"/>
           	<c:if test="${map.NOTICE_TYPE == 'FAQ' }">
         	<a href="#this" id="modifyFaq"><button type="button" class="btn btn-outline-primary" style="margin-right:6px;">FAQ수정</button></a>
         	</c:if>
         	<c:if test="${map.NOTICE_TYPE != 'FAQ' }">
         	<a href="#this" id="modify"><button type="button" class="btn btn-outline-primary" style="margin-right:6px;">공지수정</button></a>
         	</c:if>
         <a href="#this" id="delete"><button type="button" class="btn btn-outline-primary" style="margin-right:6px;">삭제</button></a>
         <button type="button" class="btn btn-outline-primary" onclick="javascript:history.go(-1);" style="margin-right:6px;">목록</button>
         </c:if>
         <c:if test="${session_MEMBER.MEM_NICK != map.NOTICE_WRITER}">
         <button type="button" class="btn btn-outline-primary" onclick="javascript:history.go(-1);" style="margin-right:6px;">목록</button>
         <!--  목록 경로 고쳐야 합니다.(회원) -->
         </c:if>
      </div>
   </div>

   <script type="text/javascript">
      $("#delete").on("click", function(e) { //삭제하기 버튼
         e.preventDefault();
         fn_deleteBoard();
      });

      $("#modify").on("click", function(e) { //수정하기 버튼
         e.preventDefault();
         fn_openBoardModify();
      });

      $("#modifyFaq").on("click", function(e) { //FAQ 수정하기 버튼
          e.preventDefault();
          fn_openFaqModify();
       });

      function fn_deleteBoard(){
            var comSubmit = new ComSubmit();
            var CONFIRM = confirm("정말로 삭제하시겠습니까?");
            if(CONFIRM==true){
            comSubmit.setUrl("<c:url value='/admin/acsDelete.do' />");
            comSubmit.addParam("NOTICE_NUM", $("#NOTICE_NUM").val());
            comSubmit.submit();
            alert("삭제가 완료되었습니다.");
            }
         }
      
         function fn_openBoardModify(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/admin/updateAcsForm.do' />");
            comSubmit.addParam("NOTICE_NUM", $("#NOTICE_NUM").val());
            comSubmit.submit();
         }

         function fn_openFaqModify(){
             var comSubmit = new ComSubmit();
             comSubmit.setUrl("<c:url value='/admin/updateFaqForm.do' />");
             comSubmit.addParam("NOTICE_NUM", $("#NOTICE_NUM").val());
             comSubmit.submit();
          }
   </script>



   <%@ include file="/WEB-INF/include/include-body.jspf" %>
   <!-- footer       -->
   <div style="height:100px;"></div>
   <footer style="border-top:1px solid #D5D5D5;">
   <%@ include file="/WEB-INF/views/template/footer.jsp"%> 
   </footer>
   
</body>
</html>