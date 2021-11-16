<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>
<style>
@import url(https://fonts.googleapis.com/css?family=Open+Sans);


#detailSearch{
	font-family: 'Open Sans', sans-serif; 
	text-align: left;
	font-weight: bold;
	color: pink;
	border: gray;
	background-color:transparent;
}

body{
  
  font-family: 'Open Sans', sans-serif;
}


.detailInfo{
	color: gray;
	font-size: 15px;
	align: Left;
}


#DetailCheckBox{
	border: 1px solid gray;
	border-collapse: collapse;
	display:inline-block; 
	width:120%; 
	align:center;
	border-radius: 10px;
}

#gds_name{
	text-align: left;
	font-size: 15pt;
	font-weight: bold;
	background: white;
	color: black;
	border: white;
}

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

table {
   border-collapse: collapse;
   border-spacing: 0;
   border: none;
}

.detailSearchList{
    align: Left;
    border: 1px solid gray;
    width: 120%;
    border-collapse: collapse;
    
}

</style>

<body>

<%@ include file="/WEB-INF/views/template/header.jsp"%>


<div style="height: 160px;"></div>
<div align="center">
   <h3>Search</h3> 
</div>
<div style="height: 50px;"></div>

<div style="width:1000px; margin-left:auto; margin-right:auto;" align="center">
   <div align="left">
   
   <strong>${keyword} </strong>(으)로 검색된 상품
   </div>
   <hr>
   <div align="center">


   <form:form action="/muscle/main/openMainSearch.do" modelAttribute="searchDetailVO" commandName="searchDetailVO">
	<table id="DetailCheckBox">
		<tr>
	  		<th>카테고리</th>
	  	</tr>
	  	<tr>
		  	<td>
			 	홈트레이닝 <form:checkbox class="checkBoxSort" name="category1" path="category1" value="홈트레이닝" />
		   	</td>
		   	<td>	
		   		식품 <form:checkbox class="checkBoxSort" name="category1" path="category1" value="식품"/>
			</td>
			<td>
		 		홈케어 <form:checkbox class="checkBoxSort" name="category1" path="category1" value="홈케어"/>
		 	</td>
		</tr>
		
	  	<tr>
	  	<th>카테고리2</th>
		</tr>
		<tr>
		   	<td>
		   		운동복(남) <form:checkbox class="checkBoxSort" name="category2" path="category2" value="운동복(남)"/>
		   	</td>
		   
		   	<td>
		   		운동복(여) <form:checkbox class="checkBoxSort" name="category2" path="category2" value="운동복(여)"/>
		   	</td>
		   
		   	<td>
		   		운동용품 <form:checkbox class="checkBoxSort" name="category2" path="category2" value="운동용품"/>
		   	</td>
		   
		   	<td>
		   		운동악세서리 <form:checkbox class="checkBoxSort" name="category2" path="category2" value="운동악세서리"/>
		   	</td>
		   	<td>
		   		식사대용 <form:checkbox class="checkBoxSort" name="category2" path="category2" value="식사대용"/>
		   	</td>
		   
		   	<td>
		   		건강간식 <form:checkbox class="checkBoxSort" name="category2" path="category2" value="건강간식"/>
		   	</td>
		   
		   	<td>
		   		보충제 <form:checkbox class="checkBoxSort" name="category2" path="category2" value="보충제"/>
		   	</td>
		   
		   	<td>
		   		건강음료 <form:checkbox class="checkBoxSort" name="category2" path="category2" value="건강음료"/>
		   	</td>
		   
		   	<td>
		   		향초 <form:checkbox class="checkBoxSort" name="category2" path="category2" value="향초"/>
		   	</td>
		   
		   	<td>
		   		향수 <form:checkbox class="checkBoxSort" name="category2" path="category2" value="향수"/>
		   	</td>
		   
		   	<td>
		   		디퓨저 <form:checkbox class="checkBoxSort" name="category2" path="category2" value="디퓨저"/>
		   	</td>
		   
		   	<td>
		   		제습/가습 <form:checkbox class="checkBoxSort" name="category2" path="category2" value="제습/가습"/>
		   	</td>
		   
		   	<td>
		   		무드등 <form:checkbox class="checkBoxSort" name="category2" path="category2" value="무드등"/>
		   	</td>
		</tr>
		<tr>
			<th>사이즈</th>
		</tr>
			<td>
	   		FREE <form:checkbox class="checkBoxSort" name="size" path="size" value="FREE"/>
		   	</td>
			<td>
		   		S <form:checkbox class="checkBoxSort" name="size" path="size" value="S"/>
		   	</td>
			<td>
		   		M <form:checkbox class="checkBoxSort" name="size" path="size" value="M"/>
		   	</td>
			<td>
		   		L <form:checkbox class="checkBoxSort" name="size" path="size" value="L"/>
		   	</td>
			<td>
		   		XL <form:checkbox class="checkBoxSort" name="size" path="size" value="XL"/>
		   	</td>
		<tr>
			<th>색상</th>
		</tr>
			<td>
		   		RED <form:checkbox class="checkBoxSort" name="color" path="color" value="RED"/>
		   	</td>
			<td>
		   		BLUE <form:checkbox class="checkBoxSort" name="color" path="color" value="BLUE"/>
		   	</td>
			<td>
		   		BLACK <form:checkbox class="checkBoxSort" name="color" path="color" value="BLACK"/>
		   	</td>
			<td>
		   		WHITE <form:checkbox class="checkBoxSort" name="color" path="color" value="WHITE"/>
		   	</td>
			<td>
		   		GREEN <form:checkbox class="checkBoxSort" name="color" path="color" value="GREEN"/>
		   	</td>
		<tr>
			<td colspan="4">
			   	상품명 : <input type="text" id="keyword" name="keyword" value="${keyword}" /> 
		 	</td>
		</tr>
		<tr>
			<td>
			<input type="submit" id="detailSearch" value="상세검색" />
			</td>
		</tr>
	</table>
   </form:form>
   </div>
   
