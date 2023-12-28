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
			1. 서블릿(Servlet) ?
				- 자바 웹 기술
			2.서블릿 구현 방법(과정)
				1) [서블릿 규약]을 따르는 자바 클래스 선언
					ㄱ. 접근지정자 public
					ㄴ. javax.servlet.http.HttpServlet 클래스 상속
					ㄷ. service(), get(), post() 메서드를 오버라이딩 해야한다.
				// 2, 3 자동으로 됨
				2) 컴파일 -> ???.class
				3) /WEB-INF/classes 폴더 안에 반드시 클래스 파일 넣어둔다.
				
				4) 요청 URL 정하고 URL 매핑
						ㄱ. web.xml 서블릿 등록 / URL 매핑
						ㄴ. 서블릿 3.0 ~ @WebServlet 어노테이션으로 처리
				5) 브라우저 -> 요청 URL -> 서블릿 등록 -> 응답
			3. 실습 예제
				1) [서블릿 규약]을 따르는 자바 클래스 선언
					days01.Now.java
				2) URL 패턴 설정하는 방법
					ㄱ. / MVC 패턴 처리
							웹 애플리케이션의 [기본 서블릿]으로 등록. 매핑
					ㄴ. *.확장자
					ㄷ. /경로명/경로명/.../*
					ㄹ. 위의 3가지를 제외한 나머지 하나는
						정확한 URL 패턴 경로 지정
		</pre>
		
		<a href="/jspPro/days01/Now.html">Now.java 서블릿 요청</a>
		<br>
		<a href="/jspPro/days01/Now">Now.java 서블릿 요청</a>
		<br>
		<a href="/jspPro/days01/Now.ss">Now.java 서블릿 요청</a>
		<br>
	</div>

</body>
</html>