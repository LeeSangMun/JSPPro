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
			js or jquery 사용해서
			정수를 입력 후 엔터 치면 결과물이 demo 출력.
		</pre>
		
		정수 : <input type="text" id="num" name="num" /><br>
		<p id="demo"></p>
		
	</div>

	<script>
		$(function() {
			$(":text[name=num]")
				.css("text-align", "center")
				.keyup(function(event) {
					if(event.which == 13) {
						$("#demo").html("");
						
						let n = $(this).val();
						let sum = 0;
						for (var i = 1; i <= n; i++) {
							sum += i;
							$("#demo").html(function(index, oldhtml) {
								return oldhtml + i + (i==n ? "" : "+");
							})
						}
						
						$("#demo").html(function(index, oldhtml) {
							return oldhtml + "=" + sum;
						})
						
						$(this).select();
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