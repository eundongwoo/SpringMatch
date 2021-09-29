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
  
	
	<div class="container">
		<div class="page-header">
			<h1>게시글 등록</h1>
		</div>
		<br /> <input id="id" type="hidden" value="${article.articleNo}" /> 
		<%-- <input id="board_wdate" type="hidden" value="${article.wdate}" /> --%>
		<table class="table">
			<tr>
				<th style="padding: 13px 0 0 15px">글제목</th>
				<td><input id="title" type="text"
					class="col-md-1 form-control input-sm" value="${article.title}" />
				</td>
			</tr>
			 <tr>
				<th style="padding: 13px 0 0 15px">생성날짜</th>
				<td>
					<div class="pull-left">
						<input type="text" readonly="readonly"
						class="col-md-1 form-control input-sm" value="${article.regdate}" />
					</div>
				</td>
			</tr> 
			<tr>
				<th style="padding: 13px 0 0 15px">작성자</th>
				<td>
					<div class="pull-left">
						<input id="uname" type="text" 
						class="col-md-1 form-control input-sm" value="${member.memberId}" />
					</div>
				</td>
			</tr>
			<tr>
				<th style="padding: 13px 0 0 15px">내용</th>
				<td>
					<textarea id="content" maxlength="100" rows="4" style="height:90px"
					class="col-md-1 form-control input-sm" text="${article.content}" >
					</textarea>
					<span class="help-block"></span>
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
		<div class="pull-left">
			<a href="/article/list" class="btn btn-default">목록으로</a>
		</div>
		<div class="pull-right">
			<button type="button" class="btn btn-primary" id="insert">저장</button>
			<%-- <button if="${board?.id}" type="button" class="btn btn-info" id="update">수정</button>
			<button th:if="${board?.id}" type="button" class="btn btn-danger" id="delete">삭제</button> --%>
		</div>
	</div>
	
	<script <%-- th:if="!${board?.id} --%>">
		$('#insert').click(function(){
			var jsonData=JSON.stringify({
				title:$('#title').val(),
				/* category:$('#category').val(), */
				memberId:'user',
				content:$('#content').val()
			});
			$.ajax({
				url:"http://localhost:9080/article/insert",
				type:"POST",
				data:jsonData,
				contentType:"application/json",
				dataType:"json",
				success:function(){
					alert('저장 성공');
					location.href='/article/list';
				},
				error:function(){
					alert(jsonData),
					alert('저장 실패');
				}
			});
		});
	
	</script>
	
	<%-- <script th:if="${board?.id}">
		$('#update').click(function(){
			var jsonData=JSON.stringify({
				title:$('#title').val(),
				category:$('#category').val(),
				uname:$('#uname').val(),
				content:$('#content').val()
			});
			$.ajax({
				url:"http://localhost:8750/board/update/"+$('#id').val(),
				type:"PUT",
				data:jsonData,
				contentType:"application/json",
				dataType:"json",
				success:function(){
					alert('수정 성공!');
					location.href='/board/list';
				},
				error:function(){
					alert(this.url);
				}
			});
		});
	
		$('#delete').click(function(){
			$.ajax({
				url:"http://localhost:8750/board/delete/"+$('#id').val(),
				type:"DELETE",
				success:function(){
					alert('삭제 성공!');
					location.href='/board/list';
				},
				error:function(){
					alert('삭제실패');
				}
			});
		});
	</script> --%>
</body>
</html>