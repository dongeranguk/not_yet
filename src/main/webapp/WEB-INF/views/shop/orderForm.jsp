<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<script src="/muscle/js/common.js" charset="utf-8"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> 

<script type="text/javascript">
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
                        .getElementById('ORDER_DZIPCODE').value = data.zonecode;
                  document
                        .getElementById("ORDER_DADD1").value = addr;
                  
                  document.getElementById(
                        "ORDER_DADD2")
                        .focus();
               }
            }).open();
   }

    //주문자정보와 동일
      function fn_chkinfo(){
      	var chk = document.getElementById("chkinfo").checked;
      	if(chk==true){
      		document.getElementById("ORDER_USER_NAME").value = "${map.MEM_NAME}";
      		document.getElementById("ORDER_PHONE1").value = "${map.MEM_PHONE}";
      		document.getElementById("ORDER_DZIPCODE").value = "${map.MEM_ZIPCODE}";
      		document.getElementById("ORDER_DADD1").value = "${map.MEM_ADDRESS1}";
      		document.getElementById("ORDER_DADD2").value = "${map.MEM_ADDRESS2}";
      	}else if(chk==false){
      		document.getElementById("ORDER_USER_NAME").value = "";
      		document.getElementById("ORDER_PHONE2").value = "";
      		document.getElementById("ORDER_DZIPCODE").value = "";
      		document.getElementById("ORDER_DADD1").value = "";
      		document.getElementById("ORDER_DADD2").value = "";
      	}
      }
      
      function fn_allPrice(){
    		
    		var array1 = document.getElementsByName("goods_sell_price");
    		var array2 = document.getElementsByName("GOODS_ATT_AMOUNT");
    		var array3 = document.getElementsByName("ORDER_PRICE");
    		
    		var len = array2.length;
    		var hap = 0;
    		for (var i=0; i<len; i++){
    			var sell = array1[i].value;
    			var amt = array2[i].value;
    			var pri = Number(sell)*Number(amt); //각 상품별 주문금액
    			hap = Number(hap)+Number(pri); //주문금액 총합 구하기
    			array3[i].value = pri;	
    		}
    		var fee = document.getElementById("ORDER_DCOST").value;
    		pay = Number(hap)+Number(fee);
    		
    		document.getElementById("ORDER_cost").value = hap; //품목별 총 주문금액
    		document.getElementById("ORDER_TCOST").value = pay; //최종결제금액

    	}

   function fn_order_pay(){
      
      var f = document.orderWrite;
      
      if( f.ORDER_USER_NAME.value=="" ){
         alert("주문자 이름을 입력해주세요.");
         f.ORDER_NAME.focus();
         return false;
      }
      if( f.ORDER_PHONE1.value==""){
         alert("전화번호를 입력해주세요.");
         f.ORDER_PHONE.focus(); //커서자동클릭
         return false;
      }
      if( f.ORDER_DZIPCODE.value=="" || f.ORDER_DADD1.value=="" || f.ORDER_DADD2.value==""){
         alert("주소를 정확히 입력해주세요.");
         return false;
      }
      if( f.ORDER_PAY_RBANK.value=="" ){
         alert("결제은행을 입력해주세요.");
         f.ORDER_PAY_BANK.focus();
         return false;
      }
      if( f.ORDER_PAY_NAME.value==""){
         alert("결제자명을 입력해주세요.");
         f.ORDER_PAY_NAME.focus(); //커서자동클릭
         return false;
      }

      alert("주문이 완료 되었습니다. 감사합니다:)");
      f.submit();
      
}

   

   
</script>

</head>
<body onload="fn_allPrice()">
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div style="height: 160px;"></div>
<div align="center">
   <h3>Order</h3> 
</div>
<div style="height: 50px;"></div>
<div class="container" style="width:70%;">

<form name="orderWrite" id="orderWrite" method="post" action="/muscle/order/orderPay.do">

