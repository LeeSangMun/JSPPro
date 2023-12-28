<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="com.util.Cookies"%>
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
			EL cookie 내장 객체 = Map(쿠키이름 key, 쿠키객체 value)
		</pre>
		
		EL user : ${cookie.user.value }<br>
		EL id : ${cookie.id.value }<br>
		EL age : ${cookie.age.value }<br>
		
		<hr>
		<%
			Cookies cookies = new Cookies(request);
			Set<Entry<String, Cookie>> set = cookies.cookieMap.entrySet();
			Iterator<Entry<String, Cookie>> ir = set.iterator();
			while(ir.hasNext()) {
				Entry<String, Cookie> entry = ir.next();
				String cname = entry.getKey();
				Cookie c = entry.getValue();
				String cvalue = c.getValue();
		%>
				<li><%= cname %> : <%= cvalue %></li>
		<%
			}
		%>
		
		<hr>
		<c:forEach items="${cookie }" var="entry">
			<li>${entry.key } : ${entry.value.value }</li>
		</c:forEach>
		
	</div>

</body>
</html>