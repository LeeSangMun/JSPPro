<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			JSTL
			1) 코어 	c
			3) 국제화	fmt
				- 특정 지역에 따라 알맞은 메시지 출력할 때 사용하는 태그 
				- 주로 사용 : 숫자, 날짜 포멧팅
				formatNumber
				formatDate
				parseNumber
				parseDate
		</pre>
		
		<%
			Date now = new Date();
		%>
		<!-- now = Wed Nov 01 10:47:57 KST 2023 -->
		now = <%= now %><br><c:set value="<%= now %>" var="now"></c:set><li>
		<!-- 2023. 11. 1. -->
		<fmt:formatDate value="${ now }"/>
		</li>
			<!-- 2023. 11. 1. -->
		<li><fmt:formatDate value="${ now }" type="date"/></li>
		
		<!-- 오전 10:51:34 -->
		<li><fmt:formatDate value="${ now }" type="time"/></li>
		
		<!-- 2023. 11. 1. 오전 10:51:34 -->
		<li><fmt:formatDate value="${ now }" type="both"/></li>
		
		<!-- 2023년 11월 01일 -->
		<li><fmt:formatDate value="${ now }" pattern="yyyy년 MM월 dd일"/></li>
		
		<!-- 2023. 11. 1. -->
		<li><fmt:formatDate value="${ now }" dateStyle="default"/></li>
		<!-- 2023년 11월 1일 수요일 -->
		<li><fmt:formatDate value="${ now }" dateStyle="full"/></li>
		<!-- 23. 11. 1. -->
		<li><fmt:formatDate value="${ now }" dateStyle="short"/></li>
		<!-- 2023. 11. 1. -->
		<li><fmt:formatDate value="${ now }" dateStyle="medium"/></li>
		<!-- 2023년 11월 1일 -->
		<li><fmt:formatDate value="${ now }" dateStyle="long"/></li>
		
		<hr>
		<%
			long price = 22345;
			request.setAttribute("price", price);
		%>
		price : ${price }<br>
		<fmt:formatNumber value="${ price }" 
		type="number" pattern="##,###.00" var="fmtprice"/>
		price : ${ fmtprice }<br>
		
		<fmt:formatNumber value="${ price }" type="currency" currencySymbol="\\"/><br>
		<fmt:formatNumber value="${ price }" type="percent"/><br>
		
	</div>
	
	<div>
		<%
			String strPrice = "1,200.34";
			strPrice = strPrice.replaceAll(",", "");
			double dprice = Double.parseDouble(strPrice);
			
		%>
		
		price : <%= dprice %><br>
		
		<fmt:parseNumber value="<%= strPrice %>" pattern="0,000.00" var="dprice"/>
		price : ${ dprice }<br>
		
		<hr>
		<%
			String strNow = "2023년 11월 01일";
			// String -> Date 형변환
			// 1) year, month, day
			// Date now = new Date(2023-1900, 11-1, 1);
			
			// 2) SimpleDateFormat
			/* String pattern = "yyyy년 MM월 dd일";
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			Date now = sdf.parse(strNow); */
			
			/* String pattern = "yyyy년 MM월 dd일";
			DateTimeFormatter df = DateTimeFormatter.ofPattern(pattern);
			LocalDate now = LocalDate.parse(strNow, df); */
		%>
		
		<fmt:parseDate value="<%= strNow %>" pattern="yyyy년 MM월 dd일" var="pnow"></fmt:parseDate>
		now : ${ pnow }<br>
	</div>

</body>
</html>