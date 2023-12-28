<%@page import="java.util.Enumeration"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 // http://localhost/jspPro/days05/ex06_05_ok.jsp
 // ?
 // age=20
 // &
 // name=%ED%99%8D%EA%B8%B8%EB%8F%99\
 
 	Enumeration<String> en = request.getParameterNames();
	while(en.hasMoreElements()) {
		String cookieName = en.nextElement();
		String cookieValue = request.getParameter(cookieName);
		Cookie c = new Cookie(cookieName, URLEncoder.encode(cookieValue, "UTF-8"));
		c.setMaxAge(-1);
		response.addCookie(c);
	}
	
	String location = "ex06_03.jsp";
	response.sendRedirect(location);
%>