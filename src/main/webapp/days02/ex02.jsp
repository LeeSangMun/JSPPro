<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			[서블릿]
			1. 서블릿 규약 클래스
			2. 서블릿 등록 + URL 매핑
				1) web.xml		Now.java
				2) @어노테이션 사용.
		</pre>
		
		<!-- http://localhost/jspPro/days02/Hello -->
		<!-- <a href="Hello">Hello 서블릿 호출</a> -->
		
		<!-- http://localhost/Hello -->
		<!-- <a href="/Hello">Hello 서블릿 호출</a> -->
		
		<a href="/jspPro/Hello">Hello 서블릿 호출</a>
		<br>
		<a href="/jspPro/days02/hello.html">Hello 서블릿 호출</a>
		<br>
		
	</div>

</body>
</html>