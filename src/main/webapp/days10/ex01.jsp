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
			구글 맵 OPEN API
			key
		</pre>
		
		<a href="ex01_02.jsp?lat=37.499294&lng=127.0331883">(주)쌍용교육센터</a>

		<div id="googleMap" style="width: 100%; height: 400px"></div>
		<script>
			function myMap() {
				var mapOptions = {
					center : new google.maps.LatLng(51.508742, -0.120850),
					zoom : 5
				};
				var map = new google.maps.Map(document.getElementById("googleMap"), mapOptions);
			}	
		</script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB0pIM6xWPk0gxc57rXFQuaY8YCyv0ojq8&callback=myMap"></script>

	</div>

</body>
</html>