<%@page import="domain.EmpVO"%>
<%@page import="domain.DeptVO"%>
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
	DeptVO deptVO = null;
	ArrayList<DeptVO> deptList = null;
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			deptList = new ArrayList<>();
			do {
				deptno = rs.getInt("deptno");
				dname = rs.getString("dname");
				loc = rs.getString("loc");
				
				deptVO = new DeptVO(deptno, dname, loc);
				deptList.add(deptVO);
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

<%
// http://localhost/jspPro/days01/ex06_emp.jsp
	// ?
	// deptno=20
	conn = DBConn.getConnection();

	String pDeptno = request.getParameter("deptno");
	if (pDeptno == null || pDeptno.equals(""))
		pDeptno = "10";
	
	deptno = Integer.parseInt(pDeptno);

	ArrayList<EmpVO> empList = null;
	EmpVO empVO = null;


	sql = "SELECT empno, ename, job, mgr, to_char(hiredate, 'yyyy-MM-dd'), sal, comm, deptno  " 
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
			empList = new ArrayList<>();
			do {
				empno = rs.getInt(1);
				ename = rs.getString(2);
				job = rs.getString(3);
				mgr = rs.getInt(4);
				hiredate = rs.getString(5);
				sal = rs.getDouble(6);
				comm = rs.getDouble(7);
				deptno = rs.getInt(8);
				empVO = new EmpVO(empno, ename, job, mgr, hiredate, sal, comm, deptno);
				empList.add(empVO);
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<select name="deptno" id="deptno">
		<%
			    Iterator<DeptVO> ir = deptList.iterator();
				while(ir.hasNext()) {
					deptVO = ir.next();
		    %>
		    <option value="<%= deptVO.getDeptno()%>"><%= deptVO.getDname()%></option>
		    <%
				}
		    %>
	</select>
	
	<table border="1px solid">
			<thead>
				<tr>
					<td><input type="checkbox" class="all" />전체 선택</td>
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
					if(empList ==null) {
						
				%>
					<tr>
					<td></td>
						<td colspan="8">사원 존재 X</td>
					</tr>
				<%
					} else {
						Iterator<EmpVO> empIr = empList.iterator();
						while(empIr.hasNext()) {
							empVO = empIr.next();
						%>
						<tr>
							<td><input type="checkbox" /></td>
							<td><%= empVO.getEmpno() %></td>
					        <td><%= empVO.getEname() %></td>
					        <td><%= empVO.getJob() %></td>
					        <td><%= empVO.getMgr() %></td>
					        <td><%= empVO.getHiredate() %></td>
					        <td><%= empVO.getSal() %></td>
					        <td><%= empVO.getComm() %></td>
					        <td><%= empVO.getDeptno() %></td>
						</tr>
						<%
						}
					}
				%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="9" style="text-align: center;">
						<button>확인</button>
					</td>
				</tr>
			</tfoot>
		</table>
		
		
		<script>
			$(function() {
				$("#deptno").change(function() {
					let deptno = $(this).val();
					location.href = `/jspPro/days01/test01.jsp?deptno=\${deptno}`;
				})
				
				$("button").click(function() {
					let empno = "";
					$(":checkbox:not(.all):checked").each(function() {
						empno += $(this).parent().next().text() + " ";
					})
					location.href = `/jspPro/days01/test02.jsp?empno=\${empno}`;
				})
				
				$(":checkbox.all").click(function() {
					$(":checkbox:not(.all)").prop("checked", $(this).prop("checked"))
				})
				
				$(":checkbox:not(.all)").click(function() {
					let allchk = $(":checkbox:not(.all)").length;
					let chks = $(":checkbox:not(.all):checked").length
					if(allchk == chks) {
						$(":checkbox.all").prop("checked", true);
					} else {
						$(":checkbox.all").prop("checked", false);
					}
				})
			})
			
			
		</script>
</body>
</html>