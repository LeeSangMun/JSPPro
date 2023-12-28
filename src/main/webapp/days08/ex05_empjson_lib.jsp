<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.util.JdbcUtil"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select empno, ename, sal " 
					+ " from emp " 
					+ " order by sal desc";
	
	JSONObject jsonData = new JSONObject();
	
	try {
		con = ConnectionProvider.getConnection();
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		JSONArray jsonEmpArr = new JSONArray();
	
		// {"empno":7839,"ename":"KING"},
		while (rs.next()) {
			int empno = rs.getInt("empno");
			String ename = rs.getString("ename");
			JSONObject emp = new JSONObject();
			emp.put("empno", empno);
			emp.put("ename", ename);
			jsonEmpArr.add(emp);
		} // while 
			
		jsonData.put("emp", jsonEmpArr);
	
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		JdbcUtil.close(rs);
		JdbcUtil.close(pstmt);
		JdbcUtil.close(con);
	} // try
%>
<%=jsonData%>