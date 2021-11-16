<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
td{
	margin:50px;
	padding-left:15px;
	padding-right:15px;
}
</style>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
</head>
<body>
	<table align="center">
		<tbody>
		</tbody>
	</table>
	<div id="PAGE_NAVI" align="center"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
    <br/>
    <%@ include file="/WEB-INF/include/include-body.jspf" %>
    <script type="text/javascript">
		    $(document).ready(function(){
		        fn_showList(1);
		        if($("#keyword").val()==""){
					alert("검색내용을 입력해주세요.");
					$("#keyword").focus();
					return false;
		            }
		});
         
         function fn_showList(pageNo){
            var keyword = "${map.keyword }"
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/main/selectSearchList'/>");
			comAjax.setCallback("fn_showListCallback");
			comAjax.addParam("GOODS_NAME", keyword);
			comAjax.ajax();
        }

        function fn_showListCallback(data){
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if(total == 0){
				var str = "<tr>"+
							"<td colspan='4'>검색 된 공연이 없습니다.</td>"+
							"</tr>";
				body.append(str);
			}else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					eventName : "fn_showList"
				};
				gfn_renderPaging(params);

				var list_count = 1;
				var str = "";
				str += "<tr>"
				$.each(data.list, function(key, value){
					str += "<td align='center'>"+"<a href='#this' name='title'>"+"<img src='<c:url value='/poster/"+value.SHOW_IMAGE+"'/>' width='100' height='100'>"+"</a>"+
						"<br>"+"<input type='hidden' id='SHOW_NUM' value='"+value.SHOW_NUM+"'>"+value.SHOW_NAME+"</td>";
					if(list_count == 4){
						str += "</tr>"+
								"<tr>";
						list_count = 0;
					}
					list_count += 1;

				});
				str += "</tr>";
				body.append(str);

				$("a[name='title']").on("click", function(e){ //제목 
	                   e.preventDefault();
	                   fn_openShowDetail($(this));
	               });
			}
        }
    </script> 
${keyword }
</body>
</html>