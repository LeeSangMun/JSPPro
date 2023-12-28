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
			ex04_02.jsp
			pageContext 저장 객체 = pageScope(영역)
		</pre>
		<%
			// pageContext.getAttribute(name);
			// pageContext.setAttribute(name, value);
			
			// [pageContext로 기본 내장 객체 얻어 올 수 있다.]
			// 사용자 정의 태그(커스텀 태크)를 구현할 때 사용
			// pageContext.getRequest() == request
			// pageContext.getResponse() == response
			// pageContext.getOut() == out
			// pageContext.ServletConfig() == config
			// pageContext.ServletContext() == apllication
			// :
		%>
	</div>

</body>
</html>