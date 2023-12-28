<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			delete.jsp
		</pre>
		<h2>삭제하기</h2>
		<form method="post">
			<table>
				<tr>
					<td colspan="2" align="center">
						<b>글을 삭제합니다.</b>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="pwd" size="15" autofocus/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="삭제" />
						&nbsp;&nbsp;
						<input type="button" value="취소" id="cancel" />
					</td>
				</tr>
			</table>
		</form>
	</div>

	<script>
		<%
			String error = (String)request.getAttribute("error");
			if(error != null) {
		%>
				alert('<%= error %>');
		<%
			}
		%>
	</script>

</body>
</html>