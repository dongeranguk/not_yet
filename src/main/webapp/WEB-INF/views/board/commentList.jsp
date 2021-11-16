<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
<form name="frm" id="frm" method="post" enctype="multipart/form-data">
<div class="container" width="60%">
<c:choose>
         <c:when test="${fn:length(list1) > 0}">
            <c:forEach items="${list1}" var="ct">
   <div>
      <hr>
      <span style="font-size:9pt; color:gray;">${ct.MEM_NICK}</span>
      <c:if test="${session_MEMBER.MEM_NUM != null && session_MEMBER.MEM_NICK == ct.MEM_NICK }">
      <input type="hidden" name="COMMENTS_NUM" id="COMMENTS_NUM" value="${ct.COMMENTS_NUM}">
      <a href="#this" id="delComment"><span style="font-size:9pt; color:gray; padding-right:10px; float:right;">삭제</span></a>
      <a href="#this" id="modifyComment"><span style="font-size:9pt; color:gray; padding-right:10px; float:right;">수정</span></a>
      </c:if>
      <c:if test="${session_MEMBER.MEM_NICK != ct.MEM_NICK }">
      <a href="#this" id="reportComment"><span style="font-size:9pt; color:gray; padding-right:10px; float:right;">신고</span></a>
      <input type="hidden" name="COMMENTS_NUM" id="COMMENTS_NUM" value="${ct.COMMENTS_NUM}">
      <input type="hidden" name="COMMENTS_PARENT" id="COMMENTS_PARENT" value="${ct.COMMENTS_PARENT}">
      <input type="hidden" name="COMMENTS_WRITER" id="COMMENTS_WRITER" value="${ct.COMMENTS_WRITER}">
      </c:if>
      <br>
      <span style="padding:5px;">${ct.COMMENTS_CONTENT} </span>
      
      <span style="float:right; font-size:9pt; color:gray; padding:5px;"><fmt:formatDate pattern="yyyy/MM/dd" value="${ct.COMMENTS_DATE}" /></span>
      
   </div>
   </c:forEach>
         </c:when>
      <c:otherwise>
      <span style="color:gray;">댓글이 없습니다.</span>
</c:otherwise>   
      </c:choose>
</div>
</form>

<%@ include file="/WEB-INF/include/include-body.jspf" %>

<script type="text/javascript">
$("#delComment").on("click", function(e){ //삭제하기 버튼
   e.preventDefault();
   fn_deleteComment();
});

$("#modifyComment").on("click", function(e){ //수정하기 버튼
      e.preventDefault();
      fn_modifyComment();
   });

$("#reportComment").on("click", function(e){
      e.preventDefault();
      fn_reportComment();   
});

function fn_reportComment(){
   var comSubmit = new ComSubmit();
   comSubmit.setUrl("<c:url value='/report/openReportCommentForm.do'/>");
   comSubmit.addParam("COMMENTS_NUM", $("#COMMENTS_NUM").val());
   comSubmit.addParam("COMMENTS_PARENT", $("#COMMENTS_PARENT").val());
   comSubmit.addParam("COMMENTS_WRITER", $("#COMMENTS_WRITER").val());
   //comSubmit.addParam("BOARD_NUM", $("#BOARD_NUM").val());
    comSubmit.submit();
}

function fn_deleteComment(){
   var comSubmit = new ComSubmit();
   
   var CONFIRM = confirm("정말로 삭제하시겠습니까?");
   if(CONFIRM==true){
   comSubmit.setUrl("<c:url value='/comment/commentDelete.do' />");
   comSubmit.addParam("COMMENTS_NUM", $("#COMMENTS_NUM").val());
   comSubmit.submit();
   alert("삭제가 완료되었습니다.");
   }  
}

function fn_modifyComment(){
   var comSubmit = new ComSubmit("frm");
   /* alert($("#COMMENTS_NUM").val()); */
   comSubmit.setUrl("<c:url value='/comment/updateCommentForm.do' />");
   comSubmit.addParam("COMMENTS_NUM", $("#COMMENTS_NUM").val());
   comSubmit.submit();
}
</script>
</body>
</html>