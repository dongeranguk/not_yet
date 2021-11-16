<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script language="JavaScript">
$(document).ready(function() { //nick check

   
    $("#nickCheck").on("click", function(e) {
       e.preventDefault();
       fn_nickCheck();
    });
 });
 
function fn_nickCheck(){ //nick check
if(!$("#MEM_NICK").val()){
       alert("닉네임을 입력하세요");
       $("#MEM_NICK").focus();
       return false;
}
   var MEM_NICK = {MEM_NICK : $('#MEM_NICK').val()};
 $.ajax({
     url:"<c:url value='/member/nickCheck.do'/>",
     type:'get',
     data: MEM_NICK,
     success:function(data){    
         if($.trim(data)=="0"){
            alert("사용가능한 닉네임입니다.");       
         }else{
            alert("중복된 닉네임입니다.");
             $('#MEM_NICK').val('');
             $('#MEM_NICK').focus();
         }
     },
     error:function(){
             alert("닉네임을 입력하세요");
     }
 });
};


</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   function DaumAddressAPI() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  
                  var addr = ''; // 
                  var extraAddr = ''; 

                  
                  if (data.userSelectedType === 'R') { 
                     addr = data.roadAddress;
                  } else { 
                     addr = data.jibunAddress;
                  }

                  
                  if (data.userSelectedType === 'R') {
                     if (data.bname !== ''
                           && /[동|로|가]$/g
                                 .test(data.bname)) {
                        extraAddr += data.bname;
                     }
                     
                     if (data.buildingName !== ''
                           && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', '
                              + data.buildingName
                              : data.buildingName);
                     }
                     
                     if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr
                              + ')';
                     }
                     /* 
                     document
                           .getElementById("MEM_ADDRESS3").value = extraAddr; */

                  } /* else {
                     document
                           .getElementById("MEM_ADDRESS3").value = '';
                  } */

                  
                  document
                        .getElementById('MEM_ZIPCODE').value = data.zonecode;
                  document
                        .getElementById("MEM_ADDRESS1").value = addr;
                  
                  document.getElementById(
                        "MEM_ADDRESS2")
                        .focus();
               }
            }).open();
   }
</script>
<title>근.방.위 회원가입</title>
</head>
<body>
   <%@ include file="/WEB-INF/views/template/header.jsp"%>

   <div style="height: 160px;"></div>
   <div align="center">
      <h3>My Page</h3>
   </div>
   <div style="height: 50px;"></div>
   
   <form id="frm" name="frm" class="form-inline" method="post">
      <table class="joinFormView" style="border:0; cellpadding:1; cellspacing:1;" align="center">
            <tr> 
               <td style="width:150px; padding-right:15px;" align="right" > 사용자 ID</td>
               <td colspan="2">
               <input type="text" id="MEM_ID" name="MEM_ID" size="15" maxlength="12" class="form-control" placeholder="아이디" readonly value="${map.MEM_ID}" style="width:100%;">
               </td>
            </tr>
               
            <tr>
               <td style="width:150px; padding-right:15px;" align="right" > 비밀번호</td>
               <td colspan="2">
               <input type="password" id="MEM_PW" name="MEM_PW" size="15" maxlength="12" class="form-control" placeholder="비밀번호" style="width:100%;">
               </td>
            </tr>
            
            <tr>
               <td style="width:150px; padding-right:15px;" align="right"> 비밀번호 확인</td>
                 <td colspan="2">
                 <input type="password" id="MEM_PW2" name="MEM_PW2" size="15" maxlength="12" class="form-control" placeholder="비밀번호 확인" style="width:100%;">
                 </td>
              </tr>
            
            <tr>
               <td style="width:150px; padding-right:15px;" align="right" > 사용자 이름</td>
               <td colspan="2">
               <input type="text" id="MEM_NAME" name="MEM_NAME" size="15" maxlength="12" class="form-control" placeholder="이름" value="${map.MEM_NAME}" style="width:100%;">
               </td>
            </tr>
            
            <tr>
               <td style="width:150px; padding-right:15px;" align="right" > 닉네임</td>
               <td>
               <input type="text" id="MEM_NICK" name="MEM_NICK" size="15" maxlength="12" class="form-control" placeholder="닉네임" value="${map.MEM_NICK}" style="width:100%;">
               </td>
               <td>
               <input type="button" name="nickCheck" value="중복확인" class="btn btn-outline-primary mb-2"  OnClick="fn_nickCheck()" style="width:100%;">
               </td>
            </tr>
            
            <tr>
                  <td style="width:150px; padding-right:15px;" align="right">이메일</td>
                <td colspan="2">
                  <input type="text" id="MEM_EMAIL" name="MEM_EMAIL" size="40" maxlength="30" class="form-control" placeholder="이메일" value="${map.MEM_EMAIL}" style="width:100%;">
                </td>
             </tr>
             
             <tr>
                <td style="width:150px; padding-right:15px;" align="right"> 연락처</td>
                <td colspan="2">
                <input type="text" id="MEM_PHONE" name="MEM_PHONE" size="40" maxlength="12" placeholder="연락처(- 없이 숫자만 입력)" value="${map.MEM_PHONE}"
                 oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"  class="form-control" placeholder="PHONE" style="width:100%;">
                </td>
             </tr>

             <tr>
             <td style="width:150px; padding-right:15px;" align="right" rowspan="2"> 주 소</td>
             <td>
             <input type="text" id="MEM_ZIPCODE" name="MEM_ZIPCODE" placeholder="우편번호" size="15" class="form-control" value="${map.MEM_ZIPCODE}" readonly style="width:100%;">
             </td>
             <td>
            <input type="button" onclick="DaumAddressAPI()" class="btn btn-outline-primary mb-2" value="우편번호 찾기" style="width:100%;"><br>
            </td>
            </tr>
            <tr>
            <td colspan="2">
            <input type="text" name="MEM_ADDRESS1" id="MEM_ADDRESS1" placeholder="주소" value="${map.MEM_ADDRESS1}" size="40" class="form-control" style="width:100%;"><br>
            <input type="text" name="MEM_ADDRESS2" id="MEM_ADDRESS2" placeholder="상세주소" value="${map.MEM_ADDRESS2}" size="40" class="form-control" style="width:100%;">
            </td>
            </tr>
         
         <tr>
            <td style="width:150px; padding-right:15px;" align="right" rowspan="2">마케팅 수신 동의</td>
            <td colspan="2">
            <br>
            Email 수신 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="form-check form-check-inline" style="display: inline-block;">
              <label class="form-check-label" for="inlineRadio1"><input class="form-check-input" type="radio" name="MEM_EMAILCK" id="email1" value="Y" checked="checked">동의</label>
            </div>
            <div class="form-check form-check-inline" style="display: inline-block;">
              <label class="form-check-label" for="inlineRadio2"><input class="form-check-input" type="radio" name="MEM_EMAILCK" id="email2" value="N">동의 안함</label>
            </div>
            </td>
         </tr>
         
            <tr>
               <td colspan="2">
               SNS 수신 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
               <div class="form-check form-check-inline" style="display: inline-block;">
              <label class="form-check-label" for="inlineRadio1"><input class="form-check-input" type="radio" name="MEM_PHONECK" id="phone1" value="Y" checked="checked">동의</label>
            </div>
            <div class="form-check form-check-inline" style="display: inline-block;">
              <label class="form-check-label" for="inlineRadio2"><input class="form-check-input" type="radio" name="MEM_PHONECK" id="phone2" value="N">동의 안함</label>
            </div>
               </td>
            </tr>
            <tr>
               <td colspan="3" align="center">
               <br>
               <a href="#this" class="btn" id="modify"><input type="button" class="btn btn-primary mb-2" value="수정하기" style="margin-left:90px;"/></a> 
               <input type="button" value="취 소" class="btn btn-outline-primary mb-2" onclick="javascript:window.location='/muscle/member/openMyInfoForm.do'" />&nbsp;&nbsp;&nbsp;
               <a href="#this" class="btn" id="delete"><input type="button" value="회원탈퇴" class="btn btn-outline-primary mb-2"  /></a> 
               </td>
            </tr>

      </table>
