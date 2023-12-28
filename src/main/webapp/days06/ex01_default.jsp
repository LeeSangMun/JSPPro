<%@page import="com.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/inc/session_auth.jspf" %>
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
	<div>
		<pre class="code">
			[ex01_default.jsp]
		</pre>
		
		<%
			if(logonID == null) { // 로그인 하지 않은 상태
		%>
				<div id="logon">
					 <form action="<%=contextPath%>/board/logon.do" method="post">
					    아이디 : <input type="text" name="id" value="admin" /><br>
					    비밀번호 : <input type="password" name="passwd" value="1234" /><br>
					    <input type="submit" value="로그인" />
					    <input type="button" value="회원가입" />
					    <span style="color:red;display: none">로그인 실패했습니다.</span> 
					 </form>
				</div>
		<%		
			} else { // 로그인 성공
		%>
				<div id="logout">
					[ <%= logonID %> ]님 환영합니다<br>
  					<a href="ex01_logout.jsp">로그아웃</a>
				</div>
		<%
			}
		%>
		
		<!-- 인증 X -->
		<a href="<%= contextPath %>/board/list.do">게시판</a><br>
		<a href="">공지사항</a><br>
		
		<!-- 인증 O -->
		<%
			if(logonID != null) {
		%>
				<a href="">자료실</a><br>
				<a href="">일정관리</a><br>
		<%
			}
		%>
		
		<%
			if(logonID != null && logonID.equals("admin")) {
		%>
				<!-- 인증 O + 관리자 권한 == admin 인증 -->
				<a href="">급여관리</a><br>
				<a href="">인사관리</a><br>
		<%
			}
		%>
		
	</div>

<script>
	// 로그인 실패하고 다시 ex07_default.jsp?logon=fail 이동
	if(${param.logon eq "fail"}) {
		$("#logon span")
			.fadeIn()
			.fadeOut(3000);
	}
</script>

<script>
	$(function() {
		if('<%= request.getParameter("login") %>' == "fail") {
			alert("로그인 실패!!");
		}
	});
</script>

</body>
</html>