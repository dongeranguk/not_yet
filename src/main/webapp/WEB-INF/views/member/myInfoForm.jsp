<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<style>
  table MypageForm{
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  .td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
</style>
<title>My Page</title>
<head>
</head>
<body>

<%@ include file="/WEB-INF/views/template/header.jsp"%>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
   <div style="height: 160px;"></div>
   <div align="center">
      <h3>My Page</h3>
   </div>
   <br/>
   
   <table class="joinFormView" style="width:900px;border:0;cellpadding:1; cellspacing:1;" align="center">
   <tr>
   <td  class="td" style="width:900px; padding-right:15px;" align="left">
      <h5><b>My Shopping</b></h5>
   </td>
   </tr>
   </table>
   
   <table class="joinFormView" style="border:0;cellpadding:1; cellspacing:1;" align="center">
   <tr>
   <td style="width:900px; padding-right:15px;" align="left">
      <font size="2">항상 저희 쇼핑몰을 이용해 주셔서 감사합니다. <b>${map.MEM_NICK}</b> 님은 <b>${session_MEMBER.MEM_RANK}</b>회원이십니다.</font>
   </td>
   </tr> 
   </table>
   <br/>
   
   
         
      <!-- 주문처리 현황 -->
      <table class="joinFormView" style="cellpadding:1; cellspacing:1;" border="1" align="center">
      
      <tr>
      <td style="width:180px; padding-right:15px;" align="center">
      <h5><b>입금전</b></h5>
      ${map1.PAT_NOT_YET}
      </td>
      <td style="width:180px; padding-right:15px;" align="center">
      <h5><b>배송준비중</b></h5>
      ${map1.READY_DELIVERY}
      </td>
      <td style="width:180px; padding-right:15px;" align="center">
      <h5><b>배송중</b></h5>
      ${map1.DELIVERING}
      </td>
      <td style="width:180px; padding-right:15px;" align="center">
      <h5><b>배송완료</b></h5>
      ${map1.SCDELIVERY}
      </td>
      <td style="width:180px; padding-right:15px;" align="left">
      <ul>
         <li><font size="1px">취소 : ${map1.CXL}</font></li>
         <li><font size="1px">교환 : ${map1.EXCHANGE}</font></li>
         <li><font size="1px">반품 : ${map1.REFUND}</font></li>
      </ul>
      </td>
      </tr>
      </table>


      <p>
      
      <table class="joinFormView" style="cellpadding:1; cellspacing:1;" border="0" align="center">
         <tr>
         <td class="td" style="width:900px; padding-right:15px;" align="left" hr="">
            <a href="#this" name="order"><b>Order</b> <font size="2px">주문내역 조회</font></a><br/>
            <font color="#A6A6A6" size="1px">고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다.<br/>
            비회원의 경우, 주문서의 주문번호와 비밀번호로 주문조회가 가능합니다.</font>
            <input type="hidden" id="MEM_NUM" name="MEM_NUM" value="${session_MEMBER.MEM_NUM}">
         </td>
         </tr>
         
         <tr>
         <td class="td" style="width:900px; padding-right:15px;" align="left">
            <a href="/muscle/member/updateMyInfoForm.do"><b>Profile</b> <font size="2px">회원정보</font></a><br/>
            <font color="#A6A6A6" size="1px">회원이신 고객님의 개인정보를 관리하는 공간입니다.<br/>
            개인정보를 최신 정보로 유지하시면 보다 간편히 쇼핑을 즐기실 수 있습니다.</font>
         </td>
         </tr>
         
         <tr>
         <td class="td" style="width:900px; padding-right:15px;" align="left">
            <a href="/muscle/shop/basketList.do"><b>Basket</b> <font size="2px">장바구니</font><br/></a>
            <font color="#A6A6A6" size="1px">고객님께서 장바구니에 담아두신 상품을 보여드립니다.<br/>
            담아두신 원하는 상품을 골라서 주문 하실 수 있습니다.</font>
         </td>
         </tr>
         
<!--          <tr>
         <td class="td" style="width:900px; padding-right:15px;" align="left">
            <b>Like it</b> <font size="2px">찜 목록</font><br/><p>
            <font color="#A6A6A6" size="1px">'좋아요'를 선택한 상품과 상품분류 목록을 보여드립니다.</font>
         </td>
         </tr> -->
         
         <tr>
         <td class="td" style="width:900px; padding-right:15px;" align="left">
            <a href="/muscle/member/openMyBoardList.do"><b>Board</b> <font size="2px">게시물 관리</font><br/></a>
            <font color="#A6A6A6" size="1px">고객님께서 작성하신 게시물을 관리하는 공간입니다.<br/>
            고객님께서 작성하신 글을 한눈에 관리하실 수 있습니다.</font>
         </td>
         </tr>
      </table>
      <br/><br/>
   <%@ include file="/WEB-INF/include/include-body.jspf"%>
   <div style="height: 80px;"></div>
   <footer style="border-top: 1px solid #D5D5D5;">
      <%@ include file="/WEB-INF/views/template/footer.jsp"%>
   </footer>
   
 <script type="text/javascript">
      $(document).ready(function(){
         $("a[name='order']").on("click", function(e){
               e.preventDefault();
               order();
            });
         });

      function order(){
          var comSubmit = new ComSubmit();
          comSubmit.setUrl("<c:url value='/member/openMyOrderList.do' />");
          comSubmit.addParam("MEM_NUM", $("#MEM_NUM").val());
          comSubmit.submit();
         }
   </script>
</body>
</html>