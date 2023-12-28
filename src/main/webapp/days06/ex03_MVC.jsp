<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String contextPath = request.getContextPath();
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
			<li><a href="<%=contextPath%>/board/logon.do">로그인</a></li>
			<li><a href="">회원가입</a></li>
		</ul>
	</header>
	<h3>
		<span class="material-symbols-outlined">view_list</span>
		jsp days
	</h3>
	<div>
		<a href="/jspPro/board/list.do">/board/list.do</a>
		<a href="/jspPro/board/write.do">/board/write.do</a>
		
		<xmp class="code">
			1. days05/ex05_02.jsp 회원가입 페이지로 사용
				bmember 테이블 생성
			2. days06/ex01_default.jsp 로그인 페이지로 사용
			3. header
				로그인 회원가입
				"홍길동" 환영 로그아웃
			4. 글쓰기 버튼은 로그인 해야지만 사용할 수 있도록 처리
			5. 상세보기에서
				수정하기 삭제하기 Home
				수정하기, 삭제하기는 로그인한 사람이 작성자 일 경우에만 
				사용할 수 있도록 세션 처리 
		</xmp>
	
		<pre class="code">
			JSP (모델2구조의) MVC패턴으로 구현
			[MVC 패턴] - 모델2 구조
			- 자바 개발자하면 반드시 습득해야 할 기본 기법
			- MVC 패턴 이해
			
			[모델1 구조와 모델2 구조 이해]
			- JSP 웹 애플리케이션의 구조는 모델1 구조와 모델2 구조로 나뉜다.
			1) 모델1구조
				[list.jsp] -> 요청 -> list.jsp
							<- 응답 <-
			2) 모델2구조
				[list.jsp] -> 요청 -> 서블릿 응답결과물 생성
								  -> 출력 담당 list.jsp
						   <- 응답 <- 
				
			[MVC 패턴]
			모델(Model) : 비즈니스 영역(로직 처리)
			뷰(View)   : 프리젠테이션 영역(화면 담당)
			컨트롤러(Controller) : 요청 -> 응답  컨트롤 담당
			
			[MVC 패턴 처리 과정]
			A[write.htm] -> 요청										헨들러 -> 서비스 -> DAO -> DB
																	커맨드
			B[list.htm] -> 요청		-> [컨트롤러(C)] -> 요청 로직 처리 -> 모델(M)
			C[logon.htm] -> 요청			요청분석						결과물(모델)
					:
										결과물(모델) -> ex) 뷰(Write.jsp)
										출력 담당 파악
							<- 응답 <- 
			[실습] 모델2구조 이지만 MVC 패턴 X
			1. 게시판 : days04.board 폴더
				ㄴ delete.jsp
				ㄴ edit.jsp
				ㄴ list.jsp
				ㄴ view.jsp
				ㄴ write.jsp
			2. days04.board패키지				: 서블릿(List.java, Write.java)
			   days04.board.domain패키지		: VO, DTO
			   days04.board.persistence패키지	: DAO
			   days04.board패키지
			   
			위의 실습을 MVC 패턴으로 수정
			
			1) 모든 요청은 컨트롤러(하나의 서블릿)에서 요청을 받는다.
			2) list.htm, write,htm, delete.htm 모든 요청 -> 하나의 서블릿 처리
					url-pattern ? 	 / 
								  *.do
			3) 컨트롤러(하나의 서블릿) 이름 : DispatcherServlet.java
				(1) 모든 요청 -> 모델(핸들러) 처리 파악(매핑)
					파일 선언 - commandHandler.preperties
					요청 URL 처리 모델 매핑
					list.do = ListHandler
					write.do = WriteHandler
				(2) 결과물 저장
				(3) 리다이렉트, 포워딩 결정
			
			4) 모델(커맨드핸들러)
				인터페이스	CommandHandler
				ListHandler im CommandHandler
				WriteHandler im CommandHandler
					:
			5) DAO, DTO 복사 사용
			6) service 패키지 추가
			7) JSP 페이지 복사 사용
								  
		</pre>
	</div>

</body>
</html>