<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>자유게시판</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script type="text/javascript" src="/Match/ckeditor/ckeditor.js"></script>
<!--merge할 때 이부분 추가됨  -->
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

		<!-- Main -->
		<div id="main" class="alt">

			<!-- One -->
			<section id="one">
				<div class="inner">
					<header class="major">
						<h1 align="center">자유게시판</h1>

					</header>
						<p>
							제목:<input id="title" type="text"  name="title"
								value="${param.title }">
						</p>
						<p>
							내용:<br />
							<textarea id="content" name="content" rows="5" cols="30">${param.content}</textarea>
						</p>
						
					<button type="button" class="btn btn-primary" id="insert">저장</button>
				</div>
			</section>
		</div>
		<script>
			$('#insert').click(function() {
				var jsonData = JSON.stringify({
					title : $('#title').val(),
					/* category:$('#category').val(), */
					memberId : 'user',
					content : $('#content').val()
				});
				$.ajax({
					url : "http://localhost:9080/article/insert",
					type : "POST",
					data : jsonData,
					contentType : "application/json",
					dataType : "json",
					success : function() {
						alert('저장 성공');
						location.href = '/article/list';
					},
					error : function() {
						alert(jsonData), alert('저장 실패');
					}
				});
			});
		</script>
		<!-- Scripts -->
		<script src="/Match/js/jquery.min.js"></script>
		<script src="/Match/js/jquery.scrolly.min.js"></script>
		<script src="/Match/js/jquery.scrollex.min.js"></script>
		<script src="/Match/js/browser.min.js"></script>
		<script src="/Match/js/breakpoints.min.js"></script>
		<script src="/Match/js/util.js"></script>
		<script src="/Match/js/main.js"></script>
	</div>
</body>
</html>