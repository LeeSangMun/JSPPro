<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css" />
<script src="/jspPro/resources/cdn-main/example.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

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
		<span class="material-symbols-outlined">view_list</span> jsp days
	</h3>
	<div>
		<pre class="code">
			ex03_dept.xml
			ex03_dept.json
		</pre>

		<button type="button" onclick="loadJson()">ex03_dept.json ->
			ajax -> 출력</button>

		<br> <br>

		<p id="demo"></p>

	</div>

	<script>
		function getXMLHttpRequest() {
			if (window.ActiveXObject) { // IE          6
				try {
					return new ActiveXObject("Msxml2.XMLHTTP");
				} catch (e) {
					try {
						return new ActivXObject("Microsoft.XMLHTTP");
					} catch (e) {
						return null;
					}

				}
			} else if (window.XMLHttpRequest) {
				return new XMLHttpRequest();
			} else {
				return null;
			}
		}

		function loadJson() {
			// 1. xhr = XMLHttpRequest 객체 
			let xhr = getXMLHttpRequest();

			// 2. xhr.on[readystatechange] = callback
			xhr.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					let deptJson = this.responseText;
					// alert(deptJson);
					let dnameArr = [];
					// json -> js Object 변환
					var deptJsObject = JSON.parse(deptJson);
					// alert(deptJsObject.departments);
					for (var i = 0; i < deptJsObject.departments.length; i++) {
						let deptObject = deptJsObject.departments[i];
						dnameArr.push(deptObject.dname);
					}
					
					$("#demo").html("<li>" + dnameArr.join("</li><li>") + "</li>");
				}
			}

			// 3. xhr.open() 
			xhr.open("GET", "ex03_dept.json", true);

			// 4. xhr.send()
			xhr.send();
		}
	</script>

</body>
</html>