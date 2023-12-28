<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
			edit.jsp
		</pre>
		
		<h2>글 수정</h2>
	  <form method="post">
		  <table>
		  <tr>
		            <td colspan="2" align="center"><b>글을 수정합니다</b></td>
		         </tr>
		         <tr>
		            <td align="center">이름</td>
		            <td><input type="text" name="writer" size="15"
		            		disabled value="${dto.writer }"></td>
		         </tr>
		         <tr>
		            <td align="center">비밀번호</td>
		            <td><input type="password" name="pwd" size="15" required="required"></td>
		         </tr>
		         <tr>
		            <td align="center">Email</td>
		            <td><input type="email" name="email" size="50" 
		            		value="${dto.email }"></td>
		         </tr>
		         <tr>
		            <td align="center">제목</td>
		            <td><input type="text" name="title" size="50"
		            		value="${dto.title }"></td>
		         </tr>
		         <tr>
		            <td align="center">내용</td>
		            <td><textarea name="content" cols="50" rows="10">"${dto.content }"</textarea></td>
		         </tr>
		         <tr>
		            <td align="center">HTML</td>
		            <td>
		            	<input type="radio" name="tag" value="1">적용
		               	<input type="radio" name="tag" value="0">비적용
		               	<script>
		               		$(":radio[name=tag][value=${dto.tag}]").attr("checked", "checked");
		               	</script>
		            </td>
		         </tr>
		         <tr>
		            <td colspan="2" align="center">
		              <input type="submit" value="작성 완료">
		              &nbsp;&nbsp;&nbsp; 
		              <a href="javascript:history.back();">이전으로</a>
		            </td>
		         </tr>
		  </table>
	  </form>
		
	</div>

	<script>
		$("form").submit(function() {
			alert("유효성 검사 한 후");
			// event.preventDefault(); // 이벤트 취소
		})
	</script>

</body>
</html>