<colgroup> <col width="10%"/> 
	<col width="*"/> 
	<col width="15%"/> 
	<col width="20%"/> 
</colgroup> 
	<c:choose>
	 <c:when test="${fn:length(detailList) > 0 }"> 
 		<c:forEach items="${detailList}" var="list">
 			<table class="detailSearchList"> 
			<form action="/muscle/shop/goodsDetail.do" >
					<tr>
						<td>
							<img src='/muscle/img/goods_upload/${list.GOODS_IMG_THUM}' width='200' height='210'> 
						</td>
						<td class="detailInfo" align="left">
							<input type="hidden" id="IDX" name="IDX" value="${list.GOODS_NUM}" />
							<input id="gds_name" type="submit" value="${list.GOODS_NAME}" /> <br/><br/>
							카테고리1 	: ${list.GOODS_CATEGORY1}<br/>
							카테고리2 	: ${list.GOODS_CATEGORY2}<br/>
							사이즈	: ${list.GOODS_SIZE}<br/>
							색상		: ${list.GOODS_COLOR}<br/>
							좋아요	: ${list.GOODS_LIKECNT}<br/>
							등록일	: <fmt:formatDate value="${list.GOODS_DATE}" pattern="yyyy-MM-dd"/><br/>
						</td>
						<td id="detailPrice" align="center">회원가격 : ${list.GOODS_MPRICE}</br>
															비회원가격 : ${list.GOODS_NMPRICE}
						</td>
					</tr>
			</table>						<%-- <a href='/muscle/shop/goodsDetail.do'>${list.GOODS_NAME} </a> --%>
			</form>
			<% 	int cnt =+ 1; %>
  		</c:forEach>
  		</c:when>
	<c:otherwise>
		<tr>
         	<td colspan="6" align=center> 조회된 결과가 없습니다.</td>
         </tr>
	</c:otherwise>
	</c:choose>
	
	
	<table>
	<tr>

	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	<input type="hidden" id="cnt" name="cnt" value=""/>
	<br/>
	
	
	
<%@ include file="/WEB-INF/include/include-body.jspf" %>

<div style="height:80px;"> 
 
</div>
<footer style="border-top:1px solid #D5D5D5;">
</body>
</html>