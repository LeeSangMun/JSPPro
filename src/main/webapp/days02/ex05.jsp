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
			[jsp 기본 내장 객체 - request 객체]
			1. 웹브라우저 -> 요청 -> 서버
						[request]
						파라미터
			2. 요청 정보 객체
			3. 클라이언트 전송한 파라미터, 쿠키, 헤더
				등등 얻어올 수 있다.
			4. 서버와 관련된 정보 얻어올 수 있다.
			
			*** 1. contextPath(컨텍스트 루트) : /jspPro
			*** 2. 클라이언트 IP 주소 : 0:0:0:0:0:0:0:1
			*** 3. 요청 전송 방식 : GET
			*** 4. 요청 URL : http://localhost/jspPro/days02/ex05.jsp
			*** 5. 요청 URI : /jspPro/days02/ex05.jsp
		</pre>
		
		
		*** 1. contextPath(컨텍스트 루트) : <%= request.getContextPath() %><br>
		*** 2. 클라이언트 IP 주소 : <%= request.getRemoteAddr() %><br>
		*** 3. 요청 전송 방식 : <%= request.getMethod() %><br>
		*** 4. 요청 URL : <%= request.getRequestURL() %><br>
		*** 5. 요청 URI : <%= request.getRequestURI() %><br>
		
	</div>

</body>
</html>