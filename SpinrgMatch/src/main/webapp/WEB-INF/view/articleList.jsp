<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
</head>

<body>
<body>

	<div class="container">
		<div class="page-header">
			<h1>게시글 목록</h1>
		</div>
		
		<div class="pull-right" style="width: 100px; margin: 10px 0;">
			<a href="/article/form" class="btn btn-primary btn-block">등록</a>
		</div>
		
		<br />
		<br />
		<br />
		<div id="mainHide">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">작성날짜</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				${articleList}///
				
				<%-- ${list[몇번째 행].속성} --%>
				
				<tbody>
					<%-- <c:forEach items="${articleList}" var="article"> --%>
					<%-- <tr>
						<td text="${article.articleNo}"></td>
						<td><a href="'/article?articleNo='+${article.article_no}" 
						text="${article.title}"></a></td>
						<td text="${article.memberId}"></td>
						<td text="${article.regdate}"></td>
						<td text="${article.readcnt}"></td>
					</tr> --%>aa
					<%-- <input type="text">${article.memberId }</input> --%>
					<%-- </c:forEach> --%>
				</tbody>
			</table>
		</div>
		<br/>
		 <!--  페이지 네비게이션 -->
		   <%-- <nav style="text-align:center;">
		   	<ul class="pagination" 
		   	th:with="startNumber=${T(Math).floor(boardList.number/5)}*5+1,
		   	endNumber=(${boardList.totalPages})>${startNumber}+9?${startNumber}+4:${boardList.totalPages}">
			<!-- 	==>	<span th:text="${boardList.number}">123</span> -->
		   		<li><a href="/board/list?page=1">&laquo;</a></li>
		   		<li th:style="${boardList.first}?'display:none'">
		   			<a th:href="@{/board/list(page=${boardList.number})}">&lsaquo;</a>
		   		</li>
		   		
		   		<li th:each="page:${#numbers.sequence(startNumber,endNumber)}"
		   		th:class="(${page}==${boardList.number}+1)?'active'">
		   			<a th:href="@{/board/list(page=${page})}" th:text="${page}"></a>
		   		</li>
		   		
		   		<li th:style="${boardList.last}?'display:none'">
		   			<a th:href="@{/board/list(page=${boardList.number}+2)}">&rsaquo;</a>
		   		</li>
		   		
		   		<li><a th:href="@{/board/list(page=${boardList.totalPages})}">&raquo;</a></li>
		   	</ul>
		   
		   </nav> --%>
	</div>
	
</body>
</body>
</html>