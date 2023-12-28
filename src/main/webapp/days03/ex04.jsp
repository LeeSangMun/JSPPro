<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		[실행결과]
    1등급   (     700~1200 ) - 2명
          20   RESEARCH   7369   SMITH   800
          30   SALES         7900   JAMES   950
    2등급   (   1201~1400 ) - 2명
       30   SALES   7654   MARTIN   2650
       30   SALES   7521   WARD      1750   
    3등급   (   1401~2000 ) - 2명
       30   SALES   7499   ALLEN      1900
       30   SALES   7844   TURNER   1500
    4등급   (   2001~3000 ) - 4명
        10   ACCOUNTING   7782   CLARK   2450
       20   RESEARCH   7902   FORD   3000
       20   RESEARCH   7566   JONES   2975
       30   SALES   7698   BLAKE   2850
    5등급   (   3001~9999 ) - 1명   
       10   ACCOUNTING   7839   KING   5000
	</xmp>
	<%
		String contextPath = request.getContextPath();
	%>
	<a href="<%=contextPath%>/days03/salgradeEmp.htm">등급별 사원정보 조회</a>
</div>
<script>

</script>
</body>
</html>