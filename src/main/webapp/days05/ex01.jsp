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
							
			3. 예외 처리의 우선 순위
				1) page 지시자의 errorPage 속성으로 지정한 에러페이지 처리
				2) 예외 타입별 처리 - web.xml
				3) 예외 코드별 처리 - web.xml
				4) 웹컨테이너가 제공하는 기본 에러 페이지
				
		</pre>
		
		<%
			String name = null;
			try {
				name = request.getParameter("name");
				name = name.toUpperCase();
			} catch(NullPointerException e) {
				name = "익명";
			} catch(Exception e) {
				
			}
		%>
		
		name 파라미터값 : <%= name %>
		
	</div>
	
	<br>
	<a href="ex1000.jsp">ex1000.jsp</a>

</body>
</html>