</form>

   <%@ include file="/WEB-INF/include/include-body.jspf"%>
   <div style="height: 80px;"></div>
   <footer style="border-top: 1px solid #D5D5D5;">
      <%@ include file="/WEB-INF/views/template/footer.jsp"%>
   </footer>
   
   
   <script type="text/javascript">

      $("#modify").on("click", function(e) {
       e.preventDefault();
         fn_modifySc();
      });

      function fn_modifySc(){
         
          
         var comSubmit = new ComSubmit("frm");
       comSubmit.setUrl("<c:url value='/member/updateMyInfo.do' />");

       if(!$("#MEM_PW").val()){
             alert("비밀번호를 입력하세요");
             $("#MEM_PW").focus();
             return false;
          }

          if(!$("#MEM_PW2").val()){
             alert("비밀번호를 확인하세요");
             $("#MEM_PW2").focus();
             return false;
          }

          if($("#MEM_PW").val() != $("#MEM_PW2").val()){
             alert("비밀번호가 일치하지 않습니다.");
             $("#MEM_PW2").focus();
             return false;
          }            

          if(!$("#MEM_NAME").val()){
             alert("이름을 입력하세요");
             $("#MEM_NAME").focus();
             return false;
          }

          if(!$("#MEM_NICK").val()){
             alert("닉네임 입력하세요");
             $("#MEM_NICK").focus();
             return false;
          }

          if(!$("#MEM_PHONE").val()){
             alert("연락처를 입력하세요");
             $("#MEM_PHONE").focus();
             return false;
          }

          if(!$("#MEM_ZIPCODE").val()){
             alert("우편번호를 입력하세요");
             $("#MEM_ZIPCODE").focus();
             return false;
          }

          if(!$("#MEM_ADDRESS1").val()){
             alert("주소를 입력하세요");
             $("#MEM_ADDRESS1").focus();
             return false;
          }

          if(!$("#MEM_ADDRESS2").val()){
             alert("상세주소를 입력하세요");
             $("#MEM_ADDRESS2").focus();
             return false;
          }

          alert("수정이 완료 되었습니다.");
          comSubmit.submit();
      }

      $("#delete").on("click", function(e) {
          e.preventDefault();
            fn_delete();
         });

      function fn_delete(){
        var del;
        del = confirm("정말로 탈퇴 하시겠습니까?");
        var comSubmit = new ComSubmit("frm");
        if(del){
         alert("그동안 이용해 주셔서 감사합니다.");
         comSubmit.setUrl("<c:url value='/member/deleteMyInfo.do' />");         
           comSubmit.submit();     
        }
        else{
          history.go(-1);
          }  
      }  
      </script>
</body>
</html>