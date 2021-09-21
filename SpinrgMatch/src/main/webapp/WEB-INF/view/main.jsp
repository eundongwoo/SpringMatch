<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
	String message=(String)request.getAttribute("message");
	System.out.print("메세지----->"+message);
	if(message!=null)
	{
%>
<script>
			alert("<%=message%>");
</script>
<%} %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MainPage</title>
<meta name="viewport"	
	content="width=device-width, initial-scale=1 nitial-scale=1, user-scalable=no">
<link rel="stylesheet" href="/Match/css/main.css">
</head>

<body>
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

		<%-- <c:if test="${!empty authUser}">
		${authUser.author}
		</c:if> --%>

		<!-- Menu -->
		<nav id="menu">
			<jsp:include page="/WEB-INF/view/nav.jsp" />
		</nav>

		<!-- Banner -->
		<section id="banner" class="major">
			<div class="inner">
				<header class="major">
					<h1>뭉쳐야 찬다</h1>
				</header>
				<div class="content">
					<p>친구는 없지만 축구를 좋아하는 사람들은 여기로</p>
					<ul class="actions">
						<li><a href="/reserve/reserveHome" class="button next scrolly">예약하기</a></li>
					</ul>
				</div>
			</div>
		</section>
		<!-- Main -->
		<div id="main">

			<!-- One -->
			<section id="one" class="tiles">
				<article>
					<span class="image"> <img src="images/잔디밭.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="notice_list.do" class="link">공지사항</a>
						</h3>
						<p></p>
					</header>
				</article>
				<article>
					<span class="image"> <img src="images/축구.jpg" alt="" />
					</span>
					<header class="major">
						<h3>
							<a href="#" class="link">렌탈샵</a>
						</h3>
						<p>축구용품 대여</p>
					</header>
				</article>				
					</div>
				</section>
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