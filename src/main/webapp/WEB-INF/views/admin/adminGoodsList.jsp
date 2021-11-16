<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
<!-- header -->
<div style="height: 160px;"></div>
<div align="center">
   <h3>상품관리</h3>
</div>
<div style="height: 30px;"></div>
<!-- body -->
<div align="center" style="width:1000px; margin-left:auto; margin-right:auto;">
   <ul class="nav nav-tabs">
      <li class="nav-item">
       <a style=color:black; class="nav-link" href="<c:url value='/admin/openAdminMember.do'/>">회원관리</a>
     </li>
     <li class="nav-item">
       <a style=color:pink; class="nav-link active" href="<c:url value='/admin/openAdminGoods.do'/>">상품관리</a>
     </li>
     <li class="nav-item">
       <a style=color:black; class="nav-link" href="<c:url value='/report/openAdminReport.do'/>">신고관리</a>
     </li>
     <li class="nav-item">
       <a style=color:black; class="nav-link" href="<c:url value='/admin/acsBoardList.do'/>">공지관리</a>
     </li>
     <li class="nav-item">
       <a style=color:black; class="nav-link" href="<c:url value='/admin/openDailyAccountingList.do'/>">매출관리</a>
     </li>
     <li class="nav-item">
       <a style=color:black; class="nav-link" href="javascript:void(window.open('https://desk.channel.io/#/channels/66232/user_chats/6172b6a2a9e910f2c971'))">고객채팅</a>
     </li>
   </ul>
<div class="container" style="margin-top:20px;">
   <!-- search bar -->
   <div style="padding:10px; float:right; display:inline-block;">
     <form id="frm" method="post" action="/muscle/admin/openSearchGoods.do">
    	<select id="searchType" name="searchType" value="${searchType}">
     		<option value="ALL" ${searchDTO.searchType == 'ALL' ? 'selected' : ''}>전체</option>
   	  		<option value="GOODS_NUM" ${searchDTO.searchType == 'GOODS_NUM' ? 'selected' : ''}>상품번호</option>
   	  		<option value="GOODS_NAME" ${searchDTO.searchType == 'GOODS_NAME' ? 'selected' : ''}>상품명</option>
  			<option value="GOODS_CATEGORY1" ${searchDTO.searchType == 'GOODS_CATEGORY1' ? 'selected' : ''}>카테고리1</option>
   			<option value="GOODS_CATEGORY2" ${searchDTO.searchType == 'GOODS_CATEGORY2' ? 'selected' : ''}>카테고리2</option>
  		 </select>
        <input type="text" name="keyword" id="keyword" value="${keyword}" class="form-control"  placeholder="검색어를 입력하세요" style="width:300px; display:inline-block;" />
        <input type="submit" value="검색" class="btn btn-primary btn-sm" style="display:inline-block; background-color:pink; border-color:pink; margin-bottom:5px;"/>
    	<!-- <input type="submit" value="검색" class="btn btn-primary btn-sm" style="display:inline-block; margin-botton:5px;"/> -->
    	
    </form>
   </div>
   <table align="center" name="adminGoodsList" class="table table-hover" style="cellpadding:7px;">
      <thead>
      <tr style="background-color:pink;">
         <th style="width:13%" colspan="2">
         <div class="dropdown">
            <a type="button" class="dropdown-toggle" data-toggle="dropdown">전 체</a>
            <div class="dropdown-menu">
               <a class="dropdown-item" href="/muscle/admin/allList.do">전 체</a>
               <a class="dropdown-item" href="/muscle/admin/notice.do">Home Training</a>
               <a class="dropdown-item" href="/muscle/admin/event.do">Healthy Diet</a>
               <a class="dropdown-item" href="/muscle/admin/fdsafd.do">Home Care</a>
            </div>
         </div>
         </th>
         <th style="width:10%">상품번호</th>
         <th style="width:10%">상품명</th>
         <th style="width:15%">카테고리1</th>
         <th style="width:15%">카테고리2</th>
         <th style="width:10%">원 가</th>
         <th style="width:10%">회원가</th>
      </tr>
      </thead>
      <tbody>

      </tbody>
      </table>
      		<div id="PAGE_NAVI" align="center"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" /> <br> 
      <hr>
      <div align="right">
      <button type="button" style="background-color:hotpink; color:whtie; border-color:hotpink;" class="btn btn-primary btn-sm" onclick="location.href='/muscle/shop/openGoodsWrite.do'">상품 등록</button>
      </div>
   </div>
  </div>
   <br>
   
  <!-- footer -->
<div style="height:80px;">
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
		<footer style="border-top:1px solid #D5D5D5;">
		<%@ include file="/WEB-INF/views/template/footer.jsp"%>
		</footer>
