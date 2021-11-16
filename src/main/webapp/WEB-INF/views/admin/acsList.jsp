<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
   <c:if test="${session_MEMBER.MEM_ADMIN == 'Y'}">
      <h3>공지관리</h3>
   </c:if>
   <c:if test="${session_MEMBER.MEM_ADMIN == 'N' || session_MEMBER.MEM_NUM == null}">
      <h3>Notice</h3>
   </c:if>
</div>
<div style="height: 30px;"></div>
<div align="center" style="width:1000px; margin-left:auto; margin-right:auto;">
<c:if test="${session_MEMBER.MEM_ADMIN == 'Y'}">
   <ul class="nav nav-tabs">
      <li class="nav-item">
       <a style=color:black; class="nav-link" href="<c:url value='/admin/openAdminMember.do'/>">회원관리</a>
     </li>
     <li class="nav-item">
       <a style=color:black; class="nav-link" href="<c:url value='/admin/openAdminGoods.do'/>">상품관리</a>
     </li>
     <li class="nav-item">
       <a style=color:black; class="nav-link" href="<c:url value='/report/openAdminReport.do'/>">신고관리</a>
     </li>
     <li class="nav-item">
       <a style=color:hotpink; class="nav-link active" href="<c:url value='/admin/acsBoardList.do'/>">공지관리</a>
     </li>
     <li class="nav-item">
       <a style=color:black; class="nav-link" href="<c:url value='/admin/openDailyAccountingList.do'/>">매출관리</a>
     </li>
     <li class="nav-item">
       <a  style=color:black; class="nav-link" href="javascript:void(window.open('https://desk.channel.io/#/channels/66232/user_chats/6172b6a2a9e910f2c971'))">고객채팅</a>
     </li>
   </ul>
</c:if>
   <div class="container" style="margin-top:20px;">
   <!-- search bar -->
   <div style="padding:10px; float:right; display:inline-block;">
      <form id="frm" method="post" action="/muscle/admin/SearchAcs.do">
         <input type="text" name="keyword" id="keyword" class="form-control"  placeholder="" style="width:300px; display:inline-block;">
        <input type="submit" value="검색" class="btn btn-primary btn-sm" style="display:inline-block; color:white; border-color:pink; background-color:pink; margin-bottom:5px;"/>
    </form>
   </div>
   <table align="center" class="table table-hover" style="cellpadding:7px;">
      <thead>
      <tr style="background-color:pink;">
         <th style="width:15%">
         <div class="dropdown">
            <a type="button" class="dropdown-toggle" data-toggle="dropdown">전 체</a>
            <div class="dropdown-menu">
               <a class="dropdown-item" href="/muscle/admin/allList.do">전 체</a>
               <a class="dropdown-item" href="/muscle/admin/notice.do">공지 </a>
               <a class="dropdown-item" href="/muscle/admin/event.do">이벤트</a>
            </div>
         </div>
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
                  <td>${row.NOTICE_TYPE}</td>
                  <td><a style=color:hotpink; href="#this" name="title">${row.NOTICE_TITLE}</a> <input type="hidden" id="NOTICE_NUM" value="${row.NOTICE_NUM}"></td>
                  <td>${row.NOTICE_WRITER}</td>
                  <td><fmt:formatDate pattern="yyyy/MM/dd" value="${row.NOTICE_DATE}" /></td>
                  <td>${row.NOTICE_COUNT}</td>
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
      <div align="right">
      <c:if test="${session_MEMBER.MEM_ADMIN == 'Y'}">
      <button style="background-color:pink; border-color:pink; color:white;" type="button" class="btn btn-primary btn-sm" onclick="location.href='/muscle/admin/openAcsWrite.do'">글 작성</button>
      </c:if>
      </div>
   </div>
  </div>
   <br>
   <script type="text/javascript">
   $(document).ready(function(){
      $("a[name='title']").on("click",function(e){
         e.preventDefault();
         fn_openBoardDetail($(this));
         });
   });
   function fn_openBoardDetail(obj){
      var comSubmit = new ComSubmit();
      comSubmit.setUrl("<c:url value='/admin/openAcsDetail.do'/>");
       comSubmit.addParam("NOTICE_NUM", obj.parent().find("#NOTICE_NUM").val());
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