<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String content = "";
	int sum = 0;
	for (int i = 1; i <= 10; i++) {
		content += String.format("%d+", i);
		sum += i;
	}
	content += String.format("=%d", sum);
%>
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
			jsp 스크립트 요소 : [스크립트릿], 표현식, 선언문
			1+2+3+4+5+6+7+8+9+10=55
			[스크립트릿] : 자바코딩(for),
			[표현식] 	  : 출력
			JSP 내장 객체 (11가지) : request
								 [out]
		</pre>
		
		
		
		<p id="demo"><%= content %></p>
	</div>

	<script>
		let content = '<%= content%>';
		$("#demo").html(content);
	</script>

</body>
</html>