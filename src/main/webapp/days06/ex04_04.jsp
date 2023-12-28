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
			EL 산술 연산자 사용 가능
		</pre>
		<%-- 
		${ 10 + 3 }<br>	13
		${ 10 - 3 }<br>	7
		${ 10 * 3 }<br>	30
		${ 10 / 3 }<br>	3.333
		${ 10 div 3 }<br>	3.333
		${ 10 % 3 }<br>	1
		${ 10 mod 3 }<br>	1
		--%>
		
		<!-- EL + 연산자는 기본 덧셈 기능 -->
		${ "10" + 3  }<br> <!-- 13 -->
		<%-- ${ "한글" + 3  }<br> --%> <!--  -->
		${ null + 3  }<br> <!-- 13 -->
		
		
	</div>

</body>
</html>