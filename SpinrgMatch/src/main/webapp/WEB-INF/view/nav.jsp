<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
alert('${authUser}');

</script>
 <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="links">
                    <c:if test="${empty authUser}">
                    	<li class="nav-item">
                        	<a class="nav-link active" aria-current="page" href="/main">HOME</a>
                    	</li>               
                    	<li class="nav-item">
                        	<a class="nav-link active" aria-current="page" href="/map">자유게시판</a>
                    	</li>
                    	<li class="nav-item">
                        	<a class="nav-link active" aria-current="page" href="/reserve/search">예약페이지</a>
                    	</li>
                 </ul>
                 <ul class="actions stacked">
						<li><a href="/member/joinForm" class="button primary fit">회원가입</a></li>
						<li><a href="/member/loginForm" class="button fit">로그인</a></li>
				 </ul>
                 	  


                    </c:if>
                    
                    
                 <ul class="links">
                    <c:if test="${!empty authUser}">
                    	<li class="nav-item">
                        	<a class="nav-link active" aria-current="page" href="/main">HOME</a>
                    	</li>
                    	 <li class="nav-item">
                        	<a class="nav-link active" aria-current="page" href="mypage.do">마이페이지</a>
                    	</li> 
                    	<li class="nav-item">
                        	<a class="nav-link active" aria-current="page" href="/reserve/search">예약페이지</a>
                    	</li>                
                    	<li class="nav-item">
                        	<a class="nav-link active" aria-current="page" href="/map">자유게시판</a>
                    	</li>                 
                                    
                    	 <c:if test="${authUser.author eq '1'}">
                    		<li class="nav-item">
                        		<a class="nav-link active" aria-current="page" href="/admin/addplaceForm">풋살장 등록</a>
                    		</li>
                    	</c:if>  
                    	 <ul class="actions stacked">
								<li>
								<a href="/member/logout" class="button primary fit">로그아웃</a>
								</li>
								 
						 </ul>         
                    </c:if>
                </ul>                                                         
            </div>
    </nav>
</body>
</html>