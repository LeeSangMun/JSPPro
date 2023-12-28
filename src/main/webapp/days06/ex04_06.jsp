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
		
		<%
			String title = "JSP-EL 수업 중 ~ ";
			request.setAttribute("title", title);
		%>
		제목 : <%= title %><br>
		<%= "제목 : " +  title %><br>
		제목 : ${ requestScope.title }<br>
		<!-- EL 안에서 += 연산자 문자열 연결 연산자 -->
		${ "제목 : " += title }<br>
		
		
		${1+1; 10+10 }<br> <!-- EL3.0 20 -->
		${ n = 10 }<br> <!-- 10 -->
	</div>

</body>
</html>