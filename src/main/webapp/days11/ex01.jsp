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
			create table googlemap
		   (
		       id number primary key  -- 100/101/102
		      , type varchar2(20)    -- 레스토랑 /커피.. (맛집의 종류)
		      , name varchar2(30)   -- 식당이름
		      , lng number
		      , lat number
		      , address varchar2(255)  --식당 주소
		   ); 
		   
		   1. ex02_oracle_input.jsp
		   	ㄴ 맛집 등록 페이지(모달창)
		   	
		   2. ex02_oracle_input_ok.jsp
		   	ㄴ 맛집 입력 정보 저장
		   	
		   3. ex02_oracle_json.jsp
		   	ㄴ 맛집 등록 후 이동할 페이지
		   	
		   4. ex02_oracle_json_data.jsp
		   	ㄴ ex02_oracle_json.jsp 페이지로
		   	이동(로딩)할 때 ajax를 사용해서
		   	한독 빌딩 주위 맛집을 select 한 후
		   	지도에 마커 표시
		</pre>
	</div>

</body>
</html>