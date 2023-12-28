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
			[JS 쿠키(cookie)] document.cookie 속성
			[JSP 쿠키(cookie)]
			
			- 쿠키 ? 
			클라이언트(브라우저)에 텍스트 형식의 저장된 파일
			- [클] -> 요청 -> [서]
						쿠키 함꼐 서버에 전송.
			- 상태 관리
			- [JSP 쿠키 생성 + 처리 과정 이해]
				1) [클] -> 요청(쿠키) -> [서]
										쿠키 생성
						<- 응답
					[클]
					쿠키 저장
					[클] -> 요청(쿠키) -> [서] 쿠키처리
										쿠키삭제
						<- 응답
					[클]
					X 쿠키 삭제, 수정
			- JS 쿠키 : document.cookie 속성 생, 확, 삭, 수
			- JSP 쿠키 : 
				1) Cookie 클래스 -> 쿠키 생성
				2) 응답 (클)
					response.addCookie(생성된 쿠키)
			- 쿠키 생성
				1) "쿠키이름=쿠키값; 만료시점=X; 도메인=localhost; 경로=/; 보안"	
				만료시점=[-1] 브라우저 닫을 때 자동 쿠키 제거
					   0  쿠키 제거
					   별도의 만료시점을 설정하지 않으면
					   브라우저가 종료될 때 쿠키 제거
			-실습
			 ex06_02.jsp
			 ex06_02_ok.jsp
		</pre>
		
		<a href="ex06_02.jsp">ex06_02.jsp 쿠키 생성</a><br>
		<a href="ex06_03.jsp">ex06_02.jsp 쿠키 확인</a><br>
		
	</div>

</body>
</html>