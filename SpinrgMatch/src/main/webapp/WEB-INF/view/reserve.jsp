<%@page import="java.util.concurrent.Callable"%>
<%@page import="calendar.model.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="map.model.Place"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
Calendar cal= (Calendar)session.getAttribute("calendar");
List<String> list=(List<String>)request.getSession().getAttribute("timeList");
HashMap<String, Integer> hm =(HashMap<String, Integer>)  request.getSession().getAttribute("timeMap");
if(cal!=null) {
	System.out.println("여기");
System.out.println(cal.getDate());
}
%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Forty by HTML5 UP</title>	
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
			<link rel="stylesheet" href="/Match/css/main.css">
			<link rel="stylesheet" href="/Match/qcss/quick.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script>
		$(document).ready(function(){
			$(".timeBtn").click(function(){
				var value=$($(this)).val();
				 $("#time").val(value);
			});
			
			
			$(function() {
				var topNum=$("#place").offset().top;
				$(window).scrollTop(topNum);
			});
			
			$("#lookTotal").click(function() {
				var topNum=$("#banner").offset().top;
				$(window).scrollTop(topNum);
			});
				
			
			});		
		</script>
		<!-- 퀵메뉴 -->
		<script type="text/javascript">
			$(document).ready(function(){
				  var currentPosition = parseInt($(".quickmenu").css("top"));
				  $(window).scroll(function() {
				    var position = $(window).scrollTop(); 
				    $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},250);
				  });
				});
		</script> 
		<script type="text/javascript">
	var quickBox = $('.quickBox'); //퀵메뉴 코딩한 div의 클래스 네임 - 자신의 이름에 맞게 수정하세요
	var quick_top = 120; // 기준이 되는 높이 값입니다. 수정해서 테스트 해보시면 감이 오실꺼에요.
	quickBox.css('top', $(window).height() );
	$(document).ready(function(){
	quickBox.animate( { "top": $(document).scrollTop() + quick_top +"px" },  500 ); //숫자값을 변경하시면 속도변화
	 $(window).scroll(function(){
	  quickBox.stop();
	  quickBox.animate( { "top": $(document).scrollTop() + quick_top + "px" }, 500 ); //숫자값을 변경하시면 속도변화
	 });
	});
	</script> 
		</head>
		<% String s = request.getParameter("year")+"년"+request.getParameter("month")+"월"+request.getParameter("date")+"일"; %>
		
	<body class="is-preload">	
	

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
		
		
		 <div class="quickmenu">
		   <form action="reserve.do" method="post"> 
   			<table>
    		<td>  		
    		풋살장:
    		<%if((String)session.getAttribute("placeName")!=null) {%>
    		
    		<input type="text" name="place" id="place" value="<%=(String)session.getAttribute("placeName")%>" readonly="readonly"><br>   	
    		<%} else {%>
    		<input type="text" name="place" id="place" value="" readonly="readonly"><br>
    		<%} %>

    		<c:if test="${empty param.year}">
    		날짜:<input type="text" name="date" id="date" value="" readonly="readonly"><br>  
    		</c:if>	 
    		<c:if test="${!empty param.year }">  		
    		날짜:<input type="text" name="date" id="date" value="<%=cal.getYear()+"년"+cal.getMonth()+"월"+cal.getDate()+"일"%>" readonly="readonly"><br> 
    		</c:if>   		
    		시간:<input type="text" name="time" id="time" readonly="readonly">
    		 <div id="locationss"></div>	  		
    		<input type="submit" value="예약하기" onclick="return confirm('예약하시겠습니까?')">  	
    		</td>     	   		
		    </table>   	
		    </form>
			</div> 			
				<!-- Main -->
					 
						<!-- One -->
							<section id="one" class="tiles">							
									 <table>
					    				<tr>
					    					<td class="one"><jsp:include page="/WEB-INF/view/map.jsp" flush="false"/></td>					    									
					    				</tr>					    																					
    								</table>								
							</section>

						<!-- Two -->
							<section id="two" class="tiles">							
									 <table>
					    				<tr>
					    					<td class="two"><jsp:include page="/WEB-INF/view/calendar.jsp" flush="false"/></td>				    									
					    				</tr>					    																					
    								</table>								
							</section>
						
							
							<form action="timesearch.do" method="Post" style="text-align: center">								
						    	<input type="hidden" name="placeName" value="<%=(String)session.getAttribute("placeName")%>">
						    	<input type="hidden" name="placeDate" value="<%=s%>">
						    	<input id="timelook" type="submit" value="시간 조회">
						    </form>						   
						    <div id="hidden_div" style="text-align: center">
    						<p>시간</p>
    						<%

	 		if(list==null) {System.out.println("list는 null");} else {
	 			
			for(String time: list) {
				String a = time;
				String startTime = a.split("~")[0];
				SimpleDateFormat sdf= new SimpleDateFormat("HH:mm");
				Date reserveTime = new Date(sdf.parse(startTime).getTime());
				java.util.Calendar cal2 = java.util.Calendar.getInstance();
				Date currentTime = cal2.getTime();
				reserveTime.setYear(currentTime.getYear());
				reserveTime.setMonth(currentTime.getMonth());
				reserveTime.setDate(currentTime.getDate());		//reserveTime완성
				
							//b<3||check==false
				boolean check = currentTime.after(reserveTime);
					//check가 true면 지나갔다 -> 버튼 못 누르게			
				
					
				java.util.Calendar cal3 =java.util.Calendar.getInstance();
				if(cal!=null) {
					System.out.println("받아온 날짜"+cal.getYear()+"년"+cal.getMonth()+"월"+cal.getDate()+"일");
					System.out.println("setting전날짜"+cal3.getTime());
					cal3.set(Integer.parseInt(cal.getYear()), Integer.parseInt(cal.getMonth())-1, Integer.parseInt(cal.getDate()));
					System.out.println("setting후 받아온 날짜"+cal3.getTime());		//예약시점의 날짜 (시간은 현재시점과 같음)
					System.out.println("boolean값:"+(cal3.getTime()!=currentTime));
				}
				
				System.out.println(cal3.getTime()+"::::"+currentTime);
				int b= hm.get(time);
				System.out.println("!check"+!check);
				System.out.println("cal3.getTime()"+cal3.getTime());
				System.out.println("currentTime"+currentTime);
				System.out.println("cal3.getTime()!=currentTime"+(cal3.getTime().after(currentTime)));
				if(b<3 && (!check || (cal3.getTime().after(currentTime)))) { 
				
		%>		
			
			<button class="timeBtn" value="<%=a%>"><%=a%><br><%=b %></button>		
		
					
		<%
				}
			else{						
		%>
				<button  class="timeBtn rf" value="<%=a%>" disabled="disabled"><%=a%><br><%=b %></button>
			<script>
				$(".rf").css({
					background:'red',
					opacity:0.7
				});
			</script>	
			
		<%
				}
		%>
		<%
				}
			}

	 		
		%> 
							</div>
						
							<br><br>
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