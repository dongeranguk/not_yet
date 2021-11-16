<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
crossorigin="anonymous">
</head>
<!DOCTYPE html>
<style>
header{
    position : fixed;
    left : 0;
    top : 0; 
    width: 100%; 
    height:90px;
    z-index: 4;
    background-color:white;
}

.td{
   cellspacing:10px;
}
 
</style>
<script type="text/javascript"> 
   $(document).ready(function(){
      
   $("a[name='order']").on("click", function(e){
         e.preventDefault();
         myOrder();
      });
   });

 function myOrder() {
    <c:if test="${session_MEM_ID == null}">
    alert("로그인이 필요한 서비스 입니다.");
    return false;
    </c:if>
    var comSubmit = new ComSubmit();
   comSubmit.setUrl("/muscle/member/openMyOrderList.do");
   comSubmit.addParam("MEM_NUM", $("#MEM_NUM").val());
   comSubmit.submit();
   }

 function myPage() {
    <c:if test="${session_MEM_ID == null }">
    alert("로그인이 필요한 서비스 입니다.");
    return false;
    </c:if>

   window.location.href='/muscle/member/openMyInfoForm.do';
   }
 
 function basketList() {
       <c:if test="${session_MEM_ID == null }">
       alert("로그인이 필요한 서비스 입니다.");
       return false;
       </c:if>
       window.location.href='/muscle/shop/basketList.do'
 } 
 
 
$('.holder').on('click', function() {
     $this = $(this);
     if($this.hasClass('active')) {
       $this.fadeOut(500);
       setTimeout(function() {
         $this.removeClass('active')
       }, 500);
       setTimeout(function() {
         $this.fadeIn(500);
       }, 1000);
     } else {
       $(this).addClass('active');
     }
   });

   $(document).on('click', function(e) {
     container = $('.holder');
     if ($('.holder').hasClass('active') && !container.is(e.target)  && container.has(e.target).length === 0) {
       $this.fadeOut(500);
       setTimeout(function() {
         $this.removeClass('active')
       }, 500);
       setTimeout(function() {
         $this.fadeIn(500);
       }, 1000);
     }
   });
</script>
<header style="border-bottom:1px solid #c2c2c2;">  


<!-- 로고 -->
<div style="width:300px; margin-left:20px; float:left; padding:20px 0px 0px 0px;">
<a href="/muscle/main/openMainList.do">
  <span
style="
font-style: italic ; 
font-weight: bold;
font-size: 2.1em;
line-height: 1.0em; 
color: hotpink;
font-family: arial;
">
삼 대 오 백
</span>
   
</a>   
</div>
<c:choose>
<c:when test="${session_MEM_ID == null}">
<div style="float:right; width:360px; ">
 <table style="width:100%; padding:0px; margin:0px; border:0px; height:30px;">
      <tr style="margin:0px; padding:0px;">
         <td align="right" style="padding:0px;"><button type="button" onclick="location.href='/muscle/member/openLoginForm.do'" class="btn btn-link" style="padding:5px;"><font size='2' color='hotpink'>로그인</font>
               </button></td>
         <td align="right" style="padding:0px;"><button type="button" class="btn btn-link" style="padding:5px;" onclick="location.href='/muscle/member/openJoinForm.do'"><font size='2' color='hotpink'>회원가입</font>
              </button></td>
         <td align="right" style="padding:0px;"><a href="javascript:myPage();"><button type="button" class="btn btn-link" style="padding:5px;"><font size='2' color='hotpink'>마이페이지</font></button></a>  
         </td>
         <td align="right" style="padding:0px;"><a href="javascript:basketList();"><button type="button" class="btn btn-link" style="padding:5px;"><font size='2' color='hotpink'>장바구니</font></button></a>  
         </td> 
         <td align="right" style="padding:0px;"><a href="javascript:myOrder();"><button type="button" class="btn btn-link" style="padding:0px 15px 0px 5px;"><font size='2' color='hotpink'>주문조회</font></button></a>
         </td>
      </tr>
</table>
</div>
</c:when>

