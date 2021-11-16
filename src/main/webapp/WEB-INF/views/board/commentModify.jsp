<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
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
      <button type="button" class="btn btn-outline-warning btn-sm" style="margin-right:10px;">신고</button>
   </div>
   <br>
   <hr>
   
   <!-- 카테고리 / 제목 -->
   <div>
      <h4>[${map.BOARD_CAT}] ${map.BOARD_TITLE}</h4>
      <span>작성자 ${map.BOARD_NICK}</span>
      <span style="float:right;"> ${map.BOARD_DATE} | 조회 ${map.BOARD_COUNT} | 추천 0</span>
   </div>
   <hr>
   
   <!-- 내용 -->
   <div style="padding:20px;">
      <span>${map.BOARD_CONTENT}</span>
   </div>
   
   <!--  추천 
   <div style="height:70px;" align="center">
      <button type="button" class="btn btn-outline-danger" style="margin-top:40px;"><span class="glyphicon glyphicon-star"></span>추천하기</button>   
   </div> -->
   <hr>
   
 
<form name="frm" id="frm" method="post" enctype="multipart/form-data">

<input type="hidden" name="BOARD_NUM" id="BOARD_NUM" value="${map.BOARD_NUM}">
<input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}"/>
<input type="hidden" id="COMMENTS_NUM" name="COMMENTS_NUM" value="${map.COMMENTS_NUM}"/>
<div style="display:inline-block; width:88%;">
<textarea name="COMMENTS_CONTENT" id="COMMENTS_CONTENT" class="form-control" width="100%" placeholder="수정 할 댓글을 입력하세요" >${map.COMMENTS_CONTENT}</textarea>
</div>
<div style="display:inline-block; float:right; width:10%;">
<a href="#this" id="commentWrite"><input type="button" value="수정하기" class="btn btn-primary" style="width:100%; height:59px;"></a> 

</div>
<hr>
</form>


<%@ include file="commentListModify.jsp" %>

<hr>
<div style="float:right;">
      <c:if test="${session_MEMBER.MEM_NUM != null && session_MEMBER.MEM_NICK == map.BOARD_NICK }">
      <a href="#this" class="btn" id="modify"><button type="button" class="btn btn-outline-primary" style="margin-right:6px;">수정</button></a>
      <a href="#this" class="btn" id="delete"><button type="button" class="btn btn-outline-primary" style="margin-right:6px;">삭제</button></a>
      </c:if>
      <button type="button" class="btn btn-outline-primary" onclick="location.href='/muscle/board/openBoardList.do'" style="margin-right:6px;">목록</button>
      <button type="button" class="btn btn-primary" onclick="location.href='/muscle/board/openBoardWrite.do'">글쓰기</button>
   </div>





</div>
<script type="text/javascript">
   
   $("#commentWrite").on("click", function(e){
      e.preventDefault();
      commentWrite();
   });

   $("#delete").on("click", function(e){ 
      e.preventDefault();
      fn_deleteBoard();
   });

   $("#modify").on("click", function(e){ 
      e.preventDefault();
      fn_openBoardModify();
   });

   function commentWrite(){
      var comSubmit = new ComSubmit("frm");
         comSubmit.setUrl("<c:url value='/comment/updateComment.do' />");
         if (!$("#COMMENTS_CONTENT").val()) {
            alert("내용을 입력하세요.");
            $("#COMMENTS_CONTENT").focus();
            return false;
         }
       alert("댓글이 정상적으로 수정 되었습니다.");
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
</script>

<%@ include file="/WEB-INF/include/include-body.jspf" %>
<!-- footer       -->
<div style="height:100px;"></div>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>

</body>
</html>