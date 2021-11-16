<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h3>My Page</h3>
</div>
<div style="height: 50px;"></div>

<div class="container">
	<table align="center" class="table table-hover" style="cellpadding:7px;">
      <thead>
      <tr>
         <th style="width:15%">카테고리
         </th>
         <th style="width:45%">제목</th>
         <th style="width:13%">작성자</th>
         <th style="width:12%">작성일</th>
         <th style="width:8%">조회수</th>
      </tr>
      </thead>
      <tbody>
      <c:choose>
         <c:when test="${fn:length(list) > 0 }">
            <c:forEach items="${list}" var="row">
               <tr>
                  <td>${row.BOARD_CAT}</td>
                  <td class="title"><a href="#this" name="title">                  
                  ${row.BOARD_TITLE} [${row.TOTAL_COMMENTS}]</a>
                  <input type="hidden" id="BOARD_NUM" value="${row.BOARD_NUM}">
                  </td>
                  <td>${row.MEM_NICK}</td>
                  <td><fmt:formatDate pattern="yyyy/MM/dd" value="${row.BOARD_DATE}" /></td>
                  <td>${row.BOARD_COUNT}</td>
               </tr>
            </c:forEach>
         </c:when>
      <c:otherwise>
         <tr>
            <td colspan="6"> 조회된 결과가 없습니다.</td>
         </tr>
      </c:otherwise>
      </c:choose>
      </tbody>
      </table>
      
      <hr>
      
      <div>
         <input type="button" class="btn btn-outline-primary" value="MYPAGE" style="float:right; margin-right:20px;"
         onclick="location.href='/muscle/member/openMyInfoForm.do'">
      </div>
</div>


<!-- footer       -->
<div style="height: 80px;"></div>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<footer style="border-top: 1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%>
</footer>

<script type="text/javascript">
$(document).ready(function(){
    $("a[name='title']").on("click",function(e){
       e.preventDefault();
       fn_openBoardDetail($(this));
       });
});

function fn_openBoardDetail(obj){
    var comSubmit = new ComSubmit(); 
    comSubmit.setUrl("<c:url value='/board/openBoardDetail.do'/>");
     comSubmit.addParam("BOARD_NUM", obj.parent().find("#BOARD_NUM").val());
     comSubmit.submit();
}
</script>
</body>
</html>