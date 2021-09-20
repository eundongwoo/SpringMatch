<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<script type="text/javascript">
	

	function buttonClick(x,y,z) {
			location.href="calendar.do?date="+x+"&year="+y+"&month="+z;
	};
</script>
<title>달력</title>
<style>
th, td {
 	text-align: center; /* 칸 안의 글자나 숫자를 중앙으로 정렬 */ 
 }
 .title
 {
 	padding-top:20px;
 	text-align: center;
 }
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
<body>

<%
	Calendar cal = Calendar.getInstance(); //현재 날짜 정보
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH)+1; //0~11까지 존재(각각의 값이 1월부터 12월을 의미) => 현재 월을 구하기 위해 해당 값에 +1 
	int date = cal.get(Calendar.DATE);
	int currentMonth=cal.get(Calendar.MONTH)+1; 
	int currentYear=cal.get(Calendar.YEAR);
	

	String today = year + " : " + (month) + " : " + date;  //오늘 날짜
	
	
	cal.set(year, month-1, 1); //년월일 한 번에 지정, 월은 0부터 시작 
	
	String paramMonth = request.getParameter("month"); //버튼 누르면 이전 달 혹은 다음 달로 이동하게 되는데 그 때의 파라미터 값을 받아서 담음 
	
	if(paramMonth == null) { //처음에 실행할 때 나타나는 오늘 날짜의 달력
		cal.set(year, month-1, 1); 
	}else {					//버튼 눌러 이전 달 혹은 다음 달로 이동할 때 
		month = Integer.parseInt(paramMonth);
		
	 	cal.set(Calendar.MONTH, month-1); //주어진 달력 필드를 주어진 값으로 설정 
		cal.setFirstDayOfWeek(month);   //한 주의 첫 번째 요일이 무엇인지 설정
	}
	
	
	int startDate = cal.getMinimum(Calendar.DATE); //해당 월의 첫 날
	int lastDate = cal.getActualMaximum(Calendar.DATE); //해당 월의 마지막 날
	
	int week = cal.get(Calendar.DAY_OF_WEEK); // 1일의 요일을 구함 
	int count = 0; 

%>
<div id="wrap" style="text-align: center">
<table width="50%" cellpadding="2" cellspacing="0" border="1" align="center">
<tr>
<th colspan="2" class="title"> <!-- 표의 제목 셀 생성 (일반 셀(td)과의 차이는 bold체로 출력)  -->
<input class="monthMove" type="button" value="←" > <!-- location.href 파라미터(페이지 이동)를 이용하여 표현식을 사용해 자바 값을 넘겨줄 수 있음  -->
</th>

<th class="title" colspan="3">
<h1><%=cal.get(Calendar.YEAR) %>년 <%=cal.get(Calendar.MONTH)+1 %>월</h1> <!-- 버튼 눌러서 년도와 월이 바뀌도록 하는 역할 -->
</th>

<th colspan="2" class="title">	
<input class="monthMove" type="button" value="→" >
<form id="moveInputForm" action="calendar.do" method="POST"> 
	<input name="month" type="hidden" id="moveInput">
</form>
<script>
	$(document).ready(function() {
		
		$(".monthMove").click(function() {
			if($(this).val()=="←") {
				$("#moveInput").val("<%=month-1%>");
				$("#moveInputForm").submit();
			} 
			if($(this).val()=="→") {
				$("#moveInput").val("<%=month+1%>");
				$("#moveInputForm").submit();
			}
		});
	});
</script>
</th>
</tr>
<tr>
	<td width="50">일</td>
	<td width="50">월</td>
	<td width="50">화</td>
	<td width="50">수</td>
	<td width="50">목</td>
	<td width="50">금</td>
	<td width="50">토</td>
</tr>
<tr>
<%
	for(int i=1; i<week; i++) { /* 달력에서 1일의 앞 칸 공백 넣어주기 */
		count++;
%>
	<td>&nbsp;</td>
<% 	
}
for(int i=startDate; i<=lastDate; i++) {  /* 날짜 출력 */
	String bgcolor = (today.equals(year + " : " + (month) + " : " + i)) ? "#FFE400" : "#242943"; /* 오늘 날짜와 일치하면 배경색을 노란색으로, 아니면 흰색으로 출력   */
	
	String color = "";
	if(count % 7 == 0) { /* 일요일은 빨간색으로 표시  */
		color = "red";
	} else if(count % 7 == 6) { /* 토요일은 파란색으로 표시  */
		color = "blue";
	} else {					/* 평일은 검정색으로 표시  */
		color = "white";
	}
	count++;
%>
	<td bgcolor="<%=bgcolor %>"><font color=<%=color %>><%=i%>
	<%
		if(i>=date && currentMonth==month)
		{
			%>
				<br>
				<input type="button" value="예약" onclick="buttonClick('<%=i%>','<%=cal.get(Calendar.YEAR) %>','<%=cal.get(Calendar.MONTH)+1%>')" ></label>

			<% 
		}else if(currentYear>=year && month>currentMonth)
		{
			%>
				<br>
				<input type="button" value="예약" onclick="buttonClick('<%=i%>', '<%=cal.get(Calendar.YEAR) %>','<%=cal.get(Calendar.MONTH)+1%>')" ></label>

			<%
		}
	%>
	</font></td> <!-- 칸마다 날짜 출력  -->
<%
	if(count % 7 == 0 && i <lastDate) { /* 일요일이고 말일이 아니면 줄바꿈  */
%>
</tr>
<tr>
<%
	}
	}
while(count % 7 != 0) { /* 마지막 날 이후 빈칸 출력  */
%>
	<td>&nbsp;</td>
<%
count++;
}
%>

</tr>	
</table>
</div>
</body>
</html>