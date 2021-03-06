<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/css/main.css">
<meta charset="UTF-8">
<title>풋살장추가</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 

<script>

	 $(document).ready(function() {
			var i=1;				
			$("#plus").click(function() {			
			$("#placeDiv table").append("<tr><td><input id='startTime"+i+"' type='text' placeholder='시작시간'></td><td>~</td><td><input id='endTime"+i+"' type='text' placeholder='종료시간'></td></tr>");			
			$("#timeRowNum").val(i);
			i++;  
		});
			
			$("#minus").click(function() {			
				 $("#placeDiv table tr:last").remove();
			});
		
	});
</script>
<style>
#wrap
{
	width: 70%;
	overflow: hidden;
	margin: 0 auto;
}
#wrap div:first-child {
	width: 70%;
	box-sizing:border-box;
	float: left;
}
#wrap div:last-child {
	width: 70%;
	
	box-sizing:border-box;
	float: center;
} 
</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" class="alt">
			<a href="/main" class="logo"><strong>matching</strong>
				<span>kick together</span></a>
			<nav>
				<a href="#menu">Menu</a>
			</nav>
		</header>

		<!-- Menu -->
		<nav id="menu">
			<jsp:include page="/WEB-INF/view/nav.jsp" />
		</nav>
		<!-- <section id="one">	 -->		
		<header style= "text-align: center">
			<h1 align="center">풋살장추가</h1>
		</header>

	<div id="wrap">
	<!-- <form action="admin.do" method="post"> -->
	<table>
		<tr>
			<td>풋살장 이름</td>
			<td colspan="3"><input id="placeName" type="text" value=""></td>
		</tr>
		<tr>
			<td>풋살장 주소</td>
			<td colspan="3"><input id="placeAddr" type="text" value=""></td>
		</tr>
		<tr>

			<td>풋살장 관리자</td>
			<td><input id="placeManager" type="text" value="${authUser.memberId}" disabled="disabled"></td>

			<td>풋살장 전화번호</td>
			<td><input id="placeTel" type="text" value=""></td>
		</tr>
		<tr>
			<td colspan="1">최대 인원 수</td>
			<td colspan="2"><input id="maxPerson" type="text" value="" ></td>
			<td><strong>명</strong></td>
		</tr>
		<tr>
			<td>타임 당 금액</td>
			<td colspan="3"><input id="placeCost" type="text" value="" placeholder="10000원"></td>

		</tr>
		<%-- <tr>
			<td>풋살장 점장</td>
			<td><input name="placeManager" type="text" value="${authUser.author}"></td>
		</tr> --%>
		<tr>
			<td colspan="3">풋살장 운영시간</td>
			<td><input id="plus" type="button" value="추가"> 
			<input type='button' value='삭제' id="minus" style="margin-left:60px;"/></td>								
		</tr>				
	</table>
	<!-- <input type="submit" value="제출"> -->
	<div id="placeDiv">
      <table>
         
      </table>   
   </div>
	<button  type="button" class="btn btn-info" id="addPlace" style="margin-left:85%;">등록</button>
	<input type="hidden" name="timeRowNum" id="timeRowNum">
	<!-- </form> -->
	</div>
	<!-- </section> -->
	</div>
	
	<script>
		
	
		$('#addPlace').click(function(){
				var operationTimeListSample = new Array();
			
			
				for(var i=1; i<=$('#timeRowNum').val();i++) {
					var operationTimeArray = new Object();
					operationTimeArray.startTime=$("#startTime"+i).val();
					operationTimeArray.endTime=$("#endTime"+i).val();
					operationTimeListSample[i-1]=operationTimeArray;
					
				}
			
				
			/* 	var x=JSON.stringify(operationTimeListSample); */
				var PlaceAndOperation=JSON.stringify({
				placeName:$('#placeName').val(),				
				placeAddr:$('#placeAddr').val(),
				placeTel:$('#placeTel').val(),
				manager:$('#placeManager').val(),
				maxPerson:$('#maxPerson').val(),
				operationTimeList:operationTimeListSample,
				placeCost:$("#placeCost").val()

				/*운영 시간 값 반복 */
				
			});
				
		 	$.ajax({
				url:"/admin/addplace",
				type:"POST",
				data:PlaceAndOperation,
				contentType:"application/json;charset=utf-8",
				traditional:true,
				success:function(){
					alert('등록 성공');
					location.href='/main';
				},
				error:function(){
					//alert(member);
					alert('등록 실패');
				}
			});
		});
	
	</script>
		<script src="/js/jquery.min.js"></script>
		<script src="/js/jquery.scrolly.min.js"></script>
		<script src="/js/jquery.scrollex.min.js"></script>
		<script src="/js/browser.min.js"></script>
		<script src="/js/breakpoints.min.js"></script>
		<script src="/js/util.js"></script>
		<script src="/js/main.js"></script>
</body>
</html>