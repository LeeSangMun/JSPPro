<%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="domain.DeptVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// Scott.Dept 테이블 - CRUD
	// [dept 테이블 조회]
	String className = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "scott";
	String password = "tiger";
	Connection conn = DBConn.getConnection(url, user, password);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "SELECT deptno, dname, loc FROM dept";
	
	int deptno = 0;
	String dname = null;
	String loc = null;
	DeptVO vo = null;
	ArrayList<DeptVO> list = null;
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			list = new ArrayList<>();
			do {
				deptno = rs.getInt("deptno");
				dname = rs.getString("dname");
				loc = rs.getString("loc");
				
				vo = new DeptVO(deptno, dname, loc);
				list.add(vo);
			} while(rs.next());
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			rs.close();
			pstmt.close();
			DBConn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	System.out.println("end");
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
			
		</pre>
		
		<select name="deptno" id="deptno">
			<option>선택하세요.</option> 
			
		    <!-- <option value="10">ACCOUNTING</option>
		    <option value="20">RESEARCH</option>
		    <option value="30">SALES</option>
		    <option value="40">OPERATIONS</option> -->
		    <%
			    Iterator<DeptVO> ir = list.iterator();
				while(ir.hasNext()) {
					vo = ir.next();
		    %>
		    <option value="<%= vo.getDeptno()%>"><%= vo.getDname()%></option>
		    <%
				}
		    %>
		</select>
		
	</div>
	
	<script>
		$("#deptno").change(function(evevt) {
			let deptno = $(this).val(); // 10, 20, 30, 40
			location.href = ``
		})
	</script>

</body>
</html>