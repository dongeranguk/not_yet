<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>상품페이지</title>
<head>

<link href="<c:url value="/css/board.css"/>" rel="stylesheet">

<link href="<c:url value="/css/btn.css"/>" rel="stylesheet">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />

<!-- bx -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>



<style>

#main-container
{
   margin:0px;
   min-height: 400px;
   padding: 20px;
   border-top: 1px solid #fff;  
   border-right: 1px solid #fff;     
   border-left: 1px solid #fff; 
   border-bottom: 1px solid #fff;    
}



/* 검색버튼 시작 */
@import url(https://fonts.googleapis.com/css?family=Open+Sans);

body{
  
  font-family: 'Open Sans', sans-serif;
}

.search {
  width: 100%;
  position: relative;
  display: flex;
}

.searchTerm {
  width: 100%;
  border: 3px solid #C86060;
  border-right: none;
  padding: 5px;
  height: 20px;
  border-radius: 5px 0 0 5px;
  outline: none;
  color: #C86060;
}

.searchTerm:focus{
  color: #C86060;
}

.searchButton {
  width: 60px;
  height: 36px;
  border: 1px solid #C86060;
  background: #C86060;
  text-align: center;
  color: #fff;
  border-radius: 0 5px 5px 0;
  cursor: pointer;
  font-size: 20px;
}

/*Resize the wrap to see the search bar change!*/
.wrap{
  width: 20%;
  position: absolute;
  top: 300px;
  left: 50%;
  transform: translate(-50%, -50%);
}
/* 검색버튼 끝 */

.font1 {
   font-size: 14px;
    color: #666;
    letter-spacing: -0.5px;
    line-height: 24px;
    white-space: normal;
    line-height: 27px;
}

.font2 {
   display: block;
    font-size: 16px;
    font-weight: 400;
    color: #333;
    font-family: unset;
    line-height: 27px;
}

/* css 초기화  */



table {
   border-collapse: collapse;
   border-spacing: 0;
   border: none;
}
/*css 초기화*/
.card {
   float:left;
   height: 300px;
   width: 21%;
   display: inline-block;
   margin-top: 30px;
   margin-left: 30px;
   margin-bottom: 30px;
   position: relative;
   overflow: hidden;
   border: none;
}
.card-header {
   -webkit-transition: 0.5s; /*사파리 & 크롬*/
    -moz-transition: 0.5s;  /*파이어폭스*/
    -ms-transition: 0.5s;   /*인터넷 익스플로러*/
    -o-transition: 0.5s;  /*오페라*/
    transition: 0.5s;
   width: 100%;
   height: 270px;
   border-radius: 15px 15px 0 0;
   background-image: url("resources/images/no_image.png");
   background-size: 100% 280px;
   background-repeat: no-repeat;   
}

.card-header-is_closed{
    background-color: #EF5A31 ;
    color: #FFF ;
    font-weight: bold ;
    text-align: center ;
    float: right;
    margin: 15px 15px 0 0;
    border-radius: 50%;
    font-weight: bold;
    padding: 10px 10px;
    line-height: 20px;
}
.card-header-is_closed2{
    background-color: #3fb50e ;
    color: #FFF ;
    font-weight: bold ;
    text-align: center ;
    float: right;
    margin: 15px 15px 0 0;
    border-radius: 50%;
    font-weight: bold;
    padding: 10px 10px;
    line-height: 20px;
}


.card-body-header{
   line-height: 25px;
   margin: 10px 20px 0px 20px;
}
.card-body-description  {
    opacity: 0;
    color: #757B82;
    line-height: 25px;
    -webkit-transition: .2s ease-in-out; /*사파리&크롬*/
    transition : .2s ease-in-out;
    overflow: hidden;
   height: 180px;
   margin: 5px 20px;
}

.card-body-hashtag {
   color: #2478FF;
   font-style: italic;
}
.card-body-footer {
     position: absolute; 
     margin-top: 15px;
     margin-bottom: 6px;
    bottom: 0; 
    width: 314px;
    font-size: 10px;
    color: #9FA5A8;
    padding: 0 10px;
}
.icon {
    display: inline-block;
    vertical-align: middle;
    margin-right: 2px;
}

 
.imgswap img:last-child{display:none}

</style>

</head>

<body>

<!-- header -->
<%@ include file="/WEB-INF/views/template/header.jsp"%>

<div style="height: 160px;"></div>

<div align="center">
   <h3 align=center>
   <c:if test="${cate eq '홈트레이닝'}" ><b><strong>Home Training</strong></b></c:if>
   <c:if test="${cate eq '식품'}"><b><strong>Healthy Diet</strong></b></c:if>
   <c:if test="${cate eq '홈케어'}"><b><strong>Home Care</strong></b></c:if>
   </h3> 
</div>
<div style="height: 50px;"></div>

<!-- body -->
<div style="width:1000px; margin-left:auto; margin-right:auto;">

<!-- 드롭다운 -->
<div style="display:inline-block; float:left;">
<form method="post">      
   <input type="hidden" id="path" value="${path}" />   
   <div style="margin-left:50px;">
      <div class="search">
         <select class="GOODS_CATEGORY2" name="GOODS_CATEGORY2" id="GOODS_CATEGORY2" value="${GOODS_CATEGORY2}" onchange="fn_selectGoodsList(1)">
         <c:if test="${cate eq '홈트레이닝'}">
            <option value="">전체</option>
            <option value="운동복(남)">운동복(남)</option>
         <option value="운동복(여)">운동복(여)</option>
         <option value="운동용품">운동용품</option>
         <option value="운동악세서리">운동악세서리</option>
      </c:if>
      <c:if test="${cate eq '식품'}">
      <option value="">전체</option>
         <option value="식사대용">식사대용</option>
         <option value="건강간식">건강간식</option>
         <option value="보충제">보충제</option>
         <option value="건강음료">건강음료</option>
      </c:if>
      <c:if test="${cate eq '홈케어'}">
      <option value="">전체</option>
         <option value="향초">향초</option>
         <option value="향수">향수</option>
         <option value="디퓨저">디퓨저</option>
         <option value="제습/가습">제습/가습</option>
         <option value="무드등">무드등</option>
      </c:if>
      </select>
      </div>
   </div>
</form>
</div>

<div align="center" style="display:inline-block; float:right; margin-right:50px;">
   <table>
      <tr>
         <td>
         </td>
         <td class="font1"><a href="/muscle/shop/goodsList/${category}/NewItem.do" style=color:hotpink;>신상품순</a></td> <td>|</td>
         <td class="font1"><a href="/muscle/shop/goodsList/${category}/favorite.do" style=color:hotpink;>인기상품순</a></td> <td>|</td>
         <td class="font1"><a href="/muscle/shop/goodsList/${category}/low.do" style=color:hotpink;>낮은가격순</a></td> <td>|</td>
         <td class="font1"><a href="/muscle/shop/goodsList/${category}/high.do" style=color:hotpink;>높은가격순</a></td> 
      </tr>
   </table>
</div>

<div id="main-container">
<table class="GOODS_LIST" style="width:100%">
      <colgroup>
         <col width="100%" />
      </colgroup>
      <thead>
         <tr>
         </tr>
      </thead>
      <tbody>
      
      </tbody>
      </table>



</div>
<br>
<div id="PAGE_NAVI" align="center"></div>
<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />





 
</div>
<div style="height:80px;"> </div>
<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>

<script type="text/javascript">

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(document).ready(function() {
   
   fn_selectGoodsList(1);
   
   $("a[name='TITLE']").on("click", function(e){ //제목 //name 이 title인거
      console.log("잘들어옴");
      e.preventDefault();
      fn_openBoardDetail($(this));
   });
});

function fn_openBoardDetail(obj) {
   console.log("잘들어옴22");
   var comSubmit = new ComSubmit(); // 객체생성
   comSubmit.setUrl("<c:url value='/shop/goodsDetail.do' />"); // url설정
   comSubmit.addParam("IDX", obj.parent().find("#IDX").val()); // IDX; id로 값을넘김
   comSubmit.submit();
   
}


function fn_selectGoodsList(pageNo) {
   var comAjax = new ComAjax();

   //alert(${orderBy});
   comAjax.setUrl("<c:url value='/shop/cateGoodsList/${category}/${orderBy}.do' />");
   comAjax.setCallback("fn_selectGoodsListCallback");
   comAjax.addParam("PAGE_INDEX", pageNo);
   comAjax.addParam("PAGE_ROW", 16);
   comAjax.addParam("GOODS_CATEGORY2", $('#GOODS_CATEGORY2').val());
   comAjax.ajax();

   
}

function fn_selectGoodsListCallback(data) {
   var total = data.TOTAL;
   var body = $(".GOODS_LIST");
   body.empty();
   if (total <= 0) {
      var str = "<tr>" + "<td colspan='4' align='center' style='margin-top:50'>조회된 결과가 없습니다.</td>"
            + "</tr>";
      body.append(str);
   } else {
      var params = {
         divId : "PAGE_NAVI",
         pageIndex : "PAGE_INDEX",
         totalCount : total,
         recordCount : 16,
         eventName : "fn_selectGoodsList"
      };
      gfn_renderPaging(params);
     

      var str = "";
      
      $.each(data.list, function(key, value) {
                     var imgpath = "<img src='/muscle/img/goods_upload/"+value.GOODS_IMG_THUM+"' width='200' height='210'>"
                     //alert(value.GOODS_IMG_THUM);
                     var imgpath1 = value.GOODS_IMG_THUM.split(',');
                     var img0 = imgpath1[0];
                     var img1 = imgpath1[1];
                     
                     
                     var Pick = value.GOODS_HASH.split(',');
                     //alert(value.GOODS_HASH);
                     var pick1 = "";
                     var pick2 = "";
                     var pick3 = "";
                     var pick4 = "";
                     var num = "";
                     for (var i=0; i<Pick.length; i++) {
                           Pick[i];
                           if(Pick[0] == null){
                              pick1 = "";
                           }else{
                              pick1 = Pick[0];
                           }
                           if(Pick[1] == null){
                              pick2 = "";
                           }else {
                              pick2 = Pick[1];
                           }
                           if(Pick[2] == null){
                              pick3 = "";
                           }else {
                              pick3 = Pick[2];
                           }
                           if(Pick[3] == null){
                              pick4 = "";
                           }else{
                              pick4 = Pick[3];
                           }
                        }

                     
                                 
                     str += "<div class='card'>"
                        +      "<a href='#this' name='TITLE'>"
                        +      "<div class='imgswap'>"
                        +       "<img src='/muscle/img/goods_upload/"+img0+"' width='200' height='210'>" 
                        +       "<img src='/muscle/img/goods_upload/"+img1+"' width='200' height='210'>"
                        +     " </div> "
                        +     " <c:if test='${"+num+" ne "+pick1+"}'> "
                        +      " <span style='background-color:#FFB2F5; line-height: 27px; border-radius: 7px;'><font color='#ffffff' size='2'> "
                        +      pick1 +"</font></span>"   
                        +     " </c:if>"
                        +     " <c:if test='${"+num+" ne "+pick2+"}'> "
                        +     " <span style='background-color:#F361DC; line-height: 27px; border-radius: 7px;'><font color='#ffffff' size='2'> "
                        +      pick2 + "</font></span>"
                        +     " </c:if>"
                        +     " <c:if test='${"+num+" ne "+pick3+" }'> "
                        +     " <span style='background-color: #F361A6; line-height: 27px; border-radius: 7px;'><font color='#ffffff' size='2'> "  
                        +       pick3 + "</font></span>"
                        +     " </c:if>"
                        +     " <c:if test='${"+num+" ne "+pick4+" }'> "
                        +     " <span style='background-color:#FFB2F5; line-height: 27px; border-radius: 7px;'><font color='#ffffff' size='2'> "  
                        +       pick4 + "</font></span>"
                        +     " </c:if> <br>"
                        +     " <font class='font1'>"+value.GOODS_NAME+"</font><br>"
                        +     " <font class='font2'>"+numberWithCommas(value.GOODS_MPRICE)+"원</font> "   
                        +       " <input type='hidden' id='IDX' name='IDX' value=" + value.GOODS_NUM + ">"
                        +     " </a>"
                        +" </div>";
            
                  });
      

      body.append(str);
      $("a[name='title']").on("click", function(e){ //제목 
         e.preventDefault();
         fn_openBoardDetail($(this));
      });
      
   }

}



</script>

</body>
</html>


