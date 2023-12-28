<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			[jsp 웹 애플리케이션 4가지 영역(scope)]
			1. page scope(영역) : 하나의 페이지에서 사용되는 영역
								pageContext 기본 객체
			2. request scope : 하나의 요청에서 사용되는 영역
								request 기본 객체
			3. session scope : 하나의 웹 브라우저에서 사용되는 영역
								session 기본 객체
			4. application scope : 하나의 웹 애플리케이션에서 사용되는 영역
									application 기본 객체
									
			ex02_02.jsp
			이름/나이/주소/연락처/
			ex02_03.jsp
			이름/나이/주소/연락처/
			ex02_04.jsp
			이름/나이/주소/연락처/
			
			setAttribute()
			getAttribute()
			removeAttribute()
			getAttributeNames()
		</pre>
	</div>

</body>
</html>