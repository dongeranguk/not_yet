<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   <h3>Member</h3> 
</div>
<div style="height: 50px;"></div>

<div class="container" style="width:50%;">
   <table class="table" style="border:0;cellpadding:1; cellspacing:1; width:100%;" align="center">
      <tr>
      <th style="width:30%;">회원번호</th>
      <td align="center" style="width:*;">${map.MEM_NUM}</td>
      </tr>
      
      <tr>
      <th>아이디</th>
      <td align="center">${map.MEM_ID}</td>
      </tr>
      
      <tr>
      <th>이 름</th>
      <td align="center">${map.MEM_NAME}</td>
      </tr>
      
      <tr>
      <th>닉네임</th>
      <td align="center">${map.MEM_NICK}</td>
      </tr>
      
      <tr>
      <th>이메일</th>
      <td align="center">${map.MEM_EMAIL}</td>
      </tr>
      
      <tr>
      <th>연락처</th>
      <td align="center">${map.MEM_PHONE}</td>
      </tr>
      
      <tr>
      <th>우편번호</th>
      <td align="center">${map.MEM_ZIPCODE}</td>
      </tr>
      
      <tr>
      <th>주 소</th>
      <td align="center">${map.MEM_ADDRESS1}</td>
      </tr>
      
      <tr>
      <th>상세주소</th>
      <td align="center">${map.MEM_ADDRESS2}</td>
      </tr>
      
      <tr>
      <th>가입날짜</th>
      <td align="center">${map.MEM_JOINDATE}</td>
      </tr>
      
      <tr>
      <th>제재내역</th>
      <td align="center">${map.MEM_WARNING}</td>
      </tr>
   </table>
   <form id="frm" name="frm">
   <table class="table">
      <tr>
         <th>회원상태</th>
         <td>
         <select id="MEM_DEL_GB" name="MEM_DEL_GB">
            <option value="${map.MEM_DEL_GB}">${map.MEM_DEL_GB}</option>
            <option value="N">N</option>
            <option value="Y">Y</option>
         </select>
         </td>
      </tr>
   </table>
   <hr>
   <div style="float:right;">
   <a href="#this" name="ignore"><input type="button" class="btn btn-primary" value="저장">
   <input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${map.MEM_NUM}">
   </a>
   </div>
</form>
</div>

<!-- footer -->
<div style="height:80px;"> 
</div>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>


<script type="text/javascript">
   $(document).ready(function(){
       $("a[name='ignore']").on("click", function(e){
         e.preventDefault();
         fn_ignore();
       });
   }); 

   function fn_ignore(){
      var comSubmit = new ComSubmit();
      comSubmit.setUrl("<c:url value='/admin/ignoreAdminMember.do' />");
      comSubmit.addParam("MEM_NUM", $("#MEM_NUM").val());
      comSubmit.addParam("MEM_DEL_GB", $("#MEM_DEL_GB").val());
      comSubmit.submit();
      }
</script>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
</body>
</html>