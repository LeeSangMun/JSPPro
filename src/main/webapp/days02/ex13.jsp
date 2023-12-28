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
			[MVC 패턴으로 프로젝트]
			1. 포워딩~
			2. 로직처리 xxx.jsp -> 서블릿
			
			1) URL매핑 - /jspPro/scott/dept
			2) 서블릿클래스 days02.ScottDept.java
						(로직처리 + 포워딩)
						[doGet()].doPost()
			3) ex13_dept.jsp
		</pre>
		
		<!-- GET 방식 -->
		<a href="/jspPro/scott/dept">부서 정보 조회</a>
		
	</div>

</body>
</html>