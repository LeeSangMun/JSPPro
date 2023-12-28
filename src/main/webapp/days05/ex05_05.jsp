<%@page import="java.util.Date"%>
<%@page import="days05.MemberInfo"%>
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
			[ex05_05.jsp]
		</pre>
		
		<%
			
		%>
		
		<jsp:useBean id="mi" class="days05.MemberInfo" scope="page"></jsp:useBean>
		<jsp:setProperty property="*" name="mi"/>
		<jsp:setProperty property="registerDate" name="mi" value="<%=new Date() %>"/>
			
		아이디 : <jsp:getProperty property="id" name="mi"/><br>
		이름 : <%= mi.getName() %><br>
		비밀번호 : <%= mi.getPasswd() %><br>
		등록일 : <%= mi.getRegisterDate() %><br>
		이메일 : <%= mi.getEmail() %><br>
		
	</div>

</body>
</html>