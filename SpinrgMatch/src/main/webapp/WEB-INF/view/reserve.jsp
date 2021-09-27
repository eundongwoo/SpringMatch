
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
		location.href='/main';
		
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
</style>

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
		<div class="inner">
			<header class="major" style="margin-left: 230px; margin-top: 200px;">
				<h2>주의사항</h2>
				<h5>1.예약은 인터넷으로만 가능하며, 하단의 풋살장과 예약가능일자를 클릭하시면 예약신청이 가능합니다.</h5>
				<h5>2.예약취소는 예약페이지에서 취소가능하며, 환불문의 및 연기는 평일 오전9시~오후6시 사이
					010-4195-8016으로 전화가능합니다.</h5>
				<h5>3.북현풋살구장과 lfc풋살파크 계좌는 대구은행 508-12-433440-9(예금주: 박천웅)</h5>

			</header>
			<div style="margin-left: 1120px; margin-top: 100px;">


				<p style="color: orange">확인하셨습니까?</p>
				<ul class="actions">
					<li><a href="#one" class="button next scrolly">구장 선택</a></li>
				</ul>
			</div>
		</div>
	</section>


	<!-- map start--------------------------------------- -->

<!-- <ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#map" type="button" role="tab" aria-controls="home" aria-selected="true">풋살장</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="true">날 짜</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="true">시 간</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="true">인 원</button>
  </li>
</ul>

<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="map" role="tabpanel" aria-labelledby="home-tab"><h3>풋살장</h3></div>
  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab"><h3>날 짜</h3></div>
  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab"><h3>시 간</h3></div>
</div> -->
<ul class="tab_info noscript">
  <li class="on" data-wscrollspy-tab="productList">
    <a href="/reserve/map"></a>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="true">날 짜</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="true">시 간</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="true">인 원</button>
  </li>
</ul>

<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="map" role="tabpanel" aria-labelledby="home-tab"><h3>풋살장</h3></div>
  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab"><h3>날 짜</h3></div>
  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab"><h3>시 간</h3></div>
</div>

	<%-- <jsp:include page="/WEB-INF/view/map.jsp" flush="false"/> --%>
	<section id="one" class="tiles">
		<div id="map" style="width: 70%; height: 400px; margin: 0 auto;"></div>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9139ecf68b85217bc0cf45262df346ce&libraries=services"></script>

		<script style="color: red">
var placeArray = new Array();
<c:forEach items="${placeList}" var="place">
   placeArray.push({
      placeAddr:"${place.placeAddr}",
      placeName:"${place.placeName}"
   });
</c:forEach>
/* var placeList='${placeList}'; */


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

function searchLocation(address, name) {
// 주소로 좌표를 검색합니다
geocoder.addressSearch(address, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords,    
            clickable:true
        });
        
        
        
        // 마커에 클릭이벤트를 등록합니다
        kakao.maps.event.addListener(marker, 'click', function() {
           
           var placeInfo=JSON.stringify({
             placeName:name            

          });
           
           $.ajax({
            url:"/reserve/map",
            type:"POST",
            data:placeInfo,
            contentType:"application/json;charset=utf-8",
            
            success:function(reserveInfo){
               
             
               $("#place").val(reserveInfo.placeName);
               $("#timezone").html("");      /*추가  */
               $("#time").val("");
            },
            error:function(){
               
               
               alert('풋살장 정보보내기 실패');
            }
         });
           
 
        });
        
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<span style="color:black; text-align:center; margin-left:25px;">'+name+'</span>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});  
}

for(var j=0; j<placeArray.length; j++) {
   searchLocation(placeArray[j].placeAddr,placeArray[j].placeName);
}


