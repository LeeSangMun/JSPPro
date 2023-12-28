<%@page import="java.io.DataInputStream"%>
<%@page import="java.util.Enumeration"%>
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
			<%
				Enumeration<String> en = request.getHeaderNames();
				out.print("> 전송된 헤더 정보 출력<br>");
				while(en.hasMoreElements()) {
					String key = en.nextElement();
					String value = request.getHeader(key);
					out.print(key + " : " + value + "<br>");
				}
			%>
		</pre>
		
		
		
		<h2>스트림(Stream) 전송된 데이터 정보 출력</h2>
		<%
			ServletInputStream sis = request.getInputStream();
			DataInputStream dis = new DataInputStream(sis);
			
			String line = "";
			while((line = dis.readLine()) != null) {
				out.print(new String(line.getBytes("ISO-8859-1"), "UTF-8"));
			}
		%>
		
	</div>

</body>
</html>