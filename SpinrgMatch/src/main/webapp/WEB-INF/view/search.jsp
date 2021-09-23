<%-- <%@page import="mypage.model.ReserveInfo"%> --%>
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
<link rel="stylesheet" href="/css/main.css">
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

<%-- <c:set var="vals" value="<%=list%>"/> --%>

<h1>${authUser.memberName}님 예약조회</h1>

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
<c:if test="${empty searchList}">
<td colspan="4">예약목록이 없습니다.</td>
</c:if>

<c:forEach var="search" items="${searchList}"> 
<tr>
	<td>${search.placeName}</td>
	<td>${search.reserveDate}</td>
	<td>${search.reserveTime}</td>
	<td>${search.regDate}</td>
	 <td>
		 <form action="/reserve/cancel" method="post">
		 <input type="hidden" name="reserveNum" value="${search.reserveNum}">
		 <%-- <input type="hidden" name="place" value="${search.placeName}">
		 <input type="hidden" name="date" value="${search.reserveDate}">
		 <input type="hidden" name="time" value="${search.reserveTime}">  --%>
		 <%-- <input type="hidden" name="regTime" value="${search.regDate}"> --%>
		 <!-- info.state에 따라 예약취소 버튼 만들기 --> 
		
		<c:if test="${search.state ne '예약확정' and search.state ne '매칭실패'}">
		 <input type="submit" id="cancel" value="예약취소">		 				
		</c:if>		
		</form>
	</td> 
	<td>${search.state}</td>
</tr>
 </c:forEach> 
</tbody>
</table>

<button type="button" onclick="location.href='/main'" style="margin-left:1200px">뒤로가기</button>
</div>
<!-- Scripts -->
		<script src="/js/jquery.min.js"></script>
		<script src="/js/jquery.scrolly.min.js"></script>
		<script src="/js/jquery.scrollex.min.js"></script>
		<script src="/js/browser.min.js"></script>
		<script src="/js/breakpoints.min.js"></script>
		<script src="/js/util.js"></script>
		<script src="/js/main.js"></script>
</body>
</html>