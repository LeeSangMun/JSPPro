<%@page import="com.util.Cookies"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String location = "ex07_default.jsp";
	
	if(id.equals("admin") && passwd.equals("1234")) {
		// 관리자 로그인 성공
		// auth 쿠키이름 로그인ID 저장
		Cookie c = Cookies.createCookie("auth", id, "/", -1);
		response.addCookie(c);
		
		response.sendRedirect(location);
	} else if(id.equals("hong") && passwd.equals("1234")) {
		Cookie c = Cookies.createCookie("auth", id, "/", -1);
		response.addCookie(c);
		
		response.sendRedirect(location);
	} else if(id.equals("park") && passwd.equals("1234")) {
		Cookie c = Cookies.createCookie("auth", id, "/", -1);
		response.addCookie(c);
		
		response.sendRedirect(location);
	} else {
		location = "ex07_default.jsp?logon=fail";
		response.sendRedirect(location);
	}
%>