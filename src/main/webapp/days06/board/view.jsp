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
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://www.jquery.com/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
			[view.jsp]
		</pre>
		
		<h2>내용 보기</h2>
		<table>
			<tr>
				<td>이름</td>
				<td>${dto.writer }</td>
				<td>등록일</td>
				<td>${dto.writedate }</td>
			</tr>
			<tr>
				<td>Email</td>
				<td>${dto.email }</td>
				<td>조회수</td>
				<td>${dto.readed }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3">${dto.title }</td>
			</tr>
			<tr>
				<td colspan="4" class="full" style="height: 200px; vertical-align: top;">${dto.content }</td>
			</tr>
			<tfoot>
				<tr>
					<td colspan="4" align="center">
						
						<a href="<%=contextPath%>/board/edit.do?seq=${dto.seq}">수정하기</a>
						<a href="<%=contextPath%>/board/delete.do?seq=${dto.seq}">삭제하기</a>
						<input type="button" id="btnModalDelete" value="모달 삭제" />
						<a href="<%=contextPath%>/board/list.do">Home</a>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	
	<!-- 삭제 모달 창 -->
	<div id="dialog-form" align="center" title="삭제">
		<h2>삭제하기</h2>
		<form method="post" action="<%=contextPath%>/board/delete.do?seq=${param.seq}">
			<table>
				<tr>
					<td colspan="2" align="center">
						<b>글을 삭제합니다.</b>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="pwd" size="15" autofocus/>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="삭제" />
						&nbsp;&nbsp;
						<input type="button" value="취소" id="cancel" />
					</td>
				</tr>
			</table>
			<span style="color:red;display: none" id="spn">비밀번호가 잘못되었습니다.</span>
		</form>
	</div>
	
	<script>
		// 삭제 모달창 처리
		dialog = $("#dialog-form").dialog({
					autoOpen : false,
					height : 400,
					width : 350,
					modal : true,
					buttons : {},
					close : function() {
						form[0].reset();
					}
				});
		
		$("#btnModalDelete").on("click", function() {
			dialog.dialog( "open" );
		})
		
		$("#cancel").on("click", function() {
			dialog.dialog( "close" );
		})
		
		// 모달창 안의 form 요소
		form = dialog.find("form");
		
		// 삭제 실패 후 리다이렉트되었을 경우
		// 모달창을 미리 열러두자.
		if (${param.delete eq "fail"}) {
			dialog.dialog( "open" );
			$("#spn").show().slideToggle(3000);
		}
		
	</script>
	
	<script>
		$(function() {
			if('<%= request.getParameter("edit") %>' == "success") {
				alert("글 수정 완료!!!")
			}
		})
	</script>
	
	<script>
		/* Home */
		$("tfoot a").last().attr("href", function(index, oldhref) {
			return `\${oldhref}?currentpage=${param.currentpage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
		})
		
		/* 수정/삭제하기 */
		$("tfoot a:not(tfoot a:last-of-type)").attr("href", function(index, oldhref) {
			return `\${oldhref}&currentpage=${param.currentpage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
		})
	</script>

</body>
</html>