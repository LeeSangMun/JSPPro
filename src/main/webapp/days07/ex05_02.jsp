<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css" />
<script src="/jspPro/resources/cdn-main/example.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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
		<span class="material-symbols-outlined">view_list</span>
		jsp days
	</h3>
	<div>
		<pre class="code">
			
		</pre>
		
		서버 요청 시간 :
		<%=new Date().toLocaleString()%>
		<br> <input type="button" value="jquery ajax"/> <br>

		<p id="demo"></p>
		
	</div>
	
	<script>
		$(function() {
			$("input").on("click", function() {
				$("#demo").load('ex05_ajax_info.txt', function(responseText, textStatus, jqXHR) {
					if(textStatus == "success") {
						var rtext = responseText;
						let names = rtext.split(",");
						for (let name of names) {
							$("#demo").append($("<li></li>").text(name));
						}
					} else if(textStatus == "error") {
						alert("error");
					}
				});
			});
		});
	</script>
	

</body>
</html>