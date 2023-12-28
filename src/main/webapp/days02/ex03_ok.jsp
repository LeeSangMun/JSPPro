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
		<xmp class="code">
			[서블릿 예제]
			1. get 방식	: 이름/나이 전달
			2. post 방식	: 이름/나이 전달
			
			Info.java 서블릿 선언
			/days02/info.htm URL매핑
			
			<%
				// 
				int n =Integer.parseInt(request.getParameter("n"));
			%>
			
			> request.getParameter : <%= n %><br>
			> EL : ${param.n }<br>
		</xmp>
	</div>

</body>
</html>