</script>
	</section>
	<br>
	<br>
	<br>



	<!--map end -------------------------------- -->



	<%-- <jsp:include page="/WEB-INF/view/calendar.jsp" flush="false"/> --%>
	<%-- ${reserveInfo.placeName} --%>
	<!-- calendar start--------------------------------- -->

	<script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function () {
            buildCalendar();
        });

        var today = new Date(); // @param 전역 변수, 오늘 날짜 / 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
        var date = new Date();  // @param 전역 변수, today의 Date를 세어주는 역할

        /**
         * @brief   이전달 버튼 클릭
         */
        function prevCalendar() {
            this.today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
            buildCalendar();    // @param 전월 캘린더 출력 요청
        }

        /**
         * @brief   다음달 버튼 클릭
         */
        function nextCalendar() {
            this.today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
            buildCalendar();    // @param 명월 캘린더 출력 요청
        }

        /**
         * @brief   캘린더 오픈
         * @details 날짜 값을 받아 캘린더 폼을 생성하고, 날짜값을 채워넣는다.
         */
        function buildCalendar() {

            let doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
            let lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);

            let tbCalendar = document.querySelector(".scriptCalendar > tbody");


            document.getElementById("calYear").innerText = today.getFullYear();                                  // @param YYYY월
            document.getElementById("calMonth").innerText = autoLeftPad((today.getMonth() + 1), 2);   // @param MM월


            // @details 이전 캘린더의 출력결과가 남아있다면, 이전 캘린더를 삭제한다.
            while (tbCalendar.rows.length > 0) {
                tbCalendar.deleteRow(tbCalendar.rows.length - 1);
            }



            // @param 첫번째 개행
            let row = tbCalendar.insertRow();



            // @param 날짜가 표기될 열의 증가값
            let dom = 1;

            // @details 시작일의 요일값( doMonth.getDay() ) + 해당월의 전체일( lastDate.getDate())을  더해준 값에서
            //               7로 나눈값을 올림( Math.ceil() )하고 다시 시작일의 요일값( doMonth.getDay() )을 빼준다.
            let daysLength = (Math.ceil((doMonth.getDay() + lastDate.getDate()) / 7) * 7) - doMonth.getDay();

            // @param 달력 출력

            // @details 시작값은 1일을 직접 지정하고 요일값( doMonth.getDay() )를 빼서 마이너스( - )로 for문을 시작한다.
            for (let day = 1 - doMonth.getDay(); daysLength >= day; day++) {
            
                let column = row.insertCell();

                // @param 평일( 전월일과 익월일의 데이터 제외 )
                if (Math.sign(day) == 1 && lastDate.getDate() >= day) {



                    // @param 평일 날짜 데이터 삽입

                    column.innerText = autoLeftPad(day, 2);
               


                    // @param 일요일인 경우
                    if (dom % 7 == 1) {
                        column.style.color = "#FF4D4D";
                    }
                    

                    // @param 토요일인 경우
                    if (dom % 7 == 0) {
                        column.style.color = "#4D4DFF";
                        row = tbCalendar.insertRow();   // @param 토요일이 지나면 다시 가로 행을 한줄 추가한다.
                    }

                }

                // @param 평일 전월일과 익월일의 데이터 날짜변경
                else {
                    let exceptDay = new Date(doMonth.getFullYear(), doMonth.getMonth(), day);
                    column.innerText = autoLeftPad(exceptDay.getDate(), 2);
                    column.style.color = "#A9A9A9";
                }

                // @brief   전월, 명월 음영처리
                // @details 현재년과 선택 년도가 같은경우
                if (today.getFullYear() == date.getFullYear()) {

                    // @details 현재월과 선택월이 같은경우
                    if (today.getMonth() == date.getMonth()) {

                        // @details 현재일보다 이전인 경우이면서 현재월에 포함되는 일인경우
                        if (date.getDate() > day && Math.sign(day) == 1) {
                            column.style.backgroundColor = "#555555";
                        }

                        // @details 현재일보다 이후이면서 현재월에 포함되는 일인경우
                        else if (date.getDate() < day && lastDate.getDate() >= day) {
                            column.style.backgroundColor = "#A9A9A9";
                            column.style.cursor = "pointer";
                            column.onclick = function () { calendarChoiceDay(this); }
                        }

                        // @details 현재일인 경우
                        else if (date.getDate() == day) {
                            column.style.backgroundColor = "#A9A9A9";
                            column.style.cursor = "pointer";
                            column.onclick = function () { calendarChoiceDay(this); }
                        }

                        // @details 현재월보다 이전인경우
                    } else if (today.getMonth() < date.getMonth()) {
                        if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
                            column.style.backgroundColor = "#A9A9A9";
                        }
                    }

                    // @details 현재월보다 이후인경우
                    else {
                        if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
                            column.style.backgroundColor = "#A9A9A9";
                            column.style.cursor = "pointer";
                            column.onclick = function () { calendarChoiceDay(this); }
                        }
                    }
                }

                // @details 선택한년도가 현재년도보다 작은경우
                else if (today.getFullYear() < date.getFullYear()) {
                    if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
                        column.style.backgroundColor = "#E5E5E5";
                    }
                }

                // @details 선택한년도가 현재년도보다 큰경우
                else {
                    if (Math.sign(day) == 1 && day <= lastDate.getDate()) {
                        column.style.backgroundColor = "#FFFFFF";
                        column.style.cursor = "pointer";
                        column.onclick = function () { calendarChoiceDay(this); }
                    }
                }



                dom++;

            }
        }

        /**
         * @brief   날짜 선택
         * @details 사용자가 선택한 날짜에 체크표시를 남긴다.
         */
        function calendarChoiceDay(column) {

            // @param 기존 선택일이 존재하는 경우 기존 선택일의 표시형식을 초기화 한다.
            if (document.getElementsByClassName("choiceDay")[0]) {
                document.getElementsByClassName("choiceDay")[0].style.backgroundColor = "#A9A9A9";
                document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
            }

            // @param 선택일 체크 표시
            column.style.backgroundColor = "#FF9999";
         
         

            // @param 선택일 클래스명 변경
            column.classList.add("choiceDay");
            
            //클릭하면  ajax 방식으로 날짜 보냄
            var month=today.getMonth()+1;
            var calendarfulldate=today.getFullYear()+"년"+month+"월"+column.innerText+"일";
            var calendarDate=JSON.stringify({
               calendarYear:today.getFullYear(),            
               calendarMonth:month,
            calendarDay:column.innerText,
            calendarFullDate:calendarfulldate
            
         });
            $.ajax({
            url:"/reserve/calendar",
            type:"POST",
            data:calendarDate,
            contentType:"application/json;charset=utf-8",
            
            success:function(reserveInfo){
              
               $("#date").val(reserveInfo.date);
               $("#timezone").html("");    /*추가  */
               $("#time").val("");
            },
            error:function(){
               alert('달력값 보내기 실패');
            }
         }); 
        }

        /**
         * @brief   숫자 두자릿수( 00 ) 변경
         * @details 자릿수가 한지라인 ( 1, 2, 3등 )의 값을 10, 11, 12등과 같은 두자리수 형식으로 맞추기위해 0을 붙인다.
         * @param   num     앞에 0을 붙일 숫자 값
         * @param   digit   글자의 자릿수를 지정 ( 2자릿수인 경우 00, 3자릿수인 경우 000 … )
         */
        function autoLeftPad(num, digit) {
            if (String(num).length < digit) {
                num = new Array(digit - String(num).length + 1).join("0") + num;
            }
            return num;

        }

    </script>
