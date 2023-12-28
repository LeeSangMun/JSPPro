<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.net.URLDecoder"%>
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
			쿠키 수정
			? 
		</pre>
		
		<%!
			public String getCookieValue(String cname, HttpServletRequest request) {
				Cookie[] cookieArr = request.getCookies();
				for(Cookie c : cookieArr) {
					if(c.getName().equals(cname)) {
						try {
							return URLDecoder.decode(c.getValue(), "utf-8");
						} catch(UnsupportedEncodingException e) {}
					}
				}
				return null;
			}
		%>
		
		<form action="ex06_05_ok.jsp">
			<%
				String[] updCookieNames = request.getParameterValues("ckbCookie");
				for(int i=0; i<updCookieNames.length; i++) {
					String cname = updCookieNames[i];
					String cvalue = getCookieValue(cname, request);
			%>
					<li>
						<%=cname %> : <input type="text" 
						name="<%=cname%>" value="<%=cvalue%>"/>
					</li>
			<%
				}
			%>
			
			<input type="submit" value="쿠키 수정" />
		</form>
		
	</div>

</body>
</html>