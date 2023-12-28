<%@page import="java.util.Enumeration"%>
<%@page import="org.apache.taglibs.standard.lang.jstl.EnumeratedMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 파라미터값을 불러와서 db에 값 저장, delete전 까지는 값 유지 */
%>
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
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");		
%>	


	<form action="ex03_03.jsp" method = "get">
		address : <input type="text" name= "address" value ="서울 역삼동" ><br>
		tel : <input type="text" name= "tel" value ="010-1111-1234" ><br>
		<input type="button" value = "prev" onclick="history.back()">
		<input type="submit" value = "next">
		
		<!-- 이전페이지에서 파라미터로 넘어온 값 숨기기 -->
		<!--
		<input type="hidden" name = "name" value = "<%=name%>">
		<input type="hidden" name = "age" value = "<%=age%>">
		-->
	</form>
</div>
<script>
	// 입력값이 많을 때 동적 처리
	let content;
<%
	Enumeration<String> en = request.getParameterNames();
	while(en.hasMoreElements() ){
		String pname = en.nextElement();
		String pvalue = request.getParameter(pname);
%>
	content = `<input type="hidden" name = "<%=pname%>"  value = "<%=pvalue%>">`;
		$("form").append(content);
<%
	}
%>
	
</script>
</body>
</html>