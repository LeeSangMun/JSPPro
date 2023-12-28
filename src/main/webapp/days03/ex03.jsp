<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
	.material-symbols-outlined{
		vertical-align: text-bottom;
	}
</style>
</head>
<body>
<header class="sticky">
	<h1 class="main">
		<a href="#">home</a>
	</h1>
	<ul>
		<li> <a href="#">로그인</a> </li>
		<li> <a href="#">회원가입</a> </li>
	</ul>	
</header>
<h3>
	<span class="material-symbols-outlined">view_list</span>
	jsp days00
</h3>
<div>
	<xmp class="code">
	[상태관리]
    ex03.jsp   ex03_02.jsp  ex03_03.jsp
    이름       주소          이름,나이,주소,연락처
    나이       연락처        [확인]
    [다음]     [다음]
    
    // 상태유지
    
    1) 쿠키	-- 값이 클라이언트에 텍스트형식으로 저장	
    2) 세션
    3) 파라미터 - form action? ~~
  				**	input type='hidden' **
  	4) DBMS 	 --  서버에서 지속적으로 값이 필요한 경우 임시테이블 생성해서 값 입력
	</xmp>
	<form action="ex03_02.jsp" method = "get">
		name : <input type="text" name= "name" value ="홍길동" ><br>
		age : <input type="text" name= "age" value ="20" ><br>
		<input type="submit" value = "next">
	</form>
</div>
<script>

</script>
</body>
</html>