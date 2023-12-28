<%@page import="java.util.Date"%>
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
			js ajax ex05_ajax_info.txt
		</pre>

		서버 요청 시간 :
		<%=new Date().toLocaleString()%>
		<br> <input type="button" value="js ajax" onclick="load('ex05_ajax_info.txt');" /> <br>

		<p id="demo"></p>

	</div>

	<script>
		let httpRequest; // XMLHttpRequest객체

		function getXMLHttpRequest() {

			if (window.ActiveXObject) { // IE
				try {
					return new ActiveXObject("Msxml2.XMLHTTP"); // 
				} catch (e) {
					try {
						return new ActiveXObject("Microsoft.XMLHTTP");
					} catch (e) {
						return null;
					}
				}
			} else if (window.XMLHttpRequest) {
				return new XMLHttpRequest();
			} else {
				return null;
			}
		}

		function load(url) {
			// 1. XMLHttpRequest객체
			httpRequest = getXMLHttpRequest();
			// 2. 
			httpRequest.onreadystatechange = callback;
			// 3. open() 요청 설정
			httpRequest.open("GET", url, true);
			// 4. send() 
			httpRequest.send();
		}

		function callback() {
			if (httpRequest.readyState == 4) { // 서버 요청 완료
				if (httpRequest.status == 200) { // 응답 성공
					var rtext = httpRequest.responseText;
					let names = rtext.split(",");
					for (let name of names) {
						$("#demo").append($("<li></li>").text(name));
					}
				}
			}
		}
	</script>

</body>
</html>