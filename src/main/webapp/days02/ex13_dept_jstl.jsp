<%@page import="java.util.ArrayList"%>
<%@page import="domain.DeptVO"%>
<%@page import="java.util.Iterator"%>
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
			
		</pre>
		
		<select name="deptno" id="deptno">
			<option>선택하세요.</option> 
		   	<c:forEach items="${list}" var="vo">
		   	<option value="${vo.deptno }">${vo.dname }</option>
		   	</c:forEach>
		</select>
		
	</div>
	
	<script>
		$("#deptno")
			.wrap("<form></form>")
			.change(function(event) {
				$(this)
					.parent()
						.attr({
							method : "get"
							, action : "/jspPro/scott/emp"
						})
						.submit();
			});
		
		// 서블릿 추가 days02.ScottEmp.java days01.ex06_emp.jsp
		// ex13_emp.jsp
		/*
		$("#deptno").change(function(evevt) {
			let deptno = $(this).val(); // 10, 20, 30, 40
			location.href = ``
		})
		*/
	</script>

</body>
</html>