<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  



<!DOCTYPE html>
<html>
<meta charset="utf-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>상품등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script src="<c:url value='../js/common1.js'/>" charset="utf-8"></script>
<head>
<script src="//cdn.ckeditor.com/4.4.4/standard/ckeditor.js"></script>
<%@ include file="/WEB-INF/include/include-header.jspf" %>

</head>

<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div style="height: 160px;"></div>
<div align="center">
      <h3>${title }</h3> 
</div>
<div style="height: 30px;"></div>

<br>
<div align="center" class="container" style="width:55%;">
<form name="frm" id="frm" enctype="multipart/form-data" method="post">
      <table align="center" style="border:none; cellpadding:10px; cellspacing:10px; width:100%;">
            
            <tr>
               <th>상품이름 </th>
               <td>
                  <input type="text" id="GOODS_NAME" name="GOODS_NAME" placeholder="상품이름입력" size="40" class="form-control"
                  style="padding:10px;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_NAME}"</c:if>>
               </td>
            </tr>
            
            
            <tr>
               <th>상품내용 </th>
               <td>
                  <textarea rows="30" cols="100" id="GOODS_CONTENT" name="GOODS_CONTENT">
                  <c:if test="${type eq 'modify'}">${map.GOODS_CONTENT}</c:if>
                  </textarea>

               </td>
            </tr>

            <tr>
               <th>카테고리/대분류 </th>
               <td>
                  <select name="GOODS_CATEGORY1" style="width:200px;">
                     <option value="홈트레이닝">홈트레이닝</option>
                     <option value="식품">식품</option>
                     <option value="홈케어">홈케어</option>
                  </select>
               </td>
            </tr>
            <tr>
               <th>카테고리/소분류 </th>
               <td>
                  <select name="GOODS_CATEGORY2" style="width:200px;">
                     <option value="운동복(남)">운동복(남)</option>
                     <option value="운동복(여)">운동복(여)</option>
                     <option value="운동용품">운동용품</option>
                     <option value="운동악세서리">운동악세서리</option>
                     <option value="식사대용">식사대용</option>
                     <option value="건강간식">건강간식</option>
                     <option value="보충제">보충제</option>
                     <option value="건강음료">건강음료</option>
                     <option value="향초">향초</option>
                     <option value="향수">향수</option>
                     <option value="디퓨저">디퓨저</option>
                     <option value="제습/가습">제습/가습</option>
                     <option value="무드등">무드등</option>
                  </select>
               </td>
            </tr>
            
            <tr>
               <th>상품원가 </th>
               <td>
                  <input type="text" name="GOODS_CPRICE" id="GOODS_CPRICE" placeholder="상품원가" size="40"  class="form-control"
                  style="padding:10px; width:70%;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_CPRICE}"</c:if>> 
               </td>
            </tr>
            
            <tr>
               <th>상품 회원가 </th>
               <td>
                  <input type="text" name="GOODS_MPRICE" id="GOODS_MPRICE" placeholder="상품회원가" size="40"  class="form-control"
                  style="padding:10px; width:70%;" value=<c:if test="${type eq 'modify'}">"${map.GOODS_MPRICE}"</c:if>>
               </td>
            </tr>
               
            <tr>
               <th>해시태그 </th>
               <td>
                  <input type="checkbox" name="HASH" id="HASH" value="SALE" style="padding:10px;"> 특가상품
                  <input type="checkbox" name="HASH" id="HASH" value="BEST" style="padding:10px;"> BEST
                  <input type="checkbox" name="HASH" id="HASH" value="MD PICK" style="padding:10px;"> MD PICK
                  <input type="checkbox" name="HASH" id="HASH" value="MUSTHAVE" style="padding:10px;"> MUSTHAVE
                  <input type="checkbox" name="HASH" id="HASH" value="NEED" style="padding:10px;"> 필수템
                  <input type="hidden" name="GOODS_HASH" id="GOODS_HASH" value="">
               </td>
            </tr>
            
            <tr>
               <th>상품사이즈 </th>
               <td>
                  <input type="checkbox" name="SIZE" value="FREE" style="padding:10px;"> FREE
                  <input type="checkbox" name="SIZE" value="S" style="padding:10px;"> S
                  <input type="checkbox" name="SIZE" value="M" style="padding:10px;"> M
                  <input type="checkbox" name="SIZE" value="L" style="padding:10px;"> L
                  <input type="checkbox" name="SIZE" value="XL" style="padding:10px;"> XL
                  <input type="hidden" name="GOODS_SIZE" id="GOODS_SIZE" value="">
               </td>
            </tr>
            
            <tr>
               <th>상품 색상 </th>
               <td>
                  <input type="checkbox" name="COLOR" value="RED" style="padding:10px;"> RED
                  <input type="checkbox" name="COLOR" value="BLUE" style="padding:10px;"> BLUE
                  <input type="checkbox" name="COLOR" value="BLACK" style="padding:10px;"> BLACK
                  <input type="checkbox" name="COLOR" value="WHITE" style="padding:10px;"> WHITE
                  <input type="checkbox" name="COLOR" value="GREEN" style="padding:10px;"> GREEN
                  <input type="hidden" name="GOODS_COLOR" id="GOODS_COLOR" value="">
               </td>
            </tr>
            
            <tr>
               <th>상품수량 </th>
               <td>
               <input type="text" name="GOODS_STOCK" id="GOODS_STOCK" placeholder="상품수량" size="40"  class="form-control"
               style="padding:10px; width:70%;" value=<c:if test="${type eq 'modify'}">${map.GOODS_STOCK}</c:if>>
               <input type="hidden" id="IDX" name="IDX" value="${map.GOODS_NUM}"> 
               </td>
            </tr>
            
      </table>
   
   <br>   
   <div align="center">
   <c:if test="${type eq 'write'}"><a href="#this" class="btn btn-primary" id="write" onClick="fn_chk()">작성하기</a></c:if>
   <c:if test="${type eq 'modify'}"><a href="#this" class="btn btn-primary" id="update" onClick="fn_chk()">수정하기</a></c:if>
   <input type="button" value="목록으로" class="btn btn-outline-primary" onclick="location.href='/muscle/admin/openAdminGoods.do'">
   </div>
