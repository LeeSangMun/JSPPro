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
			[jsp 예외처리 방법]
			1. try ~ catch ~ finally 문 사용
			2. 예외 처리하는 예외 페이지를 지정
				ㄴ	/WEB-INF 폴더 안
						ㄴ error 폴더
							ㄴ viewErrorMessage.jsp
				ex01_02.jsp 페이지에서 예외가 발생하면 
				viewErrorMessage.jsp(예외페이지)로 이동 -> 응답
			3. [WEB-INF 폴더 안에 설정파일 - web.xml]
				1) 응답 상태 코드별로 예외 페이지 지정
					(HTTP 상태 404)
					ex01.jsp
					 ㄴ a href="ex1000.jsp";
					 ㄴ web.xml 404 -> 404.jsp 설정 코딩 추가
					 
					 [응답 상태 코드]
					 404 : 요청URL을 처리하기 위한 자원이 존재하지 않음
					 500 : 서버 내부 에러가 발생(자바 코딩 문제)
					 200 : 요청을 정상적으로 처리
					 401 : 접근을 허용하지 않음
					 400 : 클라이언트의 요청이 잘못된 구문으로 구성
					 403 : PUT 요청을 지원하지 않을 때
					 등등
				2) 예외 타입별로 예외 페이지 지정
					[예외 타입별]
					NullPointException
					~~Exception
					
					Ex01_03.jsp
		</pre>

		<%
			String name = null;
	
			name = request.getParameter("name");
			name = name.toUpperCase();
		%>

		name 파라미터값 : <%= name %>
		
	</div>

</body>
</html>