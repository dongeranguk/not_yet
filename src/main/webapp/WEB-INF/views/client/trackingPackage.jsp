<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 배송조회</title>
<style>
#packageCompanyList, #invoiceNumberText {
    width: 500px;
    height: 30px;
    padding-left: 10px;
    font-size: 18px;
    color: #fa579b;
    border: 1px solid #fa70aa;
    border-radius: 3px;
}

#packageCompanyName, #invoiceNumber{
  color:#fa579b; 
  font-weight: bold; 
  margin-right: 20px;
  font-size: 18px;
}

#packageTrackingButton {
  background: #FFD2FF;
  background-image: -webkit-linear-gradient(top, #ff9eb0, #ff6e92);
  background-image: -moz-linear-gradient(top, #ff9eb0, #ff6e92);
  background-image: -ms-linear-gradient(top, #ff9eb0, #ff6e92);
  background-image: -o-linear-gradient(top, #ff9eb0, #ff6e92);
  background-image: linear-gradient(to bottom, #ff9eb0, #ff6e92);
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0px;
  font-family: 나눔고딕,NanumGothic;
  color: #ffffff;
  font-size: 20px;
  padding: 10px 10px 10px 10px;
  text-decoration: none;
}

#closeWindow{
	background: #ffffff;
	color: #ff8aac;
	font-size: 20px;
  	padding: 10px 10px 10px 10px;
	font-family: 나눔고딕,NanumGothic;
	border-radius: 0px;	
}

#packageTrackingButton:hover {
  background: #fa579b;
  background-image: -webkit-linear-gradient(top, #fa579b, #FFD2FF);
  background-image: -moz-linear-gradient(top, #fa579b, #FFD2FF);
  background-image: -ms-linear-gradient(top, #fa579b, #FFD2FF);
  background-image: -o-linear-gradient(top, #fa579b, #FFD2FF);
  background-image: linear-gradient(to bottom, #fa579b, #FFD2FF);
  text-decoration: none;
}

table {
    font-family: 나눔고딕,NanumGothic;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #ffd4e6;
}

</style>
</head>
<body>
<!-- 
        <form action="http://info.sweettracker.co.kr/tracking/2" method="post">
            <div class="form-group">
              <label for="t_key">API key</label>
              <input type="text" class="form-control" id="t_key" name="t_key" placeholder="c57xw7tRUNwiCVmUwBi82g">
            </div>
            <div class="form-group">
              <label for="t_code">택배사 코드</label>
              <input type="text" class="form-control" name="t_code" id="t_code" placeholder="01">
            </div>
            <div class="form-group">
              <label for="t_invoice">운송장 번호</label>
              <input type="text" class="form-control" name="t_invoice" id="t_invoice" placeholder="운송장 번호">
            </div>
            <button type="submit" class="btn btn-default">조회하기</button>
        </form>
 -->

	<span id="packageCompanyName">택배회사명: </span>
		<select id="packageCompanyList" name="packageCompanyList"></select><br/><br/>
	<span id="invoiceNumber">운송장번호: </span>
		<input type="text" id="invoiceNumberText" name="invoiceNumberText" value="${TrackingNumber}"><br/><br/>
	
	<button id="packageTrackingButton">택배 조회하기 </button>&nbsp;&nbsp;<button id="closeWindow" onclick="javascript:window.close();">창 닫기</button>
	<br/>
	<br/>
	<div>
		<table id="basicInfo"></table>
	</div>
	<br/>
	<div>
	<table id="details"></table>
</div>

</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
$(document).ready(function(){
	
	
    var myKey = "c57xw7tRUNwiCVmUwBi82g"; 
    
        // 택배사 목록 조회 company-api
        $.ajax({
            type:"GET",
            dataType : "json",
            url:"http://info.sweettracker.co.kr/api/v1/companylist?t_key="+myKey,
            success:function(data){
                    
                    var CompanyArray = data.Company; // Json Array에 접근하기 위해 Array명 Company 입력
                    console.log(CompanyArray); 
                    
                    var myData="";
                    $.each(CompanyArray,function(key,value) {	//jquery반복함수	
                            myData += ('<option value='+value.Code+'>'+value.Name + '</option>' + key + value.Code);        
              
             /* myData += ('<option value='+value.Code+'>' +'key:'+key+', Code:'+value.Code+',Name:'+value.Name + '</option>');*/                        
 
                    });
                    $("#packageCompanyList").html(myData);
            }
        });
        // 배송정보와 배송추적 tracking-api
        $("#packageTrackingButton").click(function() {
            var t_code = $('#packageCompanyList option:selected').attr('value');
            var t_invoice = $('#invoiceNumberText').val();
            $.ajax({
                type:"GET",
                dataType : "json",
                url:"https://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
                success:function(data){
                    console.log(data);
                    var myInvoiceData = "";
                    if(data.status == false){
                        myInvoiceData += ('<p>'+data.msg+'<p>');
                    }else{
                        myInvoiceData += ('<tr>');                
                        myInvoiceData += ('<th>'+"보내는사람"+'</td>');                     
                        myInvoiceData += ('<th>'+data.senderName+'</td>');                     
                        myInvoiceData += ('</tr>');     
                        myInvoiceData += ('<tr>');                
                        myInvoiceData += ('<th>'+"제품정보"+'</td>');                     
                        myInvoiceData += ('<th>'+data.itemName+'</td>');                     
                        myInvoiceData += ('</tr>');     
                        myInvoiceData += ('<tr>');                
                        myInvoiceData += ('<th>'+"송장번호"+'</td>');                     
                        myInvoiceData += ('<th>'+data.invoiceNo+'</td>');                     
                        myInvoiceData += ('</tr>');     
                        myInvoiceData += ('<tr>');                
                        myInvoiceData += ('<th>'+"배송상태"+'</td>');   

                        var completeYN = data.completeYN
                        if(completeYN == 'Y'){
                        	myInvoiceData += ('<th>'+"배송완료"+'</td>');
                        }else{
                        	myInvoiceData += ('<th>'+"배송중"+'</td>');
                        }
                        myInvoiceData += ('</tr>');                                       
                    }
                    
                    
                    $("#basicInfo").html(myInvoiceData)
                    
                    var trackingDetails = data.trackingDetails;
                    
                    
                    var myTracking="";
                    var header ="";
                    header += ('<tr>');                
                    header += ('<th>'+"시간"+'</th>');
                    header += ('<th>'+"장소"+'</th>');
                    header += ('<th>'+"유형"+'</th>');
                    header += ('<th>'+"전화번호"+'</th>');                     
                    header += ('</tr>');     
                    
                    $.each(trackingDetails,function(key,value) {
                        myTracking += ('<tr>');                
                        myTracking += ('<td>'+value.timeString+'</td>');	//시간
                        myTracking += ('<td>'+value.where+'</td>');			//장소
                        myTracking += ('<td>'+value.kind+'</td>');			//유형 (집하, 입고 등)
                        myTracking += ('<td>'+value.telno+'</td>');         //전화번호
                        myTracking += ('</tr>');                                    
                    });
                    
                    $("#details").html(header+myTracking);
                    
                }
            });
        });
        
});
</script>
</html>