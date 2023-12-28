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
			[JSP 기본 내장 객체(9가지)]
			1. request
			2. response - 웹 브라우저에 보내는 응답 정보를 담는 객체
				1) 헤드 정보 입력
				2) 리다이렉트 / 포워딩 차이점
					- 페이지 이동하는 이동
					- 사전적의미 : 다른 방향으로 다시 전송하다(보내다)
					예) redirect
						[a.jsp] -> a.jsp 요청 
						   		<-
						[b.jsp] -> b.jsp 요청
						   		<-
						   		
						ex09.jsp -> ex09_ok.jsp -> ex09_main.jsp
						아이디		인증	성공 -> ex09_main.jsp
						비밀번호		DB id/pwd
						[로그인]		인증 실패 -> ex09.jsp?error
						   		
					예) forward
					[a.jsp] -> a.jsp 요청
								  ↓
							<- b.jsp 요청
		</pre>
		
		<a href="ex10.jsp">ex10.jsp</a>
		<a href="ex10.jsp?error">ex10.jsp?error</a>
		<a href="ex10.jsp?error=1001">ex10.jsp?error=1001</a>
		
	</div>

</body>
</html>