</form>

</div>

<script type="text/javascript">

CKEDITOR.replace('GOODS_CONTENT',{
   filebrowserUploadUrl:"${pageContext.request.contextPath}/ckeditor/fileupload.do"});

var gfv_count = 1;

// $(document).ready(function() 함수 또는 코드가 호출 또는 실행되는 시점을
// 스케쥴링할 수 있게 해준다. 그 시점은 바로 문서객체모델이라고 하는 DOM
// (Document Object Model)이 모두 로딩되었을 때인데 이렇게
// $(document).ready(function() 안에 위치한 코드를 DOM이 모두 준비된 이후에 
// 실행되게끔 해준다.
$(document).ready(function() {
   $("#write").on("click", function(e){ //작성하기 버튼
      e.preventDefault();
      fn_insertBoard();
   });
   $("#update").on("click", function(e){ //수정하기 버튼
		e.preventDefault();
		fn_updateGoods();	
	});
});

function fn_insertBoard() { // 유효성체크
   var comSubmit = new ComSubmit("frm"); // 객체생성
   comSubmit.setUrl("<c:url value='/shop/goodsWrite.do'/>"); // url설정
   comSubmit.set
   
    // 게시글 제목 필요
    if(!$("#GOODS_NAME").val()){
        alert("제목를 입력해주세요.");
        $("#GOODS_NAME").focus();
        return false;
    }
       // 게시글 내용 필요
    if(CKEDITOR.instances.GOODS_CONTENT.getData() =='' 
            || CKEDITOR.instances.GOODS_CONTENT.getData().length ==0){
        alert("내용을 입력해주세요.");
        $("#GOODS_CONTENT").focus();
        return false;
    }
       
    // 상품원가 
    if(!$("#GOODS_CPRICE").val()){
        alert("상품원가를 입력해주세요.");
        $("#GOODS_CPRICE").focus();
        return false;
    }
    // 할인가
    if(!$("#GOODS_MPRICE").val()){
        alert("회원가를 입력해주세요.");
        $("#GOODS_MPRICE").focus();
        return false;
    }
      // HASH
     if(!$("#GOODS_HASH").val()){
        alert("HASH을 선택해주세요.");
        return false;
    }
 /*   // 사이즈
    if(!$("#GOODS_ATT_SIZE").val()){
        alert("상품사이즈를 선택해주세요.");
        return false;
    }  
    // 컬러
    if(!$("#GOODS_COLOR").val()){
        alert("상품컬러를 입력해주세요.");
        $("#GOODS_COLOR").focus();
        return false;
    }*/ 
    // 상품 수량
    if(!$("#GOODS_STOCK").val()){
        alert("상품수량을 입력해주세요.");
        $("#GOODS_STOCK").focus();
        return false;
    }

    comSubmit.submit();
    alert("상품이 등록 되었습니다.");
}

function fn_chk() {
   
   var obj = $("[name=HASH]");
   var chkArray = new Array(); //배열 선언

   $('input:checkbox[name=HASH]:checked').each(function() { //체크된 값을 가져옴
      chkArray.push(this.value);
   });
   $('#GOODS_HASH').val(chkArray);

   //alert($('#GOODS_PICK').val());

   
   var obj1 = $("[name=SIZE]");
   var chkArray1 = new Array(); //배열 선언

   $('input:checkbox[name=SIZE]:checked').each(function() { //체크된 값을 가져옴
      chkArray1.push(this.value);
   });
   $('#GOODS_SIZE').val(chkArray1);

   //alert($('#GOODS_ATT_SIZE').val());
   
   var obj2 = $("[name=COLOR]");
   var chkArray2 = new Array(); //배열 선언

   $('input:checkbox[name=COLOR]:checked').each(function() { //체크된 값을 가져옴
      chkArray2.push(this.value);
   });
   $('#GOODS_COLOR').val(chkArray2);
}

function fn_updateGoods(){
	var comSubmit = new ComSubmit("frm");
	comSubmit.setUrl("<c:url value='/admin/goodsModify.do' />");
	comSubmit.submit();
}

</script>
<br>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
   <!-- footer       -->
   <div style="height:100px;"></div>
   <footer style="border-top:1px solid #D5D5D5;">
   <%@ include file="/WEB-INF/views/template/footer.jsp"%> 
   </footer>
</body>
</html>

