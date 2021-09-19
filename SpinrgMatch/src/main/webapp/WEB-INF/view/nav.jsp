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
 <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="links">
                    <c:if test="${empty authUser}">
                    	<li class="nav-item">
                        	<a class="nav-link active" aria-current="page" href="/Match/main.jsp">HOME</a>
                    	</li>               
                    	<li class="nav-item">
                        	<a class="nav-link active" aria-current="page" href="article_list.do">자유게시판</a>
                    	</li>
                    	<li class="nav-item">
                        	<a class="nav-link active" aria-current="page" href="reserve.do">예약페이지</a>
                    	</li>
                 </ul>
                 <ul class="actions stacked">
						<li><a href="join.do" class="button primary fit">회원가입</a></li>
						<li><a href="login.do" class="button fit">로그인</a></li>
				 </ul>
                 	   	
                    </c:if>
                    
                    
                 <ul class="links">
                    <c:if test="${!empty authUser}">
                    	<li class="nav-item">
                        	<a class="nav-link active" aria-current="page" href="/Match/main.jsp">HOME</a>
                    	</li>
                    	 <li class="nav-item">
                        	<a class="nav-link active" aria-current="page" href="mypage.do">마이페이지</a>
                    	</li> 
                    	<li class="nav-item">
                        	<a class="nav-link active" aria-current="page" href="reserve.do">예약페이지</a>
                    	</li>                
                    	<li class="nav-item">
                        	<a class="nav-link active" aria-current="page" href="article_list.do">자유게시판</a>
                    	</li>                 
                                    
                    	<c:if test="${authUser.author eq '1'}">
                    		<li class="nav-item">
                        		<a class="nav-link active" aria-current="page" href="admin.do">풋살장 등록</a>
                    		</li>
                    	</c:if> 
                    	 <ul class="actions stacked">
								<li>
								<a href="logout.do" class="button primary fit">로그아웃</a>
								</li>
						 </ul>         
                    </c:if>
                </ul>                                                         
            </div>
    </nav>
</body>
</html>