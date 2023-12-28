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
			[JSTL(JSP standard Tag Library)]
			- JSP 표준 태그 라이브러리
			- 많은 개발자가 필요에 의해서 사용자 정의하는 태그 만들어서 사용.
				(커스텀 태그)
			- 표준화한 태그
			
			1. JSTL 태그의 5가지 종류
				1) 코어 - c 		: 변수 선언, 제어문, URL 처리
				
					ex05_03.jsp
					ex05_04.jsp
					ex05_05.jsp
				
				2) 국제화 - fmt 	: 숫자, 날짜 형식, 지역, 메시지 출력
				3) XML - X 		: XML 처리
				4) 데이터베이스 - sql		ex05_02.jsp
				5) 함수 - fn 		: 문자열 처리, 컬렉션 처리
		</pre>
	</div>

</body>
</html>