<c:when test="${session_MEM_ID != null}">
<c:if test="${session_MEMBER.MEM_ADMIN == 'N'}">
<div style="float:right; width:500px;">
 <table style="width:100%; padding:0px; margin:0px; border:0px; height:30px;">
      <tr style="margin:0px; padding:0px;">
          <td align="right" style="padding:0px;">${session_MEM_ID}<font size='2' color='hotpink'> 님 환영합니다!</font></td>   
         <td align="right" style="padding:0px; width:70px;"><button type="button" onclick="location.href='/muscle/member/logout.do'" class="btn btn-link" style="padding:5px; width:100;"><font size='2' color='hotpink'>로그아웃</font>
               </button></td>
         <td align="right" style="padding:0px; width:80px;"><a href="javascript:myPage();"><button type="button" class="btn btn-link" style="padding:5px;"><font size='2' color='hotpink'>마이페이지</font></button></a>  
         </td> 
         <td align="right" style="padding:0px; width:70px;"><a href="javascript:basketList();"><button type="button" class="btn btn-link" style="padding:5px;"><font size='2' color='hotpink'>장바구니</font></button></a></td>
         <td align="right" style="padding:0px; width:80px;"><a href="#this" name="order"><button type="button" class="btn btn-link" style="padding:0px 15px 0px 5px;"><font size='2' color='hotpink'>주문조회</font></button></a>
         <input type="hidden" name="MEM_NUM" id="MEM_NUM" value="${session_MEMBER.MEM_NUM}">
         </td>
      </tr>
</table> 
</div>
</c:if>

<c:if test="${session_MEMBER.MEM_ADMIN == 'Y'}">
<div style="float:right; width:450px; ">
<table style="width:100%; padding:0px; margin:0px; border:0px; height:30px; ">
      <tr style="margin:0px; padding:0px;">
        <td align="right" style="padding:0px;" class="td">${session_MEM_ID}<font size='2' color='hotpink'> 계정으로 로그인 했습니다.</font></td>
        <td align="right" style="padding:0px;" class="td"><button type="button" onclick="location.href='/muscle/member/logout.do'" class="btn btn-link" style="padding:5px;"><font size='2' color='hotpink'>로그아웃</font></button></td>
        <td align="right" style="padding:0px;" class="td"><button type="button" onclick="location.href='/muscle/admin/openAdminMember.do'" class="btn btn-link" style="padding:5px;"><font size='2' color='hotpink'>관리자페이지</font></button></td> 
        <td align="right" style="padding:0px;" class="td"><button type="button" onclick="location.href='/muscle/admin/order_admin_a.do'" class="btn btn-link" style="padding:0px 15px 0px 5px;"><font size='2' color='hotpink'>주문관리</font></button></td>        
      </tr>
</table>
</div>
</c:if>
</c:when>
	<c:otherwise>
	         
	</c:otherwise>
</c:choose>

	<!-- 카테고리 --> 
<div style="float:right; padding-right:300px;"> 
 <table style="width:100%; align:center; padding:0px; margin:0px;" border="0"> 
      <tr>  
         <td width="225" align="center" style="padding:0px;"><button type="button" onclick="location.href='/muscle/shop/goodsList/홈트레이닝/NewItem.do'" class="btn btn-link" style="font-size:20px;"><font color='hotpink'>운동용품</font></button></td>
         <td width="225" align="center" style="padding:0px;"><button type="button" onclick="location.href='/muscle/shop/goodsList/식품/NewItem.do'" class="btn btn-link" style="font-size:20px;"><font color='hotpink'>건강식품</font></button></td>
         <td width="225" align="center" style="padding:0px;"><button type="button" onclick="location.href='/muscle/shop/goodsList/홈케어/NewItem.do'" class="btn btn-link" style="font-size:20px;"><font color='hotpink'>홈 케어</font></button></td>
         <td width="225" align="center" style="padding:0px;"><button type="button" onclick="location.href='/muscle/board/openBoardList.do'" class="btn btn-link" style="font-size:20px;"><font color='hotpink'>커뮤니티</font></button></td>
         <td>
            <!-- 검색 -->
         <div style="margin-left:23%;"class="search">
         <form method="post" action="/muscle/main/openMainSearch.do" id="search">
              <input id="search" name="keyword" type="text" placeholder=" " value="${keyword1}"/>

            <div><svg><use xlink:href="#path"></svg> </div></div>
         <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
             <symbol xmlns="http://www.w3.org/2000/svg" viewBox="0 0 160 28" id="path">
                 <path d="M32.9418651,-20.6880772 C37.9418651,-20.6880772 40.9418651,-16.6880772 40.9418651,-12.6880772 C40.9418651,-8.68807717 37.9418651,-4.68807717 32.9418651,-4.68807717 C27.9418651,-4.68807717 24.9418651,-8.68807717 24.9418651,-12.6880772 C24.9418651,-16.6880772 27.9418651,-20.6880772 32.9418651,-20.6880772 L32.9418651,-29.870624 C32.9418651,-30.3676803 33.3448089,-30.770624 33.8418651,-30.770624 C34.08056,-30.770624 34.3094785,-30.6758029 34.4782612,-30.5070201 L141.371843,76.386562" transform="translate(83.156854, 22.171573) rotate(-225.000000) translate(-83.156854, -22.171573)"></path>
             </symbol>
         </svg>
         </td>
         </form>
      </tr>
</table>
</div> 
</header>
</html>