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
			xml -> json 형식을 ajax 더 많이 사용.
			[ JSON ]
			1. [J]ava[S]cript [O]bject [N]otation
			2. 가벼운 데이터 교환 방식
			3. 인간 읽기 쉽고 쓰기 쉽기
			4. 기계가 구문분석, 생성, 사용 쉽기.
		</pre>
		
		<button onclick="getPersonJson()">로컬 저장소의 personJson 사용</button>
		<p id="demo"></p>
		
	</div>

	<script>
		// 1. js Object
		var person = {
				name : "john"
				, age : 20
				, city : "seoul"
		};
		
		// 2. person js Object -> json 변환
		let personJson = JSON.stringify(person);
		// console.log("personJson", personJson);
		
		// 3. 로컬 저장소 personJson 저장
		localStorage.setItem("personJson", personJson);
	</script>
	
	<script>
		function getPersonJson() {
			let personJson = localStorage.getItem("personJson");
			// json -> js Object
			let person = JSON.parse(personJson);
			$("#demo").html(person.name + " / " + person.age);
			
			// localStorage.removeItem("personJson");
			// localStorage.clear();
			
		}
	</script>

</body>
</html>