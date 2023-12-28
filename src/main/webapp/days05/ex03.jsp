<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/inc/include.jspf" %>
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
			[페이지 모듈화]
			하나의 웹 사이트(애플리케이션)을 구성하는 페이지
			상단(Top), 하단(Bottom) 등 모든 웹 페이지의
			공통적인 부분을 모듈화 시켜서 코드의 중복 제거
			, 유지, 보수, 확장 용이.
			
			모든 웹 사이트 : 상단(Top), 하단(Bottom)
				ㄴ webapp 폴더
					ㄴ layout 폴더
						ㄴ top.jsp
						   bottom.jsp
			일정 관리 부분 : 공통 모듈 좌측, 우측
			
			[모듈화 처리]
			1) include 지시자
			2) jsp : 접두어가 붙은 태그를 액션태그
			   (jsp:include 액션태그)
			-> [include 지시자 / jsp:include 액션태그 차이점]
				전자는 하나의 파일로 만들어지고
				후자는 여러개의 파일로 만들어진다.
				
			WEB-INF
			 ㄴ inc 폴더 추가
			 	ㄴ include.jspf
		</pre>
	</div>

</body>
</html>