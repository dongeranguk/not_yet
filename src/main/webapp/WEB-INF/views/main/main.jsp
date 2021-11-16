<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/banner.css'/>" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>


<%-- <link href="<c:url value='/css/goods.css'/>" rel="stylesheet"> --%>
<link href="<c:url value="/css/board.css"/>" rel="stylesheet">
<link href="<c:url value="/css/btn.css"/>" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="<c:url value='../css/ui.css'/>" />
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
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

a { 
   text-decoration:none;
   color:#000000;
}


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
<container>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
</container>

<div style="height:90px;">
</div> 
<!-- Slider main container -->
<div class="swiper-container">
    <!-- Additional required wrapper -->
    <div class="swiper-wrapper">
        <!-- Slides -->						<!-- 메인이미지 변경 -->
        <div class="swiper-slide"><img src="https://1.bp.blogspot.com/-SDa25WJP7OY/X9g_5qYZycI/AAAAAAAAAAc/aGLnYWlSu40iH-j9e0b04-H3ROY09AGsACLcBGAsYHQ/s3762/3.png" width="100%"></div>
        <div class="swiper-slide"><img src="https://1.bp.blogspot.com/-HZs56A6K6Gc/X9g_3--roFI/AAAAAAAAAAY/tJ-15frLOxcrjREQgy-6na-sf26_N4J6gCLcBGAsYHQ/s3762/2.png" width="100%"></div>
        <div class="swiper-slide"><img src="https://1.bp.blogspot.com/-Qvm7-etLMIY/X9g-S3Ew7YI/AAAAAAAAAAM/YEmrRtEkKSsngddhoYIsFtfEt8qo63udACLcBGAsYHQ/s3762/1.png" width="100%"></div>
    </div>
    <!-- If we need pagination -->
    <div class="swiper-pagination"></div>

    <!-- If we need navigation buttons -->
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
</div>

<br><br>  

<div align="center" class="container" style="width:68%; color:hotpink;">
   <h3>Top 8, ${session_MEMBER.MEM_NUM}, ${session_MEMBER.MEM_ADMIN}</h3>
   <div id="main-container">
<table class="HOT_GOODS_LIST" style="width:100%">
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
</div>

<hr style="align:center; width:1000px;">

<div align="center" class="container" style="width:68%; color:hotpink;">
   <h3>New</h3> 
   <div id="main-container">
<table class="NEW_GOODS_LIST" style="width:100%">
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
</div>

<hr style="align:center; width:1000px;"> 


<div align="center">
   <div style="display:inline-block; width:500px; padding-right:7px; border-right:1px solid #D5D5D5;" align="center">
      <div style="width:60%;">
      <a href="/muscle/client/acsBoardList.do" style="text-decoration:none; color:pink;">
      <h3 style="margin-bottom:10px;">Notice</h3></a>
      </div>
      <div>
      <ul class="list-group list-group-flush">
         <c:forEach items="${Nlist}" var="Nrow">
        <li class="list-group-item">
        <a href="#this" name="Ntitle" style=color:pink;>${Nrow.NOTICE_TITLE}</a>
          <input type="hidden" id="NOTICE_NUM" value="${Nrow.NOTICE_NUM}"></li>
      </c:forEach>
      </ul>
      </div>
   </div>    
 
   <div style="display:inline-block; width:500px;" align="center">  
      <a href="/muscle/board/openBoardList.do" style="text-decoration:none; color:#000000;"><h3 style="margin-bottom:10px; color:hotpink;">Hot</h3></a>
      <ul class="list-group list-group-flush">
        <c:forEach items="${list}" var="row">
        <c:if test="${session_MEMBER.MEM_NUM != null}">
        <li class="list-group-item">
        <a href="#this" name="Btitle" style=color:hotpink;>${row.BOARD_TITLE} [${row.TOTAL_COMMENTS}]</a>
          <input type="hidden" id="BOARD_NUM" value="${row.BOARD_NUM}"></li>
          </c:if>
          <c:if test="${session_MEMBER.MEM_NUM == null}">
        <li class="list-group-item">
        <a href="#this" name="titleles" style=color:hotpink;>${row.BOARD_TITLE} [${row.TOTAL_COMMENTS}]</a>
          <input type="hidden" id="BOARD_NUM" value="${row.BOARD_NUM}"></li>
          </c:if>
      </c:forEach>
      </ul>
   </div> 
</div>


 
  
<div style="height:80px;"> 
 
</div>

<footer style="border-top:1px solid #D5D5D5;">
<%@ include file="/WEB-INF/views/template/footer.jsp"%> 
</footer>



