   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <!DOCTYPE html>
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
   
   <!-- title -->
   <div align="center">
      <h3>Community</h3> 
   </div>
   <div style="height: 20px;"></div>
   
   <!-- body -->
   <div class="container" style="width:65%">
      <div style="display:inline-block; float:right;">
         <button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='/muscle/board/openBoardList.do'">목록</button>
      </div>
      <div style="display:inline-block; float:right;">
       <a href="#this" name="report1"><button type="button" class="btn btn-outline-warning btn-sm" style="margin-right:10px;">신고</button></a>
      </div>
      <br>
      <hr>
      
      <!-- 카테고리 / 제목 -->
      <div>
         <h4>[${map.BOARD_CAT}] ${map.BOARD_TITLE}</h4>
         <span>작성자 ${map.BOARD_NICK}</span>
         <input type="hidden" id="BOARD_NICK" name="BOARD_NICK" value="${map.BOARD_NICK}"/>
         <span style="float:right;"> ${map.BOARD_DATE} | 조회 ${map.BOARD_COUNT} | 추천 0</span>
      </div>
      <hr>
      
      <!-- 내용 -->
      <div style="padding:20px; margin-bottom:100px;">
         <c:if test="${session_MEMBER.MEM_NUM != null }">
         <span>${map.BOARD_CONTENT}</span>
         </c:if>
        <c:if test="${session_MEMBER.MEM_NUM == null }">
           <span style="color:gray; font-weight:bold;">로그인 후 이용해주세요.</span>
        </c:if>
      </div>
      
      <hr>
      <c:if test="${session_MEMBER.MEM_NUM != null}">
   <form name="frm" id="frm" method="post" enctype="multipart/form-data">
   
   <input type="hidden" name="BOARD_NUM" id="BOARD_NUM" value="${map.BOARD_NUM}">
   <input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}"/>
   <div style="display:inline-block; width:88%;">
   <textarea name="COMMENTS_CONTENT" id="COMMENTS_CONTENT" class="form-control" width="100%" placeholder="댓글을 입력해주세요."></textarea>
   </div>
   <div style="display:inline-block; float:right; width:10%;">
   <a href="#this" id="commentWrite"><input type="button" value="댓글쓰기" class="btn btn-primary" style="width:100%; height:59px;"></a> 
   
   </div>
   <hr>
   </form>
   
   
   <%@ include file="commentList.jsp" %>
   
   <hr>
      <div style="float:right;">
         <c:if test="${session_MEMBER.MEM_NUM != null && session_MEMBER.MEM_NICK == map.BOARD_NICK }">
         <a href="#this" id="modify"><button type="button" class="btn btn-outline-primary" style="margin-right:6px;">수정</button></a>
         <a href="#this" id="delete"><button type="button" class="btn btn-outline-primary" style="margin-right:6px;">삭제</button></a>
         </c:if>
         <a href="#this" name="list"><button type="button" class="btn btn-outline-primary" style="margin-right:6px;">목록</button></a>
         
         <button type="button" class="btn btn-primary" onclick="location.href='/muscle/board/openBoardWrite.do'">글쓰기</button>
   
      </div>
   </c:if>
   
   
<div id="fb-root"></div>
   <script async defer crossorigin="anonymous" src="https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v9.0" nonce="08ijNk7h"></script>
   <div class="fb-like" data-href="/muscle/board/openBoardDetail.do" data-width="" data-layout="standard" data-action="like" data-size="small" data-share="true"></div>
</div>

   <script type="text/javascript">
      $(document).ready(function(){

          $("a[name='list']").on("click", function(e){
            e.preventDefault();
            fn_list();
              });
          
      $("#commentWrite").on("click", function(e){
         e.preventDefault();
         commentWrite();
      });
   
      $("#delete").on("click", function(e){ //삭제하기 버튼
         e.preventDefault();
         fn_deleteBoard();
      });
   
      $("#modify").on("click", function(e){ //수정하기 버튼
         e.preventDefault();
         fn_openBoardModify();
      });

      $("a[name='report1']").on("click", function(e){ 
            e.preventDefault();
            fn_report1($(this));
         });

      });

      function fn_list(){
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("/muscle/board/openBoardList.do");
         
         comSubmit.submit();
          }
   
      function commentWrite(){
         var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/comment/insertComment.do' />");
   
            if (!$("#COMMENTS_CONTENT").val()) {
               alert("내용을 입력하세요.");
               $("#COMMENTS_CONTENT").focus();
               return false;
            }
          alert("댓글이 정상적으로 등록 되었습니다.");
         comSubmit.submit();
         }
   
      function fn_deleteBoard(){
         var comSubmit = new ComSubmit();
         var CONFIRM = confirm("정말로 삭제하시겠습니까?");
         if(CONFIRM==true){
         comSubmit.setUrl("<c:url value='/board/boardDelete.do' />");
         comSubmit.addParam("BOARD_NUM", $("#BOARD_NUM").val());
         comSubmit.submit();
         alert("삭제가 완료되었습니다.");
         }
      }
   
      function fn_openBoardModify(){
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/board/updateBoardForm.do' />");
         comSubmit.addParam("BOARD_NUM", $("#BOARD_NUM").val());
         comSubmit.submit();
      }

      function fn_report1(){
         var comSubmit = new ComSubmit();
         //window.open("<c:url value='/report/openReportBoardForm.do' />", "report", "width=600, height=380, left=100, top=50");
         comSubmit.setUrl("<c:url value='/report/openReportBoardForm.do'/>");
          comSubmit.addParam("BOARD_NUM", $("#BOARD_NUM").val());
          comSubmit.addParam("BOARD_NICK", $("#BOARD_NICK").val());
          comSubmit.addParam("BOARD_WRITER", $("#BOARD_WRITER").val());
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