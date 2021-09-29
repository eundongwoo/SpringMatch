<%@page import="java.util.concurrent.Callable"%>
<%-- <%@page import="calendar.model.Calendar"%> --%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%-- <%@page import="map.model.Place"%> --%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/qcss/quick.css">
<link rel="stylesheet" href="/css1/bootstrap.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<STYLE>
#wrap {
   width: 70%;
   overflow: hidden;
   margin: 0 auto;
    
}

#wrap div:first-child {
   width: 70%;
   box-sizing: border-box;
   float: left;
}

#wrap div:last-child {
   width: 70%;
   box-sizing: border-box;
   float: center;
}
</STYLE>
<script>
   
    if('${loginCheck}' == 'no') {
      alert('로그인이 필요합니다');
      location.href='/member/loginForm';
      
   }
    if('${memberNumCheck}' == 'full') {
       alert('예약인원수를 확인해주세요');
       
    }
</script>
<script>
      $(document).ready(function(){
         $(".timeBtn").click(function(){
            var value=$($(this)).val();
             $("#time").val(value);
         });
         
         
         
         
        /*  $(function() {
            var topNum=$("#place").offset().top;
            $(window).scrollTop(topNum);
         });
         
         $("#lookTotal").click(function() {
            var topNum=$("#banner").offset().top;
            $(window).scrollTop(topNum);
         });
            
         
         });      */ 
      </script>
<!-- 퀵메뉴-------------------- -->
<script type="text/javascript">
         $(document).ready(function(){
            
             var group=$($('#group')).val();
              var currentPosition = parseInt($(".quickmenu").css("top"));
              $(window).scroll(function() {
                var position = $(window).scrollTop(); 
                $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},250);
              });
              
              $("#plus").click(function(){
                     value=parseInt(++group);
                    $('#group').val(group);                  
               });
              
              $("#minus").click(function(){
                  if(group>1)
                     {
                          value=parseInt(--group);
                           $('#group').val(group); 
                     }
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
   /*calendar 스타일  */
   </script>
<style type="text/css">
a {
   color: #ffffff;
   text-decoration: none;
}

.scriptCalendar {
   text-align: center;
}

.scriptCalendar>thead>tr>td {
   width: 50px;
   height: 50px;
}

.scriptCalendar>thead>tr:first-child>td {
   font-weight: bold;
}

.scriptCalendar>thead>tr:last-child>td {
   background-color: #0a8212;
}

.scriptCalendar>tbody>tr>td {
   width: 50px;
   height: 50px;
}

p {
   style ="color: red";
}

#selectBtn
{
	width: 1000px;
	margin: 0 auto;
	margin-top:500px;
	
	
}
#home-tab
{
	margin-left:300px;
}

#countPerson
{
	overflow: hidden;
}

#countPerson input , #countPerson div
{
	float:left;
}
#countPerson div
{
	margin-right: 6px;
}

.go
{
	font-size: 1.5em;
	resize: none;
}
</style>
<script type="text/javascript">
	function btnActive()  {
		  const target = document.getElementById('profile-tab');
	  	target.disabled = false;
	}
	function btnActive2()  {
		  const target = document.getElementById('timelook');
	  	target.disabled = false;
	}
	
</script>

</head>



<body class="is-preload">
   <!-- Header -->
   <header id="header" class="alt">
      <a href="/main" class="logo"><strong>matching</strong> <span>kick
            together</span></a>
      <nav>
         <a href="#menu">Menu</a>
      </nav>
   </header>

   <!-- Menu -->
   <nav id="menu">
      <jsp:include page="/WEB-INF/view/nav.jsp" />
   </nav>
   
   <!-- Banner -->
   <section id="banner2" class="major">
      <div class="inner" >
         <header class="major" style="margin-left: 300px; margin-top: 300px;">
            <h2>주의사항</h2>
            <h5>1.예약은 인터넷으로만 가능하며, 하단의 풋살장과 예약가능일자를 클릭하시면 예약신청이 가능합니다.</h5>
            <h5>2.예약취소는 예약페이지에서 취소가능하며, 환불문의 및 연기는 평일 오전9시~오후6시 사이
               010-4195-8016으로 전화가능합니다.</h5>
            <h5>3.북현풋살구장과 lfc풋살파크 계좌는 대구은행 508-12-433440-9(예금주: 박천웅)</h5>
         </header>
         
         <div style="margin-left: 1450px; margin-top: 100px;">


            <p style="color: orange">확인하셨습니까?</p>
            <ul class="actions">
               <li><a href="#one" class="button next scrolly">구장 선택</a></li>
            </ul>
         </div>
      </div>
   </section>


<!-- tabs --><br><br><br>
<div id="selectBtn">
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link " id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true" onclick='btnActive()'>풋살장</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="profile-tab" disabled='disabled' data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="true" onclick='btnActive2()'>날 짜</button>
  </li>
   <li class="nav-item" role="presentation">
    <button class="nav-link" id="timelook" disabled='disabled' data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="true">
     시간조회 </button>
  </li> 
</ul>
</div>
		
   <!-- map start--------------------------------------- -->
	<div class="tab-content" id="myTabContent">
  	<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
  		<jsp:include page="/WEB-INF/view/map.jsp" />	
	</div>
	<!-- 풋살장 끝 -->
	<!-- 달력 시작 -->
  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
  	<jsp:include page="/WEB-INF/view/calendar.jsp" />
    </div>
  	<!-- 달력 끝 -->
  	
  	<!-- 시간 조회 시작 -->
  
  			<div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
  					<table>
  						<tr>
							<td>
							<div id="timezone"style="text-align: center; width: 950px; margin: 0 auto"></div>
							</td>
						</tr>
						<tr>
							<td>
							<div id="memberInfo" style="text-align: center; width: 950px; margin: 0 auto"></div>
							</td>						
						</tr>
					</table>	
			</div>
 		</div>
</head>
<body>
	<!-- calendar end------------------------------------------- -->	
   <!-- input3개-------------------------------- -->
   <form action="/reserve/reserveSubmit" method="post">
      <div class="quickmenu">
         <table>
            <tr>
               <td>풋살장: <input type="text" name="place" id="place" value=""
                  readonly="readonly"></td>
            </tr>
            <tr>
               <td><c:if test="${empty param.year}">
          			날짜:<input type="text" name="date" id="date" value=""
                        readonly="readonly">
                  </c:if> <c:if test="${!empty param.year }">
                  </c:if></td>
            </tr>
            <tr>
               <td>시간:<input type="text" name="time" id="time"
                  readonly="readonly">
                  <div id="locationss"></div>
               </td>
            </tr>
            <tr>
               <td>금액:<input type="text" name="cost" id="cost" value=""
                  readonly="readonly"> <!--hidden input (operationId, placeId 보낼 장소) -->
                  <input type="hidden" name="operationIdString"
                  id="operationIdHidden"> <input type="hidden"
                  name="placeIdString" id="placeIdHidden">
               </td>
            </tr>
			<tr>
				<td>
				<div id="countPerson">
					<div>인원:</div>
					<input type="button" value="-" id="minus" style="width:20px;">
					<input id="group" name="memberGroupString" type="text" value="1" style="text-align:center; width:60px; height:50px;" readonly="readonly">
					<input type="button" value="+" id="plus" style="width:20px;">
				</div>
				</td>
			</tr>
            <!-- <tr>
               <td><input id="timelook" type="button" value="시간 조회">
                  시간조회  </td>
            </tr> -->
            <!-- <div id="timezone"></div>    -->
            <tr>
               <td>
                  <!-- 시간대버튼 --> <input type="submit" style="margin-left:40px" value="예약하기" onclick="return confirm('예약하시겠습니까?')">
               </td>
            </tr>
         </table>

      </div>
      <br> <br>
      <div id="timezone"
         style="text-align: center; width: 950px; margin: 0 auto"></div>
      <div id="memberInfo" style="text-align: center; width: 950px; margin: 0 auto"></div>
   </form>



   <script>
                         $("#timelook").click(function() {
                            
                            var placeAndCalendar=JSON.stringify({
                                 placeName:$("#place").val(),
                              calendarFullDate:$("#date").val()                              
                           });
                              $.ajax({
                              url:"/reserve/timelook",
                              type:"POST",
                              data:placeAndCalendar,
                              contentType:"application/json;charset=utf-8",
                              
                              success:function(checkButton){
                                
                                 $("#timezone").html("");
                                 /* $("#memberInfo")html(""); */
                                 /* for(var j=0; j<checkButton.memberCheckList.length; j++) {
                                    var maxPerson=memberCheckList[j].maxPerson;
                                    var maxPerson=memberCheckList[j].maxPerson;
                                    var maxPerson=memberCheckList[j].maxPerson;
                                    $("#memberInfo").$("#timezone").append("<textarea id='memberCheck"+j+"'></textarea>");
                                    $("#memberCheck"+j).innerText(x)
                                 } */
                                 
                                 
                                 if(checkButton.memberCheckList.length==0) {
                                    alert('선택한 날의 예약된 인원 없음');
                                 } 
                                 /* alert(checkButton.memberCheckList[0].maxPerson); */
                                 
                                 for(var i=0; i<checkButton.operationTimeList.length; i++) {
                                    var operationIdHidden=null;
                                    var placeIdHidden=null; 
                                    var time = checkButton.operationTimeList[i].fullTime;
                                     operationIdHidden=checkButton.operationTimeList[i].operationId;
                                    placeIdHidden=checkButton.operationTimeList[i].placeId; 
                                    /*    for(var j=0; j<checkButton.checkRedList.length; j++) {
                                          alert(checkButton.checkRedList[j].checkNum);
                                       } */
                                    
                                    $("#timezone").append("<input id='operationTime"+i+"' type='button' data-operationId='' data-placeId='' >");
                                    
                                    if(checkButton.memberCheckList.length!=0 ) {
                                       
                                    var check=0;
                                       
                                       for(var k=0; k<checkButton.memberCheckList.length; k++) {
                                          
                                          var t = checkButton.memberCheckList[k].operationId;
                                          if(checkButton.operationTimeList[i].operationId==t) {
                                             $("#timezone").append("<br><textarea id='dop"+i+"' class='go' rows='1' readonly='readonly'></textare	a>");
                                             $("#dop"+i).val('최대인원: '+checkButton.memberCheckList[k].maxPerson+'명 / 현재예약인원: '+checkButton.memberCheckList[k].memberGroup+'명 / 남은 자리수: '+checkButton.memberCheckList[k].possibleNum+"명");
                                             check++;
                                          }
                                          
                                       }
                                       if(check==0) {
                                          $("#timezone").append("<br><textarea id='dop"+i+"' class='go' rows='1' readonly='readonly'>");
                                          $("#dop"+i).val('최대인원: '+checkButton.operationTimeList[i].maxNum+'명 / 현재예약인원: 0명');
                                       }
                                       
                                    }
                                     if((!checkButton.checkRedList[i].checkNum||(!checkButton.checkRedList[i].checkDate&&!checkButton.checkRedList[i].checkTime))) {
                                       $("#operationTime"+i).css({
                                          background:'red',
                                          opacity:0.7
                                       });
                                       $("#operationTime"+i).attr('disabled','disabled');
                                    } 
                                    
                                    $("#operationTime"+i).val(time);
                                    $("#operationTime"+i).attr("data-operationId",operationIdHidden);
                                    $("#operationTime"+i).attr("data-placeId",placeIdHidden);
                                    $("#operationTime"+i).click(function() {
                                    /*    operationIdHidden= checkButton.operationTimeList[i].operationId;
                                       placeIdHidden=checkButton.operationTimeList[i].placeId; */
                                       $("#time").val($(this).val());
                                       $("#operationIdHidden").val($(this).attr("data-operationId"));
                                       $("#placeIdHidden").val($(this).attr("data-placeId"));
                                       /* $("#operationIdHidden").val(operationIdHidden);
                                       $("#placeIdHidden").val(placeIdHidden);  */
                                    });
                                 }
                                 
                                 /*  $("#operationIdHidden").val(operationIdHidden);
                                 $("#placeIdHidden").val(placeIdHidden); */
                                 
                               $('#cost').val(checkButton.cost);
                                 
                              },
                              error:function(){
                                 alert('풋살장이름, 예약날짜 정보 보내기 실패');
                              }
                           });
                            
                            
                         });
                      
                      </script>


   <div id="hidden_div" style="text-align: center"></div>
	<!-- Footer -->
		<br>
					<footer id="footer" >
						<div class="inner" style="text-align: center">
							<ul class="icons">
								<li><a href="#" class="icon brands alt fa-twitter"><span class="label">Twitter</span></a></li>
								<li><a href="#" class="icon brands alt fa-facebook-f"><span class="label">Facebook</span></a></li>
								<li><a href="#" class="icon brands alt fa-instagram"><span class="label">Instagram</span></a></li>
								<li><a href="#" class="icon brands alt fa-github"><span class="label">GitHub</span></a></li>
								<li><a href="#" class="icon brands alt fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
							</ul>
			
						</div>
					</footer>
	
	<br>
	<br>
	<!-- Scripts -->
	<script src="/js/jquery.min.js"></script>
	<script src="/js/jquery.scrolly.min.js"></script>
	<script src="/js/jquery.scrollex.min.js"></script>
	<script src="/js/browser.min.js"></script>
	<script src="/js/breakpoints.min.js"></script>
	<script src="/js/util.js"></script>
	<script src="/js/main.js"></script>
	
	<script src="/js1/bootstrap.bundle.js"></script>
	<script src="/js1/bootstrap.bundle.min.js"></script>
	<script src="/js1/bootstrap.esm.js"></script>
	<script src="/js1/bootstrap.esm.min.js"></script>
	<script src="/js1/bootstrap.js"></script>
	<script src="/js1/bootstrap.min.js"></script>
</body>
</html>