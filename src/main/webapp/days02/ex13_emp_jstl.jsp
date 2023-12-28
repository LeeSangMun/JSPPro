<%@page import="java.util.Iterator"%>
<%@page import="domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
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
		
		<h2>emp list</h2>
		<table>
			<thead>
				<tr>
					<td>empno</td>
			        <td>ename</td>
			        <td>job</td>
			        <td>mgr</td>
			        <td>hiredate</td>
			        <td>sal</td>
			        <td>comm</td>
			        <td>deptno</td>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="8">사원 존재 X</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="list" var="vo">
							<td>${list.empno }</td>
							<td>${list.ename }</td>
							<td>${list.job }</td>
							<td>${list.mgr }</td>
							<td>${list.hiredate }</td>
							<td>${list.sal }</td>
							<td>${list.comm }</td>
							<td>${list.deptno }</td>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
			</tbody>
			<tfoot>
				<tr>
					<td colspan="8">
						<%-- <%= list==null ? 0 : list.size() %>명. <a href="javascript:history.back()">뒤로가기</a> --%>
					</td>
				</tr>
			</tfoot>
		</table>
		
	</div>

</body>
</html>