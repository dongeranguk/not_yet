<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>

<body>
<script type="text/javascript">
function doNotReload(){
    if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
        event.keyCode = 0;
        event.cancelBubble = true;
        event.returnValue = false;
    } 
}
document.onkeydown = doNotReload;
</script>

<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div style="height: 160px;"></div>
<div align="center">
   <h3>주문 완료</h3> 
</div>
<div style="height: 50px;"></div>

<div class="container" style="width:45%;">
	<div align="center" style="margin-bottom:20px;">
		<span style="color:gray;">주문이 확인되었습니다! 아래 계좌로 입금해주셔야 주문이 완료됩니다.</span>
	</div>	
	<div>
		<table style="width:100%;" class="table">
			<tr>
				<th width="30%" style="padding-left:20px;">주문번호</th>
				<td>${map.ORDER_NUM}</td>
			</tr>
			<tr>
				<th width="30%" style="padding-left:20px;">입금 계좌 안내</th>
				<td>
					신한 110-123-987654 &nbsp;&nbsp;근방위
					
				</td>
			</tr>
			<tr>
				<th width="30%" style="padding-left:20px;">입금자명</th>
				<td>${map.MEM_NAME}</td>
			</tr>
			<tr>
				<th width="30%" style="padding-left:20px;">입금 금액</th>
				<th><strong>${map.ORDER_TCOST} 원</strong></th>
			</tr>
		</table>

	</div>
	<hr>
	<div>
		<table style="width:100%;" class="table">
			<tr>
				<th width="30%" style="padding-left:20px;">받으시는 분</th>
				<td width="*">${map.ORDER_USER_NAME}</td>
			</tr>
			<tr>
				<th width="30%" style="padding-left:20px;">연락처</th>
				<td>${map.ORDER_PHONE1}</td>
			</tr>
			<tr>
				<th width="30%" style="padding-left:20px;">우편번호</th>
				<td>${map.ORDER_DZIPCODE}</td>
			</tr>
			<tr>
				<th width="30%" style="padding-left:20px;">주 소</th>
				<td>${map.ORDER_DADD1}<br>
				${map.ORDER_DADD2}</td>
			</tr>
			<tr>
				<th width="30%" style="padding-left:20px;">배송메세지</th>
				<td>${map.ORDER_DMEMO}</td>
			</tr>
			
		</table>
	</div>
	<hr>
	<div align="center">
		<input type="button" class="btn btn-primary" value="홈으로" onClick="location.href='/muscle/main/openMainList.do'">
	</div>
</div>
<!-- footer -->
<div style="height:80px;"> 
</div>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>
</body>
</html>