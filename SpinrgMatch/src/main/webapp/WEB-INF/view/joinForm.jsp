<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>회원가입</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1 nitial-scale=1, user-scalable=no">
<link rel="stylesheet" href="/Match/css/main.css">
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
		<section id="one">
			<div id="wrap">
		<header style= "text-align: center">
			<h1 align="center">회원가입</h1>
		</header>

<div id="wrap" style="text-align: center">

<input id="member_id" type="text" name="id"  placeholder="ID">
<%-- <c:if test="${errors.id}">아이디를 입력하세요.</c:if>
<c:if test="${errors.duplicateId}">이미 사용중인 아이디 입니다.</c:if> --%>
<br>
<input id="member_name" type="text" name="name"  placeholder="name">
<%-- <c:if test="${errors.name}">이름을 입력하세요.</c:if> --%>
<br>

<input id="member_password" type="password" name="password" placeholder="Password">
<%-- <c:if test="${errors.password}">패스워드를 입력하세요.</c:if> --%>
<br>

<input type="password" name="confirm" placeholder="PasswordConfirm">
<%-- <c:if test="${errors.confirm}">패스워드 확인을 입력하세요.</c:if>
<c:if test="${errors.notMatch}">패스워드와 확인이 일치하지 않습니다.</c:if> --%>
<br>

<input id="member_tel" type="text" name="tel" value="" placeholder="ex) 010-1234-5678">
<%-- <c:if test="${errors.tel}">전화번호를 입력하세요.</c:if> --%>
<br>
<button  type="button" class="btn btn-info" id="register">등록</button>

</div>
</div>
</section>
</div>
<script>
		$('#register').click(function(){
				 var member=JSON.stringify({
				memberId:$('#member_id').val(),
				memberName:$('#member_name').val(),
				memberPassword:$('#member_password').val(),
				memberTel:$('#member_tel').val() 
				/* alert("헬로"); */
			});
		 	$.ajax({
				url:"/member/register",
				type:"POST",
				data:member,
				contentType:"application/json;charset=utf-8",
				
				success:function(){
					alert('가입 성공');
					location.href='/main';
				},
				error:function(){
					alert(member);
					alert('회원가입 실패');
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
</body>
</html>