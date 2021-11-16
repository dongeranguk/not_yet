<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 
   <script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
   <script src="//cdn.ckeditor.com/4.4.4/standard/ckeditor.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div style="height: 160px;"></div>

<!-- title -->
<div align="center">
   <h3><b>Community</b></h3> 
</div>
<div style="height: 50px;"></div>

<!-- body -->
<form id="frm" name="frm" enctype="multipart/form-data">
<div class="container" id="frm" style="width:60%;">
   <div style="margin-bottom:15px;">
      <!-- 카테고리 -->
      <div style="display:inline-block; width:19%;">
         <select class="form-control" id="BOARD_CAT" name="BOARD_CAT">
            <option>카테고리 선택</option>
            <option value="HomeTraining">Home Training</option>
            <option value="HealthyDiet">Healthy Diet</option>
            <option value="HomeCare">Home Care</option>
            <option value="etc">기타</option>
         </select>
      </div>
      <!-- 제목 -->
      <div style="display:inline-block; width:80%; float:right;">
         <input type="text" id="BOARD_TITLE" name="BOARD_TITLE" class="form-control" placeholder="제목을 입력해주세요." style="width:100%;">
         <input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}"/>
         <input type="hidden" id="MEM_NICK" name="MEM_NICK" value="${session_MEMBER.MEM_NICK}"/>
      </div>
   </div>
   <!-- 내용 -->
   <div style="margin-bottom:15px;">
      <textarea class="form-control" id="BOARD_CONTENT" name="BOARD_CONTENT" placeholder="내용을 입력해주세요." rows="12"></textarea> 
   </div>
  <!-- 첨부파일 -->
<!--     <div class="custom-file" style="margin-bottom:15px;">
     <input type="file" class="custom-file-input" id="customFile">
     <label class="custom-file-label" for="customFile">첨부 파일</label>
     <input type="file" name="file">
   </div> -->
   <!-- 버튼 -->
   <div align="center">
        <a href="#this" id="write"><input style="background-color:hotpink; color:white; border-color:hotpink" type="button" class="btn btn-primary" value="글 작성"></a>
      <input style="color:white; background-color:pink; border-color:pink;" type="button" class="btn btn-outline-primary" value="목록으로" onclick="location.href='/muscle/board/openBoardList.do'">
   </div>
</div>
</form>
<!-- footer       -->
<div style="height:80px;"></div>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>
<script type="text/javascript">

CKEDITOR.replace('BOARD_CONTENT',{
	   filebrowserUploadUrl:"${pageContext.request.contextPath}/ckeditor/fileupload.do"});
   
   $("#insertBoard").on("click", function(e){
      e.preventDefault();
      fn_insertBoard();
   });

   $("#write").on("click", function(e){ //작성하기 버튼
       e.preventDefault();
       fn_insertBoard();
    });

function fn_insertBoard(){

   var comSubmit = new ComSubmit("frm");
      comSubmit.setUrl("<c:url value='/board/insertBoard.do' />");

		if (!$("#BOARD_CAT").val() || $("#BOARD_CAT").val() == '카테고리 선택') {
			alert("카테고리를 선택하세요.");
			$("#BOARD_CAT").focus();
			return false;
		}

		if (!$("#BOARD_TITLE").val()) {
			alert("제목을 입력하세요.");
			$("#BOARD_TITLE").focus();
			return false;
		}

		if (CKEDITOR.instances.BOARD_CONTENT.getData() =='' 
            || CKEDITOR.instances.BOARD_CONTENT.getData().length ==0) {
			alert("내용을 입력하세요.");
			$("#BOARD_CONTENT").focus();
			return false;
		}

		alert("게시판이 정상적으로 등록 되었습니다.");
		comSubmit.submit();

	}
</script>

</body>
</html>