</div> 
   
   <script type="text/javascript">
   $(document).ready(function(){
         $("a[name='delete1']").on("click",function(e){
            e.preventDefault();
            fn_delete($(this));
            });
         $("a[name='mdf']").on("click",function(e){
            e.preventDefault();
            fn_update($(this));
            });
   });
     function fn_delete(obj){
          var comSubmit = new ComSubmit();
          var CONFIRM = confirm("정말로 삭제하시겠습니까?");
          if(CONFIRM==true){
          comSubmit.setUrl("<c:url value='/admin/deleteAdminGoods.do'/>");
           comSubmit.addParam("GOODS_NUM", obj.parent().find("#GOODS_NUM").val());
           comSubmit.submit();
           alert("상품이 삭제 되었습니다.");
          }
     }
     function fn_update(obj) {
 		var comSubmit = new ComSubmit();
 		comSubmit.setUrl("<c:url value='/admin/goodsModifyForm.do'/>");
 		comSubmit.addParam("IDX",  obj.parent().find("#GOODS_NUM").val());
 		comSubmit.submit();
 	}
     var searchType = $("#search option:selected").val();
    function fn_search(searchType) {
    	var comSubmit = new ComSubmit();
    	comSubmit.submit();
    }
    
    function fn_search2(){
        var comSubmit = new ComSubmit("frm");
        comSubmit.setUrl("<c:url value='/muscle/admin/openSearchGoods.do'/>");
         comSubmit.addParam("keyword", $("#keyword").val());
         comSubmit.submit();
        }
  	//11.10 추가내용
    $(document).ready(function() {
        fn_adminGoodsList(1);

        $("a[name='search']").on("click", function(e){
           e.preventDefault();
           fn_search();
            });
        $("a[name='search2']").on("click", function(e){
            e.preventDefault();
            fn_search2();
             });
        $("a[name='click']").on("click", function(e){
            e.preventDefault();
            fn_click($(this));
             });
     });
     
     function fn_adminGoodsList(pageNo) { //페이징 함수
        var comAjax = new ComAjax();
     
        comAjax.setUrl("<c:url value='/admin/AdminGoods.do' />");//open으로 하면 콜백함수 전송이 안됨.
        comAjax.setCallback("fn_adminGoodsListCallback"); //ajax요청 후 호출될 함수의 이름 지정
        comAjax.addParam("PAGE_INDEX", pageNo);
        comAjax.addParam("PAGE_ROW", 10);
        comAjax.addParam("keyword", $('#keyword').val());
        comAjax.addParam("searchType", $('#searchType').val());
        comAjax.ajax(); //실질적인 ajax기능 수행
     }

     function fn_adminGoodsListCallback(data) {
        var total = data.TOTAL;    
        var body = $("table[name='adminGoodsList']>tbody");
        body.empty();
        if (total == 0) {
           var str = "<tr>" + "<td colspan='9'>조회된 결과가 없습니다.</td>" + "</tr>";
           body.append(str);
        } else {
           var params = {
                   divId : "PAGE_NAVI",
                   pageIndex : "PAGE_INDEX",
                   totalCount : total,
                   recordCount : 10,
                   eventName : "fn_adminGoodsList",
           };
           gfn_renderPaging(params);

           var str = "";
           $.each(data.list,function(key, value) {

              str += "<tr>"
                    + "<td><a href='#this' name='mdf'><input type='button' style='background-color:pink; border-color:pink; color:white;' class='btn btn-outline-primary btn-sm' value='수정'>"
                    + "<input type='hidden' name='GOODS_NUM' id='GOODS_NUM' value="+value.GOODS_NUM+"></a></td>"
                    + "<td><a href='#this' name='delete1'><input type='button' style='background-color:hotpink; border-color:hotpink; color:white;' class='btn btn-outline-primary btn-sm'  value='삭제'>"
                    + "<input type='hidden' name='GOODS_NUM' id='GOODS_NUM' value="+value.GOODS_NUM+"></a></td>"
                    + "<td align='center'>"+value.GOODS_NUM+"</td>"
                    + "<td>"
                    + value.GOODS_NAME
                    + "</td>"
                    + "<td>" 
                    + value.GOODS_CATEGORY1
                    + "</td>" 
                    + "<td>" 
                    + value.GOODS_CATEGORY2
                    + "</td>" 
                    + "<td>"
                    + value.GOODS_CPRICE
                    + "</td>" 
                    + "<td>"
                    + value.GOODS_MPRICE
                    + "</td>" 
                    + "</tr>";
           }); 
           body.append(str);
           $("a[name='mdf']").on("click", function(e){
               e.preventDefault();
               fn_update($(this));
           });
           $("a[name='delete1']").on("click", function(e){
               e.preventDefault();
               fn_delete($(this));
           });
         }
     }
    
</script>
</body>
</html>