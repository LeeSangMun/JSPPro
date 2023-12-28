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
			c:forEach 
			begin="" 		시작값
			end="" 			끝값
			items="" 		루프 Map, 배열, 컬렉션 대상 객체
			step="" 		루프 중거차
			var="" 			변수명
			varStatus=""	
		</pre>
		<c:set var="sum" value="0" />
		<c:forEach begin="1" end="10" step="1" var="i" varStatus="status">
			<%-- <c:if test="${ i eq 10 }">${ i }</c:if>
			<c:if test="${ i ne 10 }">${ i }+</c:if> --%>
			<%-- ${i += "+" } --%>
			<%-- <c:choose>
				<c:when test="${ i eq 10 }">${ i }</c:when>
				<c:otherwise>${ i }+</c:otherwise>
			</c:choose> --%>
			<%-- ${ i += (i==10 ? "" : "+") } --%>
			${ i += (status.last ? "" : "+") }
			<c:set var="sum" value="${sum + i}" />
		</c:forEach>
		= ${sum }
		
		<hr>
		<!-- status.current -->
		<c:forEach begin="5" end="12" var="i" step="2" varStatus="status">
			${ i } - ${ status.index } - ${ status.count } 
			- ${ status.first } - ${ status.last }<br>
		</c:forEach>
		
	</div>

</body>
</html>