<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	String ok = request.getParameter("ok");		// 인증성공
	String name = request.getParameter("name");	// 관리자
	String error = request.getParameter("error");
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
			ex11.jsp id/paswd -> 로그인
			ex11_ok.jsp
				로그인성공	ex11.jsp?ok&name=로그인이름
				로그인실패	ex11.jsp?error
		</pre>
		
		<div id="logon">
			<form action="ex11_ok.jsp" method="get">
				아이디 : <input type="text" name="id" value="admin" />
				비밀번호 : <input type="password" name="passwd" value="1234" />
				<input type="submit" value="logon" />
			</form>
		</div>
		<div id="logout">
			[<%= name %>]님 로그인하셨습니다.<br>
			<button>로그아웃</button>
		</div>
		
		<a href="#">설문조사</a>
		<!-- 반드시 로그인해야만 사용할 수 있는 메뉴 -->
		
		<%
			if(ok != null) {
		%>
			<a href="#">일정관리</a>
			<a href="#">게시판</a>
			
			<script>
				$(function() {
					alert("로그인 성공");
					$("#logon").hide();
					$("#logout").show();
				})
			</script>
		<%
			}
		%>
		
	</div>

	<script>
		$("#logout").hide();
	</script>

</body>
</html>