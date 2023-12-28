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
			jquery ajax 함수 : json/js/xml 등등
				- get 방식 : getJSON(), getScript(), get()
				- post 방식 : post()
				
				get/post : load() [$.ajax()]
		</pre>
		
		<h2>회원 가입 페이지</h2>
		
		<form action="" method="get">
		    deptno : <input type="text" name="deptno" value="10" /><br>
		    empno(id) : <input type="text" name="empno" value="7369" />
		    <input type="button" id="btnEmpnoCheck" value="empno 중복체크 - jquery ajax" />
		    <p id="notice"></p>
		    <br>
		    ename : <input type="text" name="ename" value="" /><br>
		    job : <input type="text" name="job" value="" /><br>
		    <input type="submit" value="회원(emp) 가입" />
		 </form>
		
	</div>

	<script>
		$(function() {
			$("#btnEmpnoCheck").on("click", function() {
				// ?empno=7369&deptno=10&ename=admin
				let params = $("form").serialize();
				// alert(params)
				$.ajax({
					url : "ex04_idcheck.jsp"
					, dataType : "json" // text, json, xml 등등
					, type : "GET"
					, data : params
					, cache : false
					, success : function(data, textStatus, jqXHR) {
						
						//alert(data.count);
						if(data.count == 1) {
							$("#notice").css("color", "red").text("이미 사용 중인 ID 입니다.");
						} else {
							$("#notice").css("color", "black").text("사용 가능한 ID 입니다.");
						}
					}
					, error : function() {
						alert("에러~~");
					}
				});
			});
		});
	</script>

</body>
</html>