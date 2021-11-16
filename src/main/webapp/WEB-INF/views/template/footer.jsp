<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script src="<c:url value='/js/openNewWindow.js'/>" charset="utf-8"></script>
<style>
</style>
</head>
<body>

<div style="margin-top:15px;">
	<div class="footer-group, col-md-4 col-md-4 col-md-4, text-center" style="float:left;">
               <h5><strong><font color='pink'> Our Center </font></strong></h5>
                  <div class="divst-unstyled quick-divnks, text-center">
					<div><a href="/muscle/client/acsBoardList.do"><font color='hotpink'>&nbsp;NOTICE</font></a></div>
					<div><a href="/muscle/client/faqBoardList.do"><font color='hotpink'>FAQ</font></a></div>
					<div><a href="javascript:void(onclick.onechat())"><font color='hotpink'>1:1 문의</font></a></div> 
					<div><a href="#this" onClick="javascript:openTracking();"><font color='hotpink'>배송조회</font></a></div>


<!--                  

<div><input type="button" onclick="onechat()" value="1:1 문의"><i class="fa fa-angle-double-right"></i></div>
 -->                 
                  
                  </div>
            </div>
            <div class="footer-group, col-md-4 col-md-4 col-md-4, text-center" style="float:left; margin-bottom:2px;">
               <h5><strong><font color='pink'> Company Information </font></strong></h5>
                  <div class="divst-unstyled quick-divnks, text-center">
                     <div></div>
                     <p><p>
                     <div> <font color='hotpink'>행복한 삼대오백 길 걷자 !</font></div>
                     <div><font color='hotpink'>사업자 번호 : 353-3353535</font></div>
                  </div>
            </div>
            <div class="footer-group, col-md-4 col-md-4 col-md-4, text-center" style="float:left;">
               <h5><strong><font color='pink'> Bank </font></strong></h5>
                  <div class="divst-unstyled quick-divnks, text-center">
                     <div><font color='hotpink'>은행  : 국민은행</font></div> 
                     <div><font color='hotpink'> 예금주  : 삼대오백</font></div>
                     <div> <font color='hotpink'>계좌 번호  : 3500-0035-3035 </font></div>
                  </div>
            </div>
</div>
 
 
 
 
</body>
<!-- 실행순서가 자바 -> jstl -> html -> 스크립트여서 분리불가 -->

<script>
(function onechat() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "5414b0de-7514-46f8-8f48-b68f77f4b255", //please fill with your plugin key
    "memberId": "${session_MEMBER.MEM_ID}", //fill with user id
    "profile": {
      "name": "${session_MEMBER.MEM_NICK}", //fill with user name
      "mobileNumber": "${session_MEMBER.MEM_PHONE}", //fill with user phone number
      "CUSTOM_VALUE_1": "VALUE_1", //any other custom meta data
      "CUSTOM_VALUE_2": "VALUE_2"
    }
  }); 

</script>
</html>