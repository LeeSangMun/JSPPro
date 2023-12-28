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
	
	<div>
		<form action="<%=contextPath%>/board/addUser.do" method="post">

		  <table border="1" style="width:400px">
		     <tr>
		        <td>아이디</td>
		        <td><input type="text"  name="id" value="admin"></td>
		     </tr>
		     <tr>
		        <td>이름</td>
		        <td><input type="text"  name="name"  value="관리자"></td>
		     </tr>
		     <tr>
		        <td>비밀번호</td>
		        <td><input type="password"  name="passwd" value="1234"></td>
		     </tr>
		     <tr>
		        <td>이메일</td>
		        <td><input type="text"  name="email" value="admin@naver.com"></td>
		     </tr>
		     <tr>
		        <td colspan="2">
		           <input type="submit">
		           <input type="reset">
		        </td>
		     </tr>
		  </table>
		</form>
		
	</div>

	<script>
	$(function() {
		if('<%= request.getParameter("logsuccess") %>' == "fail") {
			alert("회원가입 실패!!");
		}
	});
	</script>

</body>
</html>