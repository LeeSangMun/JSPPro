<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	String location;
	if(id.equals("admin") && passwd.equals("1234")) {
		// 로그인 성공
		location = "ex09_main.jsp";
	} else {
		// 로그인 실패
		location = "ex09.jsp?error";
	}
	
	response.sendRedirect(location);
%>
