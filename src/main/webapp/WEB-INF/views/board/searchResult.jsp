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
<%@ include file="/WEB-INF/views/template/header.jsp"%>



<div style="height: 160px;"></div>
<div align="center">
   <h3>Community</h3> 
</div>
<div style="height: 50px;"></div>

<div class="container" style="width:70%;">
   <!-- search bar -->
   <div style="padding:10px; display:inline-block;">
      <form id="frm" method="post" action="/muscle/board/openBoardSearch.do">
      
      <!-- <input type="hidden" name="search_param" value="all" id="search_param"> -->         
         <input type="text" name="keyword" id="keyword" class="form-control"  placeholder="" style="width:300px; display:inline-block;">
        <input type="submit" value="검색" class="btn btn-primary btn-sm" style="display:inline-block; margin-bottom:5px;"/>
           
    </form>
   </div>
   
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <strong>${keyword} </strong>(으)로 검색된 상품

   <!-- 정렬순서 -->
   <div style="display:inline-block; float:right; margin-top:18px; margin-right:5px;">
   <table>
      <tr>
         <td><a href="http://localhost:8007/muscle/board/RecentlyBoard.do">최신순</a></td> <td>&nbsp;|&nbsp;</td>
         <td><a href="http://localhost:8007/muscle/board/CountBoard.do">조회순</a></td>
      </tr>
   </table>
   </div>

      <table name="boardList" align="center" class="table table-striped table-hover" style="cellpadding:7px;">
      <thead>
      <tr>
         <td style="width:15%">
         <div class="dropdown">
            <a type="button" class="dropdown-toggle" data-toggle="dropdown">카테고리</a>
            <div class="dropdown-menu">
               <a class="dropdown-item" href="http://localhost:8007/muscle/board/openBoardList.do">전체</a>
               <a class="dropdown-item" href="http://localhost:8007/muscle/board/HomeTrainingBoard.do">Home Training</a>
               <a class="dropdown-item" href="http://localhost:8007/muscle/board/HealthyDietBoard.do">Healthy Diet</a>
               <a class="dropdown-item" href="http://localhost:8007/muscle/board/HomeCareBoard.do">Home Care</a>
               <a class="dropdown-item" href="http://localhost:8007/muscle/board/etcBoard.do">기타</a>
            </div>
         </div>
         </td>
         <td style="width:45%">제목</td>
         <td style="width:13%">작성자</td>
         <td style="width:12%">작성일</td>
         <td style="width:8%">조회수</td>
      </tr>
      </thead>
      <tbody>
   <%--    <c:choose>
         <c:when test="${fn:length(list) > 0 }">
            <c:forEach items="${list}" var="row">
               <tr>
                  <td>${row.BOARD_CAT}</td>
                   <c:if test="${session_MEMBER.MEM_NUM != null}">
                  <td class="title"><a href="#this" name="title">                  
                  ${row.BOARD_TITLE} [${row.TOTAL_COMMENTS}]</a>
                  <input type="hidden" id="BOARD_NUM" value="${row.BOARD_NUM}">
                  </td>
                  </c:if>
                  <c:if test="${session_MEMBER.MEM_NUM == null}">
                     <td class="title"><a href="#this" name="titleles">                  
                    ${row.BOARD_TITLE} [${row.TOTAL_COMMENTS}]</a>
                    <input type="hidden" id="BOARD_NUM" value="${row.BOARD_NUM}">                
                  </c:if>
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
      </c:choose> --%>
      </tbody>
      </table>
      
      <div id="PAGE_NAVI" align="center"></div>
      <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
      <input type="hidden" id="keyword" name="keyword" value="${keyword}" />
      <hr>
      <div align="right">
      <c:if test="${session_MEMBER.MEM_NUM != null}">
      <button type="button" class="btn btn-primary" onclick="location.href='/muscle/board/openBoardWrite.do'">글 작성</button>
      </c:if>
      </div>
      
</div>      
<!-- footer       -->
<div style="height:80px;"> 
 
</div>
<script type="text/javascript">
   $(document).ready(function(){
      fn_selectBoardList(1);
      
      $("a[name='title']").on("click",function(e){
         e.preventDefault();
         fn_openBoardDetail($(this));
         });

      $("a[name='titleles']").on("click",function(e){
          e.preventDefault();
          alert("로그인 후 열람 가능합니다.");
          return false;
          });
      });

   function fn_openBoardDetail(obj){
      var comSubmit = new ComSubmit(); 
      comSubmit.setUrl("<c:url value='/board/openBoardDetail.do'/>");
       comSubmit.addParam("BOARD_NUM", obj.parent().find("#BOARD_NUM").val());
       comSubmit.submit();
      }

   function fn_selectBoardList(pageNo){
      var comAjax = new ComAjax;
      comAjax.setUrl("<c:url value='/board/boardSearch.do' />");
      comAjax.setCallback("fn_selectBoardListCallback");
      comAjax.addParam("PAGE_INDEX", pageNo);
      comAjax.addParam("PAGE_ROW", 15);
      comAjax.addParam("keyword", $('#keyword').val());
      comAjax.ajax();
   }

   function fn_selectBoardListCallback(data){
      var total = data.TOTAL;
      var body = $("table[name='boardList']>tbody");
      body.empty();
      if(total==0){
         var str = "<tr>" + "<td colspan="5"> 조회된 결과가 없습니다.</td>" + "</tr>";
         body.append(str);
         }else{
            var params = {
                  divId : "PAGE_NAVI",
                     pageIndex : "PAGE_INDEX",
                     totalCount : total,
                     recordCount : 15,
                     eventName : "fn_selectBoardList"
                  };
             gfn_renderPaging(params);

             var str = "";
             $.each(data.list,function(key, value) {

            str += "<tr>"
               + "<td>"
               + value.BOARD_CAT
               + "</td>"
               + "<td>"
               + value.BOARD_TITLE
               + "</td>"
               + "<td>"
               + value.MEM_NICK
               + "</td>"
               + "<td>"
               + value.BOARD_DATE
               + "</td>"
               + "<td>"
               + value.BOARD_COUNT
               + "<input type='hidden' id='BOARD_NUM' name='BOARD_NUM' value=" + value.BOARD_NUM + ">"
               + "</td>"
               + "</tr>";   
            });
               body.append(str);
      }
   }
</script>


<%@ include file="/WEB-INF/include/include-body.jspf" %>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>

</body>
</html>