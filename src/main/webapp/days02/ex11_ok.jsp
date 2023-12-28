<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	String location;
	if(id.equals("admin") && passwd.equals("1234")) {
		// 로그인 성공
		String name = "관리자";
		// (기억)
		// 리다이렉트 할 때 한글 파라미터가 포함된 경우에는
		// 반드시 인코딩을 해야 한다.
		
		location = "ex11.jsp?ok&name=" + URLEncoder.encode(name, "utf-8");
	} else {
		// 로그인 실패
		location = "ex09.jsp?error";
	}
	
	response.sendRedirect(location);
%>
    