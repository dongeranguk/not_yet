<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>

<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script>
$('a[href="#settings"]').tab('show');
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<!-- header -->
<div style="height: 160px;"></div>
<div align="center">
   <h3>신고관리</h3> 
</div>
<div style="height: 30px;"></div>

<!-- body -->

<div align="center" style="width:1000px; margin-left:auto; margin-right:auto;">

    <ul class="nav nav-tabs">
      <li class="nav-item">
       <a style=color:black; class="nav-link" href="<c:url value='/admin/openAdminMember.do'/>">회원관리</a>
     </li>
     <li class="nav-item">
       <a style=color:black; class="nav-link" href="<c:url value='/admin/openAdminGoods.do'/>">상품관리</a>
     </li>
     <li class="nav-item">
       <a style=color:pink; class="nav-link active" href="<c:url value='/report/openAdminReport.do'/>">신고관리</a>
     </li>
     <li class="nav-item">
       <a style=color:black; class="nav-link" href="<c:url value='/admin/acsBoardList.do'/>">공지관리</a>
     </li>
     <li class="nav-item">
       <a style=color:black; class="nav-link" href="<c:url value='/admin/openDailyAccountingList.do'/>">매출관리</a>
     </li>
     <li class="nav-item">
       <a style=color:black; class="nav-link" href="javascript:void(window.open('https://desk.channel.io/#/channels/66232/user_chats/6172b6a2a9e910f2c971'))">고객채팅</a>
     </li>
   </ul>

   <div class="container" style="margin-top:20px;">
   <!-- search bar -->
   <div style="padding:10px; float:right; display:inline-block;">
      <form id="frm" method="post" action="http://localhost:8007/muscle/board/SearchBoard.do">
         <input type="text" name="keyword" id="keyword" class="form-control"  placeholder="" style="width:300px; display:inline-block;">
        <input type="submit" value="검색" class="btn btn-primary btn-sm" style="display:inline-block; background-color:pink; color:white; border-color:pink;  margin-bottom:5px;"/>
    </form>
   </div>
   
      <table align="center" class="table table-hover" style="cellpadding:7px;">
      <thead>
      <tr style="background-color:pink;">
         <th style="width:15%">신고번호</th>
         <th style="width:15%">회원번호</th>
         <th style="width:20%">아이디</th>
         <th style="width:20%">닉네임</th>
         <th style="width:10%">누적횟수</th>
         <th style="width:10%">비고</th>
         <th style="width:10%">처리상태</th>
      </tr>
      </thead>
      <tbody>
      <c:choose>
         <c:when test="${fn:length(list) > 0 }">
            <c:forEach items="${list}" var="row">
               <tr>
                  <td>${row.REPORT_NUM}</td>
                  <td>
                   <c:if test="${row.REPORT_BOARD_NUM != null}">
                      ${row.REPORT_MEM_NUM1}
                  </c:if>
                  <c:if test="${row.REPORT_COMMENT_NUM != null}">
                     ${row.REPORT_MEM_CNUM}
                  </c:if>
                 </td>
                  <td>${row.MEM_ID}</td>
                  <td>${row.MEM_NICK}</td>
                  <td>${row.CNT}</td>
                  <td>
                  <c:if test="${row.REPORT_MEM_NUM1 != null}">
                     게시물
                  </c:if>
                  <c:if test="${row.REPORT_MEM_NUM1 == null}">
                     댓글
                  </c:if>
                  </td>
                  <td>
                  <a href="#this" name="adminDetail">
                  <input type="hidden" name="REPORT_NUM" id="REPORT_NUM" value="${row.REPORT_NUM}"/>
                     <c:if test="${row.REPORT_STATE == '0'}">
                        대기
                     </c:if>
                     <c:if test="${row.REPORT_STATE == '1'}">
                        취소
                     </c:if>
                     <c:if test="${row.REPORT_STATE == '2'}">
                        완료
                     </c:if>
                  </a>
                  </td>
               </tr>
            </c:forEach>
         </c:when>
      <c:otherwise>
         <tr>
            <td colspan="7" align=center> 조회된 결과가 없습니다.</td>
         </tr>
      </c:otherwise>
      </c:choose>
      </tbody>
      </table>
      <hr>
      
</div>

</div>

<%@ include file="/WEB-INF/include/include-body.jspf" %>
<!-- footer -->
<div style="height:80px;"> 
</div>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>

<script type="text/javascript">
   $(document).ready(function(){
      $("a[name='adminDetail']").on("click",function(e){ 
         e.preventDefault();
         fn_openAdminReportDetail($(this));
         });
      });

   function fn_openAdminReportDetail(obj){
      var comSubmit = new ComSubmit(); 
      comSubmit.setUrl("<c:url value='/report/openAdminReportDetail.do'/>");
      comSubmit.addParam("REPORT_NUM", obj.parent().find("#REPORT_NUM").val());
       comSubmit.submit();
      }
</script>

</body>
</html>