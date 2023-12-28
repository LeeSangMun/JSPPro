<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
	.material-symbols-outlined{
		vertical-align: text-bottom;
	}
</style>
</head>
<body>
<header class="sticky">
	<h1 class="main">
		<a href="#">home</a>
	</h1>
	<ul>
		<li> <a href="#">로그인</a> </li>
		<li> <a href="#">회원가입</a> </li>
	</ul>	
</header>
<h3>
	<span class="material-symbols-outlined">view_list</span>
	jsp days00
</h3>
<div>
	<xmp class="code">
		
	</xmp>
	<form action="/jspPro/days03/ex02_ok.jsp">
	<fieldset>
	<legend>부서 선택</legend>
   		
   			<input type="checkbox" name="deptno" value="10">ACCOUNTING
   		
   			<input type="checkbox" name="deptno" value="20">RESEARCH
   		
   			<input type="checkbox" name="deptno" value="30">SALES
   		
   			<input type="checkbox" name="deptno" value="40">OPERATIONS
   		
   </fieldset>
   <fieldset>
   <legend>잡(job) 선택</legend>
   		
   			<input type="checkbox" name="job" value="ANALYST">ANALYST
   		
   			<input type="checkbox" name="job" value="CLERK">CLERK
   		
   			<input type="checkbox" name="job" value="MANAGER">MANAGER
   		
   			<input type="checkbox" name="job" value="PRESIDENT">PRESIDENT
   		
   			<input type="checkbox" name="job" value="SALESMAN">SALESMAN
   		
	</fieldset>
	<input type="submit" value="search">
	<input type="button" value="emp delete">
	</form>
	
	
</div>
<script>

</script>
</body>
</html>