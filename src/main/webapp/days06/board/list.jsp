<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/webPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }
</style>

<style>
.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
}

.pagination a.active {
  background-color: dodgerblue;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

body {
 	background-position: 
}
</style>

<!-- <style>
	.title {
	   display: inline-block;
	   white-space: nowrap;
	   width: 90%;
	   overflow: hidden;
	   text-overflow: ellipsis;
	}
</style> -->

</head>
<body>

<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">shy Home</a></h1>
  <ul>
  	<c:choose>
  		<c:when test="${not empty sessionScope.id }">
  			<li><span>${id}님 환영합니다!</span></li>
  			<li><a href="<%=contextPath%>/board/logout.do">로그아웃</a></li>
  		</c:when>
  		<c:otherwise>
		    <li><a href="<%=contextPath%>/board/logon.do">로그인</a></li>
		    <li><a href="<%=contextPath%>/board/addUser.do">회원가입</a></li>
  		</c:otherwise>
  	</c:choose>
  	
  </ul>
</header>
<h3>
  <span class="material-symbols-outlined">view_list</span>JSP days03
</h3>
<div>
	<!-- <div style="text-align: center">
	
	<img alt="" src="../images/did.png" width="130px" height="100px" style="margin: auto;">
	</div> -->
  
  <h2>목록 보기</h2>
  
  	<c:choose>
  		<c:when test="${ not empty id}">
  			<a href="<%=contextPath%>/board/write.do">글쓰기</a>
  		</c:when>
  	</c:choose>
  
  
  
  <table>
    <thead>
      <tr>
        <th width="10%">번호</th>
        <th width="45%">제목</th>
        <th width="17%">작성자</th>
        <th width="20%">등록일</th>
        <th width="10%">조회</th>
       </tr>
    </thead>
    <tbody>
      <c:choose>
        <c:when test="${ not empty list }">
          <c:forEach items="${list }" var="dto">
            <tr>
              <td>${ dto.seq }</td>
              <td class="title"><a href="<%=contextPath%>/board/view.do?seq=${dto.seq}">${ dto.title }</td>
              <td>${ dto.writer }</td>
              <td>${ dto.writedate }</td>
              <td>${ dto.readed }</td>
            </tr>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <tr>
            <td colspan="5">등록된 게시글이 없습니다.</td>
          </tr>
        </c:otherwise>
      </c:choose>
    </tbody>
    <tfoot>
      <tr>
        <td colspan="5" align="center">
			<div class="pagination">
				<c:if test="${pDto.prev }">
					<a href="<%=contextPath%>/board/list.do?currentpage=${pDto.start-1}">&lt;</a>
				</c:if>
				<c:forEach var="i" begin="${pDto.start }" end="${pDto.end }" step="1">
					<c:choose>
						<c:when test="${i eq pDto.currentPage}">
							<%-- <a class="active" href="<%=contextPath%>/cstvsboard/list.htm?currentpage=${i}">${i }</a> --%>
							<a class="active" href="<%=contextPath%>/board/list.do?currentpage=${i}">${i }</a>
						</c:when>
						<c:otherwise>
							<a href="<%=contextPath%>/board/list.do?currentpage=${i}">${i }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${pDto.next }">
					<a href="<%=contextPath%>/board/list.do?currentpage=${pDto.end+1}">&gt;</a>
				</c:if>
			</div>
		</td>
      </tr>
      <tr>
        <td colspan="5" align="center">
          <form method="get">
             <select name="searchCondition" id="searchCondition">
              <option value="1">title</option>
              <option value="2">content</option>
              <option value="3">writer</option>
              <option value="4">title+content</option>
            </select>
            <input type="text" name="searchWord" id="searchWord" />
            <input type="submit" value="search" />          
            
          </form>
        </td>
      </tr>
    </tfoot>
  </table>
  
  
</div>

<script>
	$(function() {
		if('<%= request.getParameter("write") %>' == "success") {
			alert("글 쓰기 완료!!");
		}
		
		if('<%= request.getParameter("delete") %>' == "success") {
			alert("글 삭제 완료!!");
		}
		
		if('<%= request.getParameter("logsuccess") %>' == "logsuccess") {
			alert("회원 가입 완료");
		}
		
		if('<%= request.getParameter("login") %>' == "success") {
			alert("로그인 성공!!");
		}
		
		if('<%= request.getParameter("logout") %>' == "success") {
			alert("로그인 성공!!");
		}
	});
</script>

	<script>
		$("#searchCondition").val(${param.searchCondition})
		$("#searchWord").val("${param.searchWord}")
	</script>

	<script>
	
		$(".pagination a:not(.active)").attr("href", function(index, oldhref) {
			return `\${oldhref}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
		})
	</script>

	<script>
		$(".title a").attr("href", function(index, oldhref) {
			return `\${oldhref}&currentpage=${param.currentpage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
		})
	</script>

</body>
</html
>