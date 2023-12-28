<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// days07/AuthInfo.java
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	// DB 연동 id/passwd/authrotiy
	// 인증 정보 저장
	session.setAttribute("auth", id);
	String location = "/jspPro/days07/ex03.jsp";
	String referer = (String)session.getAttribute("referer");
	
	if(referer != null) {
		location = referer;
		session.removeAttribute("referer");
	}
	
	response.sendRedirect(location);
	
%>