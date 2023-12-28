<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String error = request.getParameter("error");
	// ? 			null
	// ?error		""
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
			[로그인 페이지]
		</pre>
		
		<form action="ex09_ok.jsp" method="get">
			아이디 : <input type="text" name="id" value="admin" />
			비밀번호 : <input type="password" name="passwd" value="1234" />
			<input type="submit" value="logon" />
		</form>
		
	</div>

	
		<%
			if(error != null && error.equals("")) {
		%>
		<script>
		alert("로그인 실패")
		</script>
		<%
			}
		%>
		
		<script>
			<%-- alert('<%= error%>') --%>
			<%-- alert(new Boolean(<%= error %>)) --%>
		</script>

</body>
</html>