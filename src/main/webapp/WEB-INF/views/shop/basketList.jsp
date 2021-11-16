<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<script src="/muscle/js/bootstrap.min.js"></script>
<script src="/muscle/js/common.js" charset="utf-8"></script>


<script type="text/javascript">
//상품선택
function fn_allchk(){
   
   var chk = document.getElementById("allchk").checked; 
   var arraychk = document.getElementsByName("chk"); 
   var len = arraychk.length;
      for(var i=0; i<len; i++){
         arraychk[i].checked = chk; 
      }
}



function fn_amount(index){
   var array8 = document.getElementsByName("goods_stock"); //재고수량
   var array1 = document.getElementsByName("goods_att_amount"); //수량
   var array4 = document.getElementsByName("chk");

   var att = Number(array8[index].value); 
   var amount = Number(array1[index].value);
   var basket_num = array4[index].value;
   var result = (amount<=att);
   
   if(amount=!null && amount>0){
      if(result==true){
    	  var comSubmit = new ComSubmit();
    	  comSubmit.setUrl("<c:url value='/shop/basketModify.do' />");
    	  comSubmit.addParam("GOODS_ATT_AMOUNT", array1[index].value);
    	  comSubmit.addParam("BASKET_NUM", basket_num);
    	  comSubmit.submit();
      }else{
         alert("재고가 부족합니다.");   
         return false;
      }
   }else{
      alert("유효한 숫자가 아닙니다.");   
      return false;
   }
}


//상품 삭제
function fn_delete(index){
   var array4 = document.getElementsByName("chk");
   var basket_num = array4[index].value;

   if(confirm("삭제하시겠습니까?")){
      var comSubmit = new ComSubmit();
      comSubmit.setUrl("<c:url value='/shop/basketDelete.do' />");
      comSubmit.addParam("BASKET_NUM", basket_num);
      comSubmit.submit();
   }
   return false;
}
//전체삭제
function fn_allDelete(){
   var array9 = document.getElementsByName("mem_num");
   var mem_num = array9[0].value;

   if(confirm("삭제하시겠습니까?")){
      var comSubmit = new ComSubmit();
      comSubmit.setUrl("<c:url value='/shop/basketAllDelete.do' />");
      comSubmit.addParam("MEM_NUM", mem_num);
      comSubmit.submit();
   }
   return false;
}

function fn_allPrice(){ //전체주문금액구하기
   var array1 = document.getElementsByName("goods_sell_price"); //상품가격
   var array2 = document.getElementsByName("goods_att_amount"); //장바구니 수량
   var array3 = document.getElementsByName("order_price"); //주문 가격
   var len = array2.length;
   var hap = 0;
   for (var i=0; i<len; i++){
      var sell = array1[i].value; 
      var amt = array2[i].value;
      var pri = Number(sell)*Number(amt); //각 상품별 주문금액
      hap = Number(hap)+Number(pri); //주문금액 총합 구하기
      array3[i].value = pri;
   }
   var fee = document.getElementById("order_fee").value;
   pay = Number(hap)+Number(fee);
   document.getElementById("all_price").value = hap; //상품금액
   document.getElementById("pay_price").value = pay; //상품금액+배송비
   document.getElementById("all_order_price").value = pay;
}

function fn_all_order(){ //장바구니 전제주문
   document.basket.submit();
}

function fn_select_order(){ //선택상품 주문
	   var obj = $("[name=chk]");
	    var SELECT_BASKET_NUM = new Array(); // 배열 선언

	    // 체크된 체크박스의 value 값을 가지고 온다.
	    $('input:checkbox[name=chk]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
	       SELECT_BASKET_NUM.push(this.value);
	    });
	    if(SELECT_BASKET_NUM[0] != null){
	       var comSubmit = new ComSubmit();
	      comSubmit.setUrl("<c:url value='/order/basketSelectOrder.do' />");
	      comSubmit.addParam("SELECT_BASKET_NUM", SELECT_BASKET_NUM);
	      comSubmit.submit();
	    }else{
	       alert("구매할 상품을 선택해 주세요.");
    }
}

</script>

