<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
	request.setCharacterEncoding("utf-8");
%> --%>
<%-- <%@ include file="/WEB-INF/inc/include.jspf" %> --%>
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
			// POST 방식요청 : ISO 88
			String name = request.getParameter("name");
			String age = request.getParameter("age");
		%>
		
		전달된 한글이름 : <%= name %><br>
		전달된 나이 : <%= age %><br>
		
		<hr>
		전달된 한글이름(EL) : ${param.name }<br>
		전달된 나이(EL) : ${param.age }<br>
		
	</div>

</body>
</html>