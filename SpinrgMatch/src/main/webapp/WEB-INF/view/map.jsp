<%@page import="java.util.List"%>
<%-- <%@page import="map.model.Place"%>  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
// List<Place> list=(List<Place>)session.getAttribute("list"); 
//System.out.println(list.get(0).getF_name()+":"+list.get(0).getF_addr());
//System.out.println(session.getAttribute("authUser"));
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
/* #wrap
{
   width: 70%;
   overflow: hidden;
   margin: 0 auto;
}
#wrap div:first-child {
   width: 50%;
   box-sizing:border-box;
   float: left;
}
#wrap div:last-child {
   width: 50%;
   
   box-sizing:border-box;
   float: center;
} 
#map div{
       /* width:100%; */ 
      /* color:black; */   
} */

/* #hello
{
   background-color: red;
   color: black;
} */

</style> 
</head>
<body>
<!-- <div id="wrap" style="text-align: center"> -->   

 <form id="please" method="POST" action="map.do" >
<input type="hidden" id="placeName" name="placeName" value="">
</form> 

<!-- <div id="map" style="width:70%;height:400px; margin: 0 auto;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9139ecf68b85217bc0cf45262df346ce&libraries=services"></script>

<script style="color:red">
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
				
				success:function(){
					alert('풋살장 정보 보내기 성공');
					
				},
				error:function(){
					
					alert('풋살장 정보보내기 실패');
				}
			});
        	
        	
                /* var placeName =document.getElementById('placeName');
                placeName.setAttribute('value',name);
                $("#please").submit(); */
                
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


</script> -->
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
            content: '<span style="color:black; text-align:center; ">'+name+'</span>'
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


</body>
</html>