</head>
<body onload="fn_allPrice()">
	<!-- 주문페이지 로딩시 주문금액,포인트 등 계산 -->
	<%@ include file="/WEB-INF/views/template/header.jsp"%>

	<div style="height: 160px;"></div>
	<div align="center">
		<h3>Cart</h3>
	</div>
	<div style="height: 50px;"></div>

	<div class="container" style="width: 70%;">

		<!-- tables -->
		<form id="commonForm" name="commonForm"></form>
		<form name="basket" method="post"
			action="/muscle/order/basketAllOrderWrite.do">
			<input type="hidden" name="list" value="${list }">
			<input type="hidden" name="MEM_ID" value="${MEM_ID }">
		</form>

		<div class="table-responsive">
			<table class="table table-striped">
				<colgroup>
					<col width="5%" />
					<col width="10" />
					<col width="*" />
					<col width="10%" />
					<col width="13%" />
					<col width="13%" />
					<col width="10%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th style="text-align: center"><input type="checkbox"
							name="allchk" id="allchk" onclick="fn_allchk()"></th>
						<th colspan="2" style="text-align: center">상품명/옵션</th>
						<th style="text-align: center">수량</th>
						<th style="text-align: center">상품가</th>
						<th style="text-align: center">주문금액</th>
						<th style="text-align: center">주문</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(list) > 0}">
							<c:forEach items="${list }" var="row" varStatus="status">
								<input type="hidden" name="goods_stock" value="${row.GOODS_STOCK }">
								<input type="hidden" name="mem_num" value="${row.MEM_NUM }">
								<input type="hidden" name="goods_num" value="${row.GOODS_NUM }">
								<input type="hidden" name="goods_att_num" value="${row.GOODS_ATT_NO }">
								<tr>
									<td style="text-align: center"><input type="checkbox" name="chk" id="chk" value="${row.BASKET_NUM }"></td>
									<td><img src="/muscle/img/goods_upload/${row.GOODS_IMG_THUM}" width="70px" height="70px"></td>
									<td><a href="/muscle/shop/goodsDetail.do?IDX=${row.GOODS_NUM }">${row.GOODS_NAME }</a>
										<br> 색상: ${row.GOODS_COLOR } <br>
										사이즈:${row.GOODS_SIZE } <br></td>
									<td style="text-align: center"><input type="number" name="goods_att_amount" value="${row.GOODS_ATT_AMOUNT }"
										min="1" max="${row.GOODS_STOCK }" style="width: 50px; text-align: right"></td>
									<td style="text-align: center">
										<c:choose>
											<c:when test="${MEM_ID == null}">
                                ${row.GOODS_NMPRICE }원
                                <c:set var="price" value="${row.GOODS_NMPRICE }" />
                                 </c:when>
                                 <c:when test="${MEM_ID != null}">
                                ${row.GOODS_MPRICE }원
                                <c:set var="price" value="${row.GOODS_MPRICE }" />
                                 </c:when>
										</c:choose></td>
									<td style="text-align: center"><c:set var="goods_price" value="${price * row.GOODS_ATT_AMOUNT}" /> ${goods_price}원</td>

									<td style="text-align: center">
									<input type="button" name="amount_modify" class="btn btn-outline-dark btn-sm" value="수정"
										onclick="fn_amount(${status.index}); return false;"><br>
									<input type="button" name="basket_delete" class="btn btn-outline-dark btn-sm" value="삭제"
										onclick="fn_delete(${status.index})">
									</td>
								</tr>

								<c:set var="order_price" value="${order_price+goods_price}" />


							</c:forEach>
				</tbody>
			</table>
		</div>
		<div style="text-align: right">

			<input type="button" name="all_basket_delete" class="btn btn-outline-dark btn-sm" value="모두삭제" style="margin-right:15px;"
				onclick="fn_allDelete()">
		</div>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="7" align="center">조회된 결과가 없습니다.</td>
			</tr>
			</tbody>
			</table>
	</div>
	</c:otherwise>
	</c:choose>
	<br>
	<br>
	<c:choose>
		<c:when test="${fn:length(list) > 0}">
			<div class="table-responsive">
				<table class="table table-striped">
					<tr>
						<td>주문금액</td>
						<td>${order_price}원</td>
						<td>&nbsp;+&nbsp;&nbsp;배송비</td>
						<td>3000원</td>
						<td>&nbsp;=&nbsp;&nbsp;&nbsp;&nbsp;<strong>결제예정금액</strong></td>
						<td><strong>${order_price+3000}원</strong></td>
					</tr>
				</table>
			</div>

			<div style="text-align: right">
				<input type="button" class="btn btn-primary" name="all_order" value="전체주문"
					onclick="fn_all_order()"> 
				<input type="button" class="btn btn-outline-primary" 
					name="select_order" value="선택상품주문" onclick="fn_select_order()">
			</div>
		</c:when>
	</c:choose>


	</div>
	<!-- /container -->
	<!-- footer       -->
	<div style="height: 80px;"></div>
	<%@ include file="/WEB-INF/include/include-body.jspf"%>
	<footer style="border-top: 1px solid #D5D5D5;">
		<%@ include file="/WEB-INF/views/template/footer.jsp"%>
	</footer>
</body>
</html>