<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css" />
<script src="/jspPro/resources/cdn-main/example.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
span.material-symbols-outlined {
	vertical-align: bottom;
}
</style>

</head>
<body>
	<header>
		<h1 class="main">
			<a href="#">lsm Home</a>
		</h1>
		<ul>
			<li><a href="">로그인</a></li>
			<li><a href="">회원가입</a></li>
		</ul>
	</header>
	<h3>
		<span class="material-symbols-outlined">view_list</span> jsp days
	</h3>
	<div>
		<pre class="code">
			지도 위에서 마우스를 클릭하면 그 위치에 마커와 정보창을 표시
			[이벤트 처리]
		</pre>
		
		<div id="googleMap" style="width: 100%; height: 400px"></div>
		<script>
			var lat = 37.499294;
			var lng = 127.0331883;
			
			function myMap() {
				var mapCenter = new google.maps.LatLng(lat, lng);
				var mapCanvas = document.getElementById("googleMap");
				
				var mapOptions = {
					center : new google.maps.LatLng(lat, lng)
					, zoom : 15
				};
				var map = new google.maps.Map(mapCanvas, mapOptions);
				
				// 1. 지도(map)를 클릭할 때 이벤트 처리
				map.addListener("click", (event) => {
					// alert(event.latLng);
					placeMaker(map, event.latLng);
				});
			} // myMap
			
			function placeMaker(map, markerCenter) {
				// 1. 마커 표시
				var marker = new google.maps.Marker({
					position : markerCenter
				});
				marker.setMap(map);
				
				// 2. 정보창 표시
				// var message = "<a href='http://www.sist.co.kr'>(주)쌍용교육센터</a>";
				var message = `위도 : \${markerCenter.lat()}<br>경도 : \${markerCenter.lng()}`;
				var infoWindow = new google.maps.InfoWindow({
					content : message
				});
				infoWindow.open(map, marker);
			}
		</script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB0pIM6xWPk0gxc57rXFQuaY8YCyv0ojq8&callback=myMap"></script>

	</div>

</body>
</html>