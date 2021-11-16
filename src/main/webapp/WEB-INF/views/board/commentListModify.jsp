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

<div class="container" width="60%">
<c:choose>
         <c:when test="${fn:length(list1) > 0}">
            <c:forEach items="${list1}" var="ct">
   <div>
      <hr>
      <span style="font-size:9pt; color:gray;">${ct.MEM_NICK}</span>
      <c:if test="${session_MEMBER.MEM_NUM != null && session_MEMBER.MEM_NICK == ct.MEM_NICK }">
      <a href="#this" id="cancle"><span style="font-size:9pt; color:gray; padding-right:10px; float:right;">취소</span></a>
      <a href="#this" id="modifyComment"><span style="font-size:9pt; color:gray; padding-right:10px; float:right;">저장</span></a>
      </c:if>
      <br>
      <span style="padding:5px;">${ct.COMMENTS_CONTENT}</span>
      
      
      
      <span style="float:right; font-size:9pt; color:gray; padding:5px;"><fmt:formatDate pattern="yyyy/MM/dd" value="${ct.COMMENTS_DATE}" /></span>
      
   </div>
   </c:forEach>
         </c:when>
      </c:choose>
</div>


<%@ include file="/WEB-INF/include/include-body.jspf" %>

<script type="text/javascript">
$("#cancle").on("click", function(e){
   e.preventDefault();
   cancle();
});

$("#modifyComment").on("click", function(e){
	   e.preventDefault();
	   fn_modifyComment();
	});

function fn_modifyComment(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/comment/updateCommentForm.do' />");
	comSubmit.submit();
}
	
function cancle(){
   history.go(-1);
   location.reload();
   }

</script>
</body>
</html>