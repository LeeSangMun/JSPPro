<%@page import="java.util.Iterator"%>
<%@page import="java.sql.SQLException"%>
<%@page import="domain.EmpVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%
// http://localhost/jspPro/days01/ex06_emp.jsp
	// ?
	// deptno=20
	Connection conn = DBConn.getConnection();

	String pDeptno = request.getParameter("deptno");
	if (pDeptno == null || pDeptno.equals(""))
		pDeptno = "10";
	
	int deptno = Integer.parseInt(pDeptno);

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<EmpVO> list = null;
	EmpVO vo = null;


	String sql = "SELECT empno, ename, job, mgr, to_char(hiredate, 'yyyy-MM-dd'), sal, comm, deptno  " 
			+ " FROM emp " 
			+ " WHERE deptno = ?";

	int empno = 0;
	String ename = "";
	String job = "";
	int mgr = 0;
	String hiredate = null;
	double sal = 0;
	double comm = 0;

	try {
		//			stmt = conn.createStatement();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, deptno);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			list = new ArrayList<>();
			do {
				empno = rs.getInt(1);
				ename = rs.getString(2);
				job = rs.getString(3);
				mgr = rs.getInt(4);
				hiredate = rs.getString(5);
				sal = rs.getDouble(6);
				comm = rs.getDouble(7);
				deptno = rs.getInt(8);
				vo = new EmpVO(empno, ename, job, mgr, hiredate, sal, comm, deptno);
				list.add(vo);
			} while (rs.next());
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
		
		<h2>emp list</h2>
		<table>
			<thead>
				<tr>
					<td>empno</td>
			        <td>ename</td>
			        <td>job</td>
			        <td>mgr</td>
			        <td>hiredate</td>
			        <td>sal</td>
			        <td>comm</td>
			        <td>deptno</td>
				</tr>
			</thead>
			<tbody>
				<%
					if(list ==null) {
						
				%>
					<tr>
						<td colspan="8">사원 존재 X</td>
					</tr>
				<%
					} else {
						Iterator<EmpVO> ir = list.iterator();
						while(ir.hasNext()) {
							vo = ir.next();
						%>
						<tr>
							<td><%= vo.getEmpno() %></td>
					        <td><%= vo.getEname() %></td>
					        <td><%= vo.getJob() %></td>
					        <td><%= vo.getMgr() %></td>
					        <td><%= vo.getHiredate() %></td>
					        <td><%= vo.getSal() %></td>
					        <td><%= vo.getComm() %></td>
					        <td><%= vo.getDeptno() %></td>
						</tr>
						<%
						}
					}
				%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="8">
						<%= list==null ? 0 : list.size() %>명. <a href="javascript:history.back()">뒤로가기</a>
					</td>
				</tr>
			</tfoot>
		</table>
		
	</div>

</body>
</html>