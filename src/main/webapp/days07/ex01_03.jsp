<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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
			int[] m = {3,5,2,4,1}
		</pre>
		
		<%
			int[] m = {3,5,2,4,1};
		%>
		<%-- <c:set var="arr" value="<%= m %>"/> --%>
		<c:set var="arr" value="<%= new int[]{3,5,2,4,1} %>"/>
		<c:forEach items="${arr }" var="n" varStatus="s">
			<li>m[${ s.index }] = ${n }</li>
		</c:forEach>
		
		<hr>
		<%
			Map<String, String> map = new HashMap<>();
			map.put("id", "admin");
			map.put("name", "관리자");
			map.put("age", "20");
		%>
		
		<c:set value="<%= map %>" var="minfo"></c:set>
		id : ${minfo.id }<br>
		name : ${minfo.name }<br>
		age : ${minfo.age }<br>
		
		<hr>
		<ol>
			<c:forEach items="${ minfo }" var="entry">
				<li>${ entry.key } - ${ entry.value }</li>
			</c:forEach>
		</ol>
		
		<hr>
		<c:set var="names" value="임경재,신종혁.박정호,주강민"></c:set>
		<c:forTokens items="${names }" delims=",." var="name">
			${name }<br>
		</c:forTokens>
		
		<hr>
		<%
			String msg = "<h3>Hello World</h3><br>홍길동<br>";
			// c:out 태그
			// JspWriter에 출력할 때 사용하는 태그
			// 출력할 값은 value 속성
			// escapeXml = "true" 기본값
			// 		< &lt; 변환
			// 		> &gt; 변환
			// 		& &amp; 변환
			// 		' 
		%>
		<p id="demo">
			<%= msg %>
			<br>
			<c:out value="<%= msg %>" escapeXml="true"></c:out>
		</p>
	</div>

</body>
</html>