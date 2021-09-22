<%@page import="mypage.model.ReserveInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%
	 List<ReserveInfo> list=(List<ReserveInfo>)request.getAttribute("ReserveList");
	 for(ReserveInfo i:list)
	 {
		 System.out.println(i.getMember_id()+":"+i.getPlace_name()+":"+i.getReserve_date()+":"+i.getReserve_time());
	 }
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1 nitial-scale=1, user-scalable=no">
<link rel="stylesheet" href="/Match/css/main.css">
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" class="alt">
			<a href="/Match/main.jsp" class="logo"><strong>matching</strong>
				<span>kick together</span></a>
			<nav>
				<a href="#menu">Menu</a>
			</nav>
		</header>

		<!-- Menu -->
		<nav id="menu">
			<jsp:include page="/WEB-INF/view/nav.jsp" />
		</nav>

<%-- <c:set var="vals" value="<%=list%>"/> --%>

<h1>${authUser.name}님 예약조회</h1>

<br>
<table class="table table-striped">
<thead>
<tr>
<th>풋살장 명</th>
<th>예약 날짜</th>
<th>예약 시간</th>
<th>신청 날짜</th>
<th></th>
<th>예약 상태</th>
</tr>
</thead>
<tbody>
<c:if test="${empty vals}">
<td colspan="4">예약목록이 없습니다.</td>
</c:if>

<%-- <c:forEach var="info" items="<%=list%>"> --%>
<tr>
	<td>${info.place_name}</td>
	<td>${info.reserve_date}</td>
	<td>${info.reserve_time}</td>
	<td>${info.reg_time}</td>
	<td>
		<form action="search.do" method="get">
		 <input type="hidden" name="place_name" value="${info.place_name}">
		 <input type="hidden" name="reserve_date" value="${info.reserve_date}">
		 <input type="hidden" name="reserve_time" value="${info.reserve_time}">
		 <input type="hidden" name="reg_time" value="${info.reg_time}">
		 <!-- info.state에 따라 예약취소 버튼 만들기 -->
		
		<c:if test="${info.state ne '매칭실패'}">
		 <input type="submit" value="예약취소">		 				
		</c:if>		
		</form>
	</td>
	<td>${info.state}</td>
	
</tr>
<%-- </c:forEach> --%>
</tbody>
</table>
<button type="button" onclick="location.href='mypage.do'">뒤로가기</button>
</div>
<!-- Scripts -->
	<script src="/Match/js/jquery.min.js"></script>
	<script src="/Match/js/jquery.scrolly.min.js"></script>
	<script src="/Match/js/jquery.scrollex.min.js"></script>
	<script src="/Match/js/browser.min.js"></script>
	<script src="/Match/js/breakpoints.min.js"></script>
	<script src="/Match/js/util.js"></script>
	<script src="/Match/js/main.js"></script>
</body>
</html>