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
			1. MVC 패턴
			2. 세션 - 인증 처리, 권한 처리, 장바구니
			3. 페이징 모듈화
			4. [필터(Filter)]
				1) http 요청 - 자원 접근 권한, 인증X
							  파라미터유무
							  미리 사전에 체크할 수 있다.
							  
							  요청 취소
						응답 - xml -> json 변환
							  암호화 처리
			5. 처리 과정
															필터 체이닝
			[클] -> list.do 요청 -> 필터 (url-pattern으로) -> 필터 -> 필터 -> 필터 -> [서] 처리
				<- 응답 <- 필터(암호화 필터) <- 필터(xml->jsom 변환) <- 
				
			6. 필터 구현시 핵심 3개 타입
				1) javax.servlet.Filter 인터페이스 구현
					(1) init() 필터 초기화 메서드 오버라이딩
					(2) destroy() 
					(3) ***doFilter() : 필터링할 작업
							암호화, 인증, 권환 체크
							-> 다음 이동 chain.doFilter()
				2) ServletRequestWrapper  요청을 포장한 결과를 저장하는 객체
				3) ServletResponseWrapper 응답을 포장한 결과를 저장하는 객체
				
			7. 필터 클래스를 사용하려면
				lib 폴더 안에 servlet-api.jar 파일 추가
				하지만 이클립스로 개발할 경우에는 추가할 필요가 없다.
			8. 필터클래스 선언
				필터클래스 1) web.xml 등록
						2) @WebFilter 어노테이션
						
			9. ex02_02.jsp, ex02_02_ok.jsp
		</pre>
	</div>

</body>
</html>