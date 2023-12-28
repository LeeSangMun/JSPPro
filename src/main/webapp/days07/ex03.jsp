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
			<c:choose>
				<c:when test="${empty auth }">
					<li><a href="/jspPro/days07/member/logon.jsp">로그인</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/jspPro/days07/member/logout.jsp">[${auth}]로그아웃</a></li>
				</c:otherwise>
			</c:choose>
			<li><a href="/jspPro/days07/member/addmember.jsp">회원가입</a></li>
		</ul>
	</header>
	<h3>
		<span class="material-symbols-outlined">view_list</span>
		jsp days
	</h3>
	<div>
		<pre class="code">
			[필터 예제] - 요청    인증, 권한
			LoginCheckFilter.java
			
			days07
				ㄴ admin 폴더 : 관리자 사용할 수 있는 페이지
					ㄴ 회원관리.jsp
					ㄴ 급여관리.jsp
					필터 : 관리자 인증/권한 체크
				ㄴ  board 폴더
						ㄴ 글목록.jsp  인증 X
						ㄴ 글쓰기.jsp  인증 O
				ㄴ  member 폴더
					ㄴ 회원가입.jsp
					ㄴ 로그인/로그아웃.jsp
		</pre>
		
		<a href="${pageContext.request.contextPath }/days07/board/list.jsp">글목록</a><br>
		<a href="${pageContext.request.contextPath }/days07/board/write.jsp">글쓰기</a><br>
		<a href="${pageContext.request.contextPath }/days07/admin/membermanage.jsp">회원관리</a><br>
		
	</div>

</body>
</html>