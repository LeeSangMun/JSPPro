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
			제출(submit)
		</pre>
		
		<form method="get">
		정수 : <input type="text" id="num" name="num" /><br>
		</form>
		<p id="demo">
			<%
				String num = request.getParameter("num");
				int n;
				int sum = 0;
				if(num != null && !num.isEmpty()) {
					n = Integer.parseInt(num);
					for(int i=1; i<=n; i++) {
						sum += i;
						%><%= i %>+<% 
					}
					%>=<%= sum%><%
				}
			%>
		</p>
		
	</div>

	<script>
		$(function() {
			$(":text[name=num]")
				.css("text-align", "center")
				.val('${param.num}')
				.keyup(function(event) {
					if(event.which == 13) {
						// $("form").submit();
					}
				});
		})
	</script>

</body>
</html>