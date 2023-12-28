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
		
		정수 : <input type="text" id="num" name="num" /><br>
		<p id="demo">
			<%
				// ? num = 5;
				// ex05_05.jsp 처럼 뒤에 파라미터가 없으면 null
				// ex05_05.jsp?num 처럼 돼있으면 없으면 ""
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
				<%-- .val('<%= num==null ? "" : num %>') --%>
				.val('${param.num}')
				.keyup(function(event) {
					if(event.which == 13) {
						let num = $(this).val();
						$(this).val()
						location.href = "ex05_02.jsp?num=" + num
					}
				});
		})
	
		/*
		$("#num").keydown(function(event) {
			if(event.which == 13) {
				if(isNaN($(this).val())) {
					alert("정수를 입력하세요.");
					return;
				}
				let sum = 0;
				for (var i = 1; i <= $(this).val(); i++) {
					sum += i;
				}
				$("#demo").text(sum);
			}
		})
		*/
	</script>

</body>
</html>