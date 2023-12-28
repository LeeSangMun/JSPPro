<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<a href="/jspPro/days08/list.ss">자료실 목록보기</a>
		<br>
	
		<pre class="code">
			게시판 + 파일 첨부 => 자료실
			글번호
			제목
			
			1. 테이블 , 시퀀스 생성
		    create table filetest(          
		     num number not null primary key  
		     , subject varchar2(50) not null     
		     
		     , filesystemname varchar2(100) -- 실제 저장되는 파일명       a1.txt
		     , originalfilename varchar2(100) -- 저장할 때 파일명             a.txt
		     , filelength number  -- 파일크기
		    );
		    
		   create sequence seq_filetest;
			
			2. MVC 패턴 X
			days08 패키지
				ㄴ FileTestDTO.java
				ㄴ FileTestDAO.java
				ㄴ FileTestServlet.java
				
			days08 폴더
				ㄴ ex11_list.jsp
				ㄴ ex11_write.jsp
				ㄴ ex11_update.jsp
		</pre>
	</div>

</body>
</html>