<!-- 주문할 상품 리스트 (basketList에서 긁어옴) -->
   <div class="table-responsive">
         <table class="table table-striped">
            <colgroup>
               <col width="15" />
               <col width="*" />
               <col width="25%" />
               <col width="15%" />
               <col width="15%" />
            </colgroup>
            <thead>
               <tr>
                  <th colspan="7">주문 상품 정보</th>
               </tr>
               <tr>
                  <th colspan="2" style="text-align: center">상품명/옵션</th>
                  <th style="text-align: center">수량</th>
                  <th style="text-align: center">상품가</th>
                  <th style="text-align: center">주문금액</th>
               </tr>
            </thead>
            <tbody>
                     <c:forEach items="${list }" var="row" varStatus="status">
                        <input type="hidden" name="GOODS_STOCK" value="${row.GOODS_STOCK }">
                        <input type="hidden" name="GOODS_NUM" value="${row.GOODS_NUM }">
                        <input type="hidden" name="GOODS_ATT_NO" value="${row.GOODS_ATT_NO }">
                        <input type="hidden" name="GOODS_COLOR" value="${row.GOODS_COLOR }">
                        <input type="hidden" name="GOODS_SIZE" value="${row.GOODS_SIZE }">
                        <input type="hidden" name="BASKET_NUM" value="${row.BASKET_NUM }">
                        <tr>
                           <td><img src="/muscle/img/goods_upload/${row.GOODS_IMG_THUM}" width="70px" height="70px"></td>
                           <td><a href="/muscle/shop/goodsDetail.do?IDX=${row.GOODS_NUM }">${row.GOODS_NAME }</a>
                              <br> 색상: ${row.GOODS_COLOR } <br>
                                  사이즈:${row.GOODS_SIZE } <br>
                           </td>
                           <td style="text-align: center">
                              <input type="number" name="GOODS_ATT_AMOUNT" readonly="readonly" value="${row.GOODS_ATT_AMOUNT }" min="1" max="${row.GOODS_STOCK }" style="width: 50px; text-align: right">
                           </td>
                           <td style="text-align: center">
                              <c:choose>
                                 <c:when test="${map.MEM_ID == null}">
                                            <input type="number" name="goods_sell_price" value="${row.GOODS_NMPRICE }" readonly>원
                                 </c:when>
                                 <c:when test="${map.MEM_ID != null}">
                                            <input type="number" name="goods_sell_price" value="${row.GOODS_MPRICE }" readonly>원
                                 </c:when>
                              </c:choose>
                           </td>
                           <td style="text-align: center"><input type="NUMBER" name="ORDER_PRICE" value="" readonly>원
                        </tr>

                     </c:forEach>
            </tbody>
         </table>
      </div>
      <hr>
      
      <!-- 주문자 정보 -->
      <div class="table-responsive">
      <table style="width:100%;">
         <colgroup>
               <col width="15%" />
               <col width="*" />
            </colgroup>
         <tr>
            <th colspan="2">주문자 정보<hr></th>
         </tr>
         <tr>
            <td>이름</td>
            <td><input name="MEM_NAME" value="${map.MEM_NAME}" readonly="readonly" id="MEM_NAME" class="form-control" style="width:20%;"></td>
         </tr>
         <tr>
            <td>이메일</td>
            <td><input id="MEM_EMAIL" name="MEM_EMAIL" value="${map.MEM_EMAIL}" readonly="readonly" class="form-control" style="width:40%;"></td>
         </tr>
         <tr>
            <td>연락처</td>
            <td><input id="MEM_PHONE" name="MEM_PHONE" value="${map.MEM_PHONE}" readonly="readonly" class="form-control" style="width:40%;"></td>
         </tr>
      </table>
      </div>
      <hr>
      
      <!-- 배송 정보 -->
      <div class="table-responsive">
      
      <table style="width:100%;">
         <colgroup>
               <col width="15%" />
               <col width="*" />
         </colgroup>
          <tr>
                 <th colspan="7">배송정보 <hr></th>
          </tr>
          <tr>
          <td>&nbsp;&nbsp;</td>
          	<td>
          	<input align="right" type="checkbox" name="chkinfo" id="chkinfo" onclick="fn_chkinfo()">
          		주문자 정보와 동일
          	</td>
          </tr>
         <tr>
            <td>받는 사람</td>            
            <td><input type="text" id="ORDER_USER_NAME" name="ORDER_USER_NAME" class="form-control"  style="width:20%;"></td>                        
         </tr>
         <tr>
            <td>일반전화</td>
            <td><input type="text" id="ORDER_PHONE2" name="ORDER_PHONE2" class="form-control"  style="width:40%;"></td>
         </tr>
         <tr>
            <td>휴대전화</td>
            <td><input type="text" id="ORDER_PHONE1" name="ORDER_PHONE1" class="form-control"  style="width:40%;"></td>
         </tr>
         <tr>
            <td rowspan="3"> 주 소</td>
            <td>
               <input type="text" id="ORDER_DZIPCODE" name="ORDER_DZIPCODE" placeholder="우편번호" class="form-control" readonly style="display:inline-block; width:40%;">
               <input type="button" onclick="DaumAddressAPI()" class="btn btn-outline-primary mb-2" value="우편번호 찾기" style="display:inline-block;"><br>
            </td>
         </tr>
         <tr>
            <td>
               <input type="text" name="ORDER_DADD1" id="ORDER_DADD1" placeholder="주소"  size="40" class="form-control" style="width:55%;">
            <td>
         <tr>
            <td>
               <input type="text" name="ORDER_DADD2" id="ORDER_DADD2" placeholder="상세주소" size="40" class="form-control" style="width:55%;">
            </td>
         </tr>
         <tr>
            <td>배송 메모</td>
            <td><textarea id="ORDER_DMEMO" name="ORDER_DMEMO" rows="2" style="width:90%;" class="form-control"></textarea></td>
         </tr>
      </table>
      </div>
      <hr>
      
      <!-- 결제 정보 -->
      <div class="table-responsive">
      <table style="width:100%;">
         <colgroup>
               <col width="20%" />
               <col width="*" />
         </colgroup>
         <tr>
            <th colspan="2">결제 정보<hr></th>
         </tr>
         <tr>
            <td>결제 방법</td>
            <td><input class="form-check-input" id="ORDER_PAY" name="ORDER_PAY" type="radio" checked id="radio">
               <label class="form-check-label" for="radio" value="무통장입금">무통장입금</label></td>
         </tr>
         <tr>
            <td>무통장 입금자명</td>
            <td><input type="text" id="ORDER_PAY_NAME" name="ORDER_PAY_NAME" class="form-control" style="width:30%;"></td>
         </tr>
         <tr>
            <td>환불 은행</td>
            <td>
            	<select name="ORDER_PAY_RBANK" class="form-control" style="width:40%; display:inline-block;">
							<option value="신한">신한</option>
							<option value="국민">국민</option>
							<option value="우리">우리</option>
				</select>
			</td>
         </tr>
         <tr>
            <td>환불 계좌번호</td>
				<td><input type="text" id="ORDER_PAY_RACCOUNT" name="ORDER_PAY_RACCOUNT" class="form-control" style="width:40%; display:inline-block;"></td>
         </tr>
         <tr>
            <td>현금영수증 번호</td>
            
            <td>
            <input type="text" id="ORDER_PAY_CASHRE" name="ORDER_PAY_CASHRE" class="form-control" style="width:40%; display:inline-block">
            <font style="color:gray; display:inline-block; margin-left:20px;">( - 없이 숫자만 입력)</font></td>
         </tr>
      </table>
      </div>
      <hr>
      
      <!-- 결제 예정 금액 -->
      <div>
      <table style="width:100%;">
         <colgroup>
            <col width="25%" />
            <col width="25%" />
            <col width="25%" />
            <col width="25%" />
         </colgroup>
         <tr>
            <th colspan="3">결제 예정 금액<hr></th>
         </tr>
         <tr align="center" style="margin-bottom:30px;">
            <th>총 주문금액</th>
            <th>배송비</th>            
            <th>총 결제 예정 금액</th>
         </tr>
         <tr align="center">
            <td><strong><input type="text" id="ORDER_cost" name="ORDER_cost" readonly="readonly" value=""></strong>원</td>
            <td><strong><input type="text" id="ORDER_DCOST" name="ORDER_DCOST" value="3000" readonly></strong>원</td>
            <td><strong><input type="text" id="ORDER_TCOST" name="ORDER_TCOST" readonly="readonly" value=""></strong>원</td>
         </tr>
      </table>
      </div>
      <hr>
      
      <!-- 결제 버튼 -->
      <div align="center" style="margin-top:50px;">
         <input type="button" class="btn btn-primary" name="order_pay" value="주문하기" onclick="fn_order_pay()">
         <input type="button" class="btn btn-outline-primary" value="주문취소" onClick="location.href='/muscle/shop/basketList.do'">
      </div>
 
</div>
   



<!-- footer       -->
<div style="height: 80px;"></div>
<%@ include file="/WEB-INF/include/include-body.jspf"%>
<footer style="border-top: 1px solid #D5D5D5;">
   <%@ include file="/WEB-INF/views/template/footer.jsp"%>
</footer>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

  </form>
</body>
</html>