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
	<!-- http://localhost/jspPro/days03/empsearch.htm?deptno=10&deptno=20&job=MANAGER -->
	<%
		String [] pdeptnos =request.getParameterValues("deptno");
		String [] pjobs =request.getParameterValues("job");
		String a = String.join(",", pdeptnos);
		String b = " ' " + String.join(" ',' ", pjobs) + " ' ";
	%>
</div>

	SELECT * FROM emp 
	WHERE deptno IN (<%=a %>) AND job IN ( <%=b %>)
	ORDER BY deptno ;
<script>

</script>
</body>
</html>