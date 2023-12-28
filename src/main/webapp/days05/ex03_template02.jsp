<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String contextPath = request.getContextPath();
%>

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
	<%@ include file="/layout/top.jsp" %>
	<h3>
		<span class="material-symbols-outlined">view_list</span>
		jsp days
	</h3>
	<div>
		<pre class="code">
			include 지시자 사용
		</pre>
		
		<table>
			<tr>
				<td>
					<%@ include file="layout/left.jsp" %>
				</td>
				<td>
					회원 관리 Content 부분<br>
					회원 관리 Content 부분<br>
					회원 관리 Content 부분<br>
					회원 관리 Content 부분<br>
					회원 관리 Content 부분<br>
				</td>
				<td>
					<%@ include file="layout/right.jsp" %>
				</td>
			</tr>
		</table>
		
	</div>
	<!-- contextPath는 지정 안해도 됨 -->
	<%@ include file="/layout/bottom.jsp" %>
</body>
</html>