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
</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div style="height: 160px;"></div>

<!-- title -->
<div align="center">
   <h3>Notice</h3> 
</div>
<div style="height: 50px;"></div>

<!-- body -->
<form id="frm" name="frm" enctype="multipart/form-data">
<div class="container" id="frm" style="width:60%;">
   <div style="margin-bottom:15px;">
      <!-- 카테고리 -->
      <div style="display:inline-block; width:19%;">
         <select class="form-control" id="NOTICE_TYPE" name="NOTICE_TYPE">
            <option>카테고리 선택</option>
            <option value="공 지">공 지</option>
            <option value="이벤트">이벤트</option>
         </select>
      </div>
      <input type="hidden" id="NOTICE_WRITER" name="NOTICE_WRITER" value="${session_MEMBER.MEM_NICK}"/>
      <!-- 제목 -->
      <div style="display:inline-block; width:80%; float:right;">
         <input type="text" id="NOTICE_TITLE" name="NOTICE_TITLE" class="form-control" placeholder="제목을 입력해주세요." style="width:100%;">
      </div>
   </div>
   <!-- 내용 -->
   <div style="margin-bottom:15px;"><textarea class="form-control" id="NOTICE_CONTENT" name="NOTICE_CONTENT" placeholder="내용을 입력해주세요." rows="12"></textarea> 
   </div>
   <!-- 버튼 -->
   <div align="center">
        <a href="#this" id="write"><input type="button" class="btn btn-primary" value="공지 등록"></a>
      <input type="button" class="btn btn-outline-primary" value="취 소" onclick="location.href='/muscle/admin/acsBoardList.do'">
   </div>
</div>
</form>
<!-- footer       -->
<div style="height:80px;"></div>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>
<script type="text/javascript">
    $("#write").on("click", function(e){ //작성하기 버튼
       e.preventDefault();
       fn_insertBoard();
    });

function fn_insertBoard(){

   var comSubmit = new ComSubmit("frm");
      comSubmit.setUrl("<c:url value='/admin/insertAcs.do' />");

		if (!$("#NOTICE_TYPE").val() || $("#NOTICE_TYPE").val() == '카테고리 선택') {
			alert("카테고리를 선택하세요.");
			$("#NOTICE_TYPE").focus();
			return false;
		}

		if (!$("#NOTICE_TITLE").val()) {
			alert("제목을 입력하세요.");
			$("#NOTICE_TITLE").focus();
			return false;
		}

		if (!$("#NOTICE_CONTENT").val()) {
			alert("내용을 입력하세요.");
			$("#NOTICE_CONTENT").focus();
			return false;
		}

		alert("게시판이 정상적으로 등록 되었습니다.");
		comSubmit.submit();

	}
</script>

</body>
</html>