<script type="text/javascript"> 
var mySwiper = new Swiper('.swiper-container', {
     // Optional parameters
     direction: 'horizontal',
     loop: true,
     

     // If we need pagination
     pagination: {
       el: '.swiper-pagination',
     },

     // Navigation arrows
     navigation: {
       nextEl: '.swiper-button-next',
       prevEl: '.swiper-button-prev',
     },

     autoplay: {
          delay: 5000,
   }

})

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(document).ready(function() {
   
   fn_selectGoodsList(1);
   fn_selecthotGoodsList(1);

   $("a[name='TITLE']").on("click", function(e){ //제목 //name 이 title인거
         console.log("잘들어옴");
         e.preventDefault();
         fn_openGoodsDetail($(this));
      });
   
   $("a[name='Ntitle']").on("click",function(e){
      e.preventDefault();
      fn_openNoticeDetail($(this));
   });

   $("a[name='Btitle']").on("click",function(e){
         e.preventDefault();
         fn_openBoardDetail($(this));
   });
   
   $("a[name='titleles']").on("click",function(e){
      e.preventDefault();
      alert("로그인 후 열람 가능합니다.");
      return false;
      });
   
});

function fn_openGoodsDetail(obj) {
   console.log("잘들어옴22");
   var comSubmit = new ComSubmit(); // 객체생성
   comSubmit.setUrl("<c:url value='/shop/goodsDetail.do' />"); // url설정
   comSubmit.addParam("IDX", obj.parent().find("#IDX").val()); // IDX; id로 값을넘김
   comSubmit.submit();
   
}

function fn_openBoardDetail(obj){
    var comSubmit = new ComSubmit(); 
    comSubmit.setUrl("<c:url value='/board/openBoardDetail.do'/>");
     comSubmit.addParam("BOARD_NUM", obj.parent().find("#BOARD_NUM").val());
     comSubmit.submit();
    } 

function fn_openNoticeDetail(obj){
    var comSubmit = new ComSubmit(); 
    comSubmit.setUrl("<c:url value='/client/openAcsDetail.do'/>");
     comSubmit.addParam("NOTICE_NUM", obj.parent().find("#NOTICE_NUM").val());
     comSubmit.submit();
    } 


function fn_selectGoodsList(pageNo) {
   var comAjax = new ComAjax();

   //alert(${orderBy});
   comAjax.setUrl("<c:url value='/shop/newGoodsList.do' />");
   comAjax.setCallback("fn_selectGoodsListCallback");
   comAjax.addParam("PAGE_INDEX", pageNo);
   comAjax.addParam("PAGE_ROW", 1);
   comAjax.ajax();

   
}



function fn_selectGoodsListCallback(data) {
   var total = data.TOTAL;
      var body = $(".NEW_GOODS_LIST");
      body.empty();
      if (total <= 0) {
         var str = "<tr>" + "<td colspan='4' align='center'>조회된 결과가 없습니다.</td>"
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
                           +      " <span style='background-color:#FFB2F5; line-height: 27px; border-radius: 10px;'><font color='#ffffff' size='2'> "
                           +      pick1 +"</font></span>"   
                           +     " </c:if>"
                           +     " <c:if test='${"+num+" ne "+pick2+"}'> "
                           +     " <span style='background-color:#F361DC; line-height: 27px; border-radius: 10px;'><font color='#ffffff' size='2'> "
                           +      pick2 + "</font></span>"
                           +     " </c:if>"
                           +     " <c:if test='${"+num+" ne "+pick3+" }'> "
                           +     " <span style='background-color:#F361A6; line-height: 27px; border-radius: 10px;'><font color='#ffffff' size='2'> "  
                           +       pick3 + "</font></span>"
                           +     " </c:if>"
                           +     " <c:if test='${"+num+" ne "+pick4+" }'> "
                           +     " <span style='background-color:#FFB2F5; line-height: 27px; border-radius:10px;'><font color='#ffffff' size='2'> "  
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
            fn_openGoodsDetail($(this));
         });
         
      }
      

}

function fn_selecthotGoodsList(pageNo) {
      var comAjax = new ComAjax();

      //alert(${orderBy});
      comAjax.setUrl("<c:url value='/shop/bestGoodsList.do' />");
      comAjax.setCallback("fn_selecthotGoodsListCallback");
      comAjax.addParam("PAGE_INDEX", pageNo);
      comAjax.addParam("PAGE_ROW", 1);
      comAjax.ajax();

      
   }

   function fn_selecthotGoodsListCallback(data) {
      var total = data.TOTAL;
         var body = $(".HOT_GOODS_LIST");
         body.empty();
         if (total <= 0) {
            var str = "<tr>" + "<td colspan='4' align='center'>조회된 결과가 없습니다.</td>"
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
                              +     " <span style='background-color:#F361A6; line-height: 27px; border-radius: 7px;'><font color='#ffffff' size='2'> "  
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
               fn_openGoodsDetail($(this));
            });
            
         }
         

   }
</script>
</body>
</html>