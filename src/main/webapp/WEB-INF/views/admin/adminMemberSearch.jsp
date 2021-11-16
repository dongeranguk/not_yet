<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>MEMBER LIST</title>
<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
<style>
.list_hidden{display:none; cursor: pointer;}

thead>tr>th, .list_title {
   text-align: center;
}
#PAGE_NAVI{text-align: center;}
</style>
 
</head>
<body>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div style="height: 160px;"></div>
<div align="center">
   <h3>회원 검색</h3> 
</div>
<div style="height: 30px;"></div>
<div align="center">
</div>
<div align="center" style="width:1000px; margin-left:auto; margin-right:auto;">

   <ul class="nav nav-tabs">
      <li class="nav-item">
       <a style=color:hotpink; class="nav-link active" href="<c:url value='/admin/openAdminMember.do'/>">회원관리</a>
     </li>
     <li class="nav-item">
       <a style=color:black; class="nav-link" href="<c:url value='/admin/openAdminGoods.do'/>">상품관리</a>
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
     
      
      <!-- search bar -->

<!--헤더에서 검색 -->
	<div class="container" style="margin-top:20px;">
		<div style="padding:10px; float:right; display:inline-block;">
			<form method="post" action="/muscle/admin/openselectMemberSearchList.do">
				<input type="text" id="key2" name="key2" class="form-control" value="${key2}" placeholder="아이디를 입력하세요." style="width:300px; display:inline-block;"/>
				<input type="submit" value="검색" class="btn btn-primary btn-sm" style="display:inline-block; background-color:hotpink; border-color:hotpink; margin-bottom:5px;"/>
			</form>
		</div>
	</div>
	
<div>
  <table align="center" class="table table-hover" style="cellpadding:7px;" name="searchList">
         <colgroup>
         <col width="10%" />
         <col width="15%" />
         <col width="15%" />
         <col width="20%" />
         <col width="15%" />
         <col width="15%" />
         <col width="10%" />
         </colgroup>
         <thead>
            <tr style="background-color:hotpink;">
               <th scope="col">아이디</th>
               <th scope="col">이름</th>
               <th scope="col">닉네임</th>
               <th scope="col">이메일</th>
               <th scope="col">핸드폰</th>
               <th scope="col">가입날짜</th>
               <th scope="col">정지상태</th>
            </tr>
         </thead>
               <tbody>
               </tbody>
               </table>
               </div>
			<div id="PAGE_NAVI" align="center"></div>
			<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" /> <br> 
               
               
               <%-- <select id="searchOption" size="1">
                  <option id="all" value="all" selected="selected">전체</option>
                  <option id="MEM_ID" value="MEM_ID">회원 아이디</option>
                  <option id="MEM_NAME" value="MEM_NAME">회원 이름</option>
                  <option id="MEM_NICK" value="MEM_NICK">회원 닉네임</option>
               </select> 
               <input type="text" size="16" name="keyword" value="${keyword}"
                  placeholder="검색어 입력" onkeyup="fn_memList(1)">
               <input type="text" style="display: none;" />
               <!-- type="text"가 하나일때는 밑의 설명처럼 서브밋처럼 액션 주소를 따라감, 그래서 꼼수로 보이지않는 텍스트를 하나 더 넣어줌 -->
               <input type="button" value="검 색" onClick="fn_memList(1)">
 --%>
 
   </div>
   </div>
  <%@ include file="/WEB-INF/include/include-body.jspf" %>
  
  <!-- footer       -->
<div style="height:80px;">
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>


  <script type="text/javascript">
   $(document).ready(function() {
      fn_searchList(1);
      console.log($('#key2').val());
      $("a[name='click']").on("click", function(e){
          e.preventDefault();
          fn_click($(this));
           });
   });

   function fn_click(obj){
     var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/admin/openAdminMemberDetail.do'/>");
         comSubmit.addParam("MEM_NUM", obj.parent().find("#MEM_NUM").val());
         comSubmit.submit();
   }
   
   function fn_searchList(pageNo) { //페이징 함수
      var comAjax = new ComAjax();
   
      comAjax.setUrl("<c:url value='/admin/selectMemberSearchList.do' />");//open으로 하면 콜백함수 전송이 안됨.
      comAjax.setCallback("fn_searchListCallback"); //ajax요청 후 호출될 함수의 이름 지정
      comAjax.addParam("PAGE_INDEX", pageNo);
      comAjax.addParam("PAGE_ROW", 5);
      comAjax.addParam("key2", $('#key2').val());
      comAjax.ajax(); //실질적인 ajax기능 수행
   }

   function fn_searchListCallback(data) {
      var total = data.TOTAL;    
      var body = $("table[name='searchList']>tbody");
      body.empty();
      if (total == 0) {
         var str = "<tr>" + "<td colspan='8'>조회된 결과가 없습니다.</td>" + "</tr>";
         body.append(str);
         $("a[name='mem_num']").on("click", function(e){
             e.preventDefault();
             fn_click($(this));
          });
      } else {
         var params = {
                 divId : "PAGE_NAVI",
                 pageIndex : "PAGE_INDEX",
                 totalCount : total,
                 recordCount : 5,
                 eventName : "fn_searchList",
         };
         gfn_renderPaging(params);

         var str = "";
         $.each(data.list,function(key, value) {
            
            str += "<tr>"
                  + "<td align='center'>"
                  + value.MEM_ID
                  + "</td>"
                  + "<td align='center'>"
                  + value.MEM_NAME
                  + "</td>" 
                  + "<td align='center'>"
                  + value.MEM_NICK
                  + "</td>"
                  + "<td align='center'>"
                  + value.MEM_EMAIL 
                  + "</td>"
                  + "<td align='center'>" 
                  + value.MEM_PHONE
                  + "</td>" 
                  + "<td align='center'>" 
                  + value.MEM_JOINDATE
                  + "</td>" 
                  + "<td align='center'>" 
                  + "<a style=color:hotpink; href='#this' name='mem_num'>"
                  + value.MEM_DEL_GB
                  + "<input type='hidden' id='MEM_NUM' name='MEM_NUM' value="+value.MEM_NUM +">"
                  + "</a>"
                  + "</td>" 
                  + "</tr>";
         }); 
         body.append(str);
         $("a[name='mem_num']").on("click", function(e){
             e.preventDefault();
             fn_click($(this));
          });
      }
   }
   </script>
</body>
</html>