</head>

<body>
	<div id="wrap" style="text-align:center">
		<table class="scriptCalendar">
			<thead>
				<tr>
					<td onClick="prevCalendar();" style="cursor: pointer;">&#60;&#60;</td>
					<td colspan="5"><span id="calYear">YYYY</span>년 <span
						id="calMonth">MM</span>월</td>
					<td onClick="nextCalendar();" style="cursor: pointer;">&#62;&#62;</td>
				</tr>
				<tr>
					<td>일</td>
					<td>월</td>
					<td>화</td>
					<td>수</td>
					<td>목</td>
					<td>금</td>
					<td>토</td>
				</tr>
			</thead>
			<tbody></tbody>
		</table>

	</div>

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
					<td>인원:<input type="button" value="+" id="plus"><input
						id="group" name="memberGroupString" type="text" value="1"><input type="button"
						value="-" id="minus">
					</td>
				</tr>
				<tr>
					<td><input id="timelook" type="button" value="시간 조회">
						<!--시간조회   --></td>
				</tr>
				<!-- <div id="timezone"></div>	 -->
				<tr>
					<td>
						<!-- 시간대버튼 --> <input type="submit" value="예약하기"onclick="return confirm('예약하시겠습니까?')">
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
											alert('hello');
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
											   /* 	for(var j=0; j<checkButton.checkRedList.length; j++) {
											   		alert(checkButton.checkRedList[j].checkNum);
											   	} */
												
												$("#timezone").append("<input id='operationTime"+i+"' type='button' data-operationId='' data-placeId='' >");
												
												if(checkButton.memberCheckList.length!=0 ) {
													
												var check=0;
													
											   	for(var k=0; k<checkButton.memberCheckList.length; k++) {
											   		
											   		var t = checkButton.memberCheckList[k].operationId;
											   		if(checkButton.operationTimeList[i].operationId==t) {
												   		$("#timezone").append("<br><textarea id='dop"+i+"' ></textarea>");
												   		$("#dop"+i).val('최대인원'+checkButton.memberCheckList[k].maxPerson+'\n'+'현재예약인원'+checkButton.memberCheckList[k].memberGroup+'\n'+'남은 자리수'+checkButton.memberCheckList[k].possibleNum);
												   		check++;
												   	}
											   		
											   	}
											   	if(check==0) {
											   		$("#timezone").append("<br><textarea id='dop"+i+"' >");
											   		$("#dop"+i).val('최대인원'+checkButton.operationTimeList[i].maxNum+'\n'+'현재예약인원0');
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
												/* 	operationIdHidden= checkButton.operationTimeList[i].operationId;
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
</body>


</html>