<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
						<c:if test="${!empty authUser}">
							${authUser.author}///
							${authUser}
						</c:if>
					</header>
					<%-- <p>
						제목:<br /> <input type="text" id="title" value="${param.title }">
						<c:if test="${errors.title }">제목을 입력하세요.</c:if>
					</p>
					<p>
						내용:<br />
						<textarea id="content" rows="5" cols="30">${param.content}</textarea>
						<c:if test="${errors.content }">내용을 입력하세요.</c:if>
					</p>
					<button type="button" class="btn btn-info" id="register">등록</button> --%>
					<form action="/insertProc" method="post">
						<p>
							제목:<br />
							<input type="text" name="title" value="${param.title }">
						</p>
						<p>
							내용:<br />
							<textarea name="content" rows="5" cols="30">${param.content}</textarea>
						</p>
						<input type="submit" value="새 글 등록" onclick="return confirm('게시글을 등록하시겠습니까?')">
					</form>
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

		<script>
			$('#register').click(function() {
				var article = JSON.stringify({
					memberId : 'user',
					title : $('#title').val(),
					content : $('#content').val()
				/* alert("헬로"); */
				});
				$.ajax({
					url : "http://localhost:9080/article/insert",
					type : "POST",
					data : article,
					contentType : "application/json",
					dataType:"json", 
					success : function() {
						alert('게시글이 등록되었습니다.');
						location.href = 'http://localhost:9080/main';
					},
					error : function() {
						alert(article);
						alert('게시글이 등록되지 않았습니다.');
					}
				});
			});
		</script>
	</div>
</body>
</html>