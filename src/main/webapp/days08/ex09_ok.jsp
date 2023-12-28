<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
		<pre class="code">
			ex09_ok.jsp
		</pre>
		
		<%
			// ㄴ.
			String saveDirectory = pageContext.getServletContext().getRealPath("/days08/upload");
			System.out.println(saveDirectory);
			File f = new File(saveDirectory);
			if(!f.exists()) {
				f.mkdirs();
			}
			// ㄷ.
			int maxPostSize = 5 * 1024 * 1024; // 기본 단위 바이트
			
			// ㄹ.
			String engcoide = "UTF-8";
			
			// ㅁ.
			FileRenamePolicy policy = new DefaultFileRenamePolicy();
			
			MultipartRequest multiRequest = new MultipartRequest(
					request
					, saveDirectory
					, maxPostSize
					, policy
					);
			// 벌써 첨부파일들은 upload 폴더에 저장 완료
		%>
		
		> 전송된 메시지 : <%= multiRequest.getParameter("msg") %>
		<br>
		<%
			Enumeration en = multiRequest.getFileNames();
		while(en.hasMoreElements()) {
			String inputNameArr = (String)en.nextElement(); 
			File attachFile = multiRequest.getFile(inputNameArr);
			if(attachFile != null) {
				String fileName = attachFile.getName();
				String originalFileName = multiRequest.getOriginalFileName(inputNameArr);
				String filesystemName = multiRequest.getFilesystemName(inputNameArr);
		%>
				<hr>
				> 첨부된 파일 명 : <%= fileName %><br>
				> 첨부된 파일 크기 : <%= attachFile.length() %>bytes<br>
				> 첨부된 원래 파일명 : <%= originalFileName %><br>
				> 실제 저장된 파일명 : <%= filesystemName %><br>
		<% 
			}
		}
			
		%>
	</div>

</body>
</html>