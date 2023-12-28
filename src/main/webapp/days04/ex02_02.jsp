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
			
		</pre>
		
		<%
			// JSP 4가지 영역(scope) 저장
			pageContext.setAttribute("name", "admin");
			request.setAttribute("age", 20);
			session.setAttribute("addr", "서울 역삼동");
			application.setAttribute("tel", "010-");
		%>
		
		>p name : <%= pageContext.getAttribute("name") %> <br>
		>r age : <%= request.getAttribute("age") %> <br>
		>s addr : <%= session.getAttribute("addr") %> <br>
		>a tel : <%= application.getAttribute("tel") %> <br>
		
		<br>
		<a href="ex02_03.jsp">ex02_03.jsp</a>
	</div>

</body>
</html>