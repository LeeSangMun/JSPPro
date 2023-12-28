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
			ex05_empjson.jsp
		</pre>
		
		<h3><%= new Date().toLocaleString() %></h3>
		
		<button type="button" id="btn1">jquery ajax + json</button>
		<br>
		<p id="demo"></p>
		
	</div>
	
	<script>
	$(function() {
		$("#btn1").on("click", function() {
			// ?empno=7369&deptno=10&ename=admin
			let params = $("form").serialize();
			// alert(params)
			$.ajax({
				/* url : "ex05_empjson.jsp" */
				url : "ex05_empjson_lib.jsp"
				, dataType : "json" // text, json, xml 등등
				, type : "GET"
				, data : params
				, cache : false
				, success : function(data, textStatus, jqXHR) {
					// alert(data)
					$(data.emp).each(function(i, element) {
						$("#demo").append(`<li>\${element.empno} : \${element.ename}`);
					})
				}
				, error : function() {
					alert("에러~~");
				}
			});
		});
	});
	</script>

</body>
</html>