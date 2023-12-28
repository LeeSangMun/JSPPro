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
			[EL 비교 연산자]
			[EL 삼항 연산자]	? :
			[EL 논리 연산자]	&& and || or ! not
			
			[EL empty 연산자]
			null true 리턴
			""   true 리턴
			0    true 리턴
			빈 Map  true 리턴
			empty list true 리턴
			
			위의 조건을 제외한 나머지는 false 반환.
		</pre>
		
		${ 100 == 10 }<br> <!-- false -->
		${ 100 eq 10 }<br> <!-- false -->
		
		${ 100 != 10 }<br> <!-- true -->
		${ 100 ne 10 }<br> <!-- false -->
		
		${ 100 > 10 }<br>
		${ 100 gt 10 }<br>
		
		${ 100 < 10 }<br>
		${ 100 lt 10 }<br>
		
		${ 100 >= 10 }<br>
		${ 100 ge 10 }<br>
		
		${ 100 <= 10 }<br>
		${ 100 le 10 }<br>
	</div>

</body>
</html>