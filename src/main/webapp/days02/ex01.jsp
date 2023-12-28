<%@page import="domain.EmpVO"%>
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
	DeptVO dvo = null;
	ArrayList<DeptVO> dlist = null;
	
	try {
		pstmt = conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			dlist = new ArrayList<>();
			do {
				deptno = rs.getInt("deptno");
				dname = rs.getString("dname");
				loc = rs.getString("loc");
				
				dvo = new DeptVO(deptno, dname, loc);
				dlist.add(dvo);
			} while(rs.next());
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			rs.close();
			pstmt.close();
			// DBConn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
%>

<%
	String pDeptno = request.getParameter("deptno");
	if (pDeptno == null || pDeptno.equals(""))
		pDeptno = "10";
	
	deptno = Integer.parseInt(pDeptno);
	ArrayList<EmpVO> elist = null;
	EmpVO evo = null;


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
			elist = new ArrayList<>();
			do {
				empno = rs.getInt(1);
				ename = rs.getString(2);
				job = rs.getString(3);
				mgr = rs.getInt(4);
				hiredate = rs.getString(5);
				sal = rs.getDouble(6);
				comm = rs.getDouble(7);
				deptno = rs.getInt(8);
				evo = new EmpVO(empno, ename, job, mgr, hiredate, sal, comm, deptno);
				elist.add(evo);
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
		
		<select name="deptno" id="deptno">
		    <%
			    Iterator<DeptVO> ir = dlist.iterator();
				while(ir.hasNext()) {
					dvo = ir.next();
		    %>
		    <!-- data-loc="< %= dvo.getLoc() % >" -->
		    <option value="<%= dvo.getDeptno()%>"><%= dvo.getDname()%></option>
		    <%-- <option value="<%= deptVo.getDeptno() %>" <%= (paramDeptno == deptVo.getDeptno() ? "selected='selected'" : "") %> >
	         <%= deptVo.getDname() %>
	        </option> --%>
		    <%
				}
		    %>
		</select>
		<br>
		<br>
		
		<h2>emp list</h2>
		<table>
			<thead>
				<tr>
					<td><input type="checkbox" id="ckbAll" name="ckbAll" autocomplete="off" /></td>
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
					if(elist ==null) {
						
				%>
					<tr>
						<td colspan="9">사원 존재 X</td>
					</tr>
				<%
					} else {
						Iterator<EmpVO> eir = elist.iterator();
						while(eir.hasNext()) {
							evo = eir.next();
						%>
						<tr>
							<td><input type="checkbox" data-empno="<%= evo.getEmpno() %>"
							value="<%= evo.getEmpno() %>"/></td>
							<td><%= evo.getEmpno() %></td>
					        <td><%= evo.getEname() %></td>
					        <td><%= evo.getJob() %></td>
					        <td><%= evo.getMgr() %></td>
					        <td><%= evo.getHiredate() %></td>
					        <td><%= evo.getSal() %></td>
					        <td><%= evo.getComm() %></td>
					        <td><%= evo.getDeptno() %></td>
						</tr>
						<%
						}
					}
				%>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="9">
						<span class="badge left red">
						<%= elist==null ? 0 : elist.size() %>
						</span>
						명. 
						<a href="javascript:history.back()">뒤로가기</a>
						<button>선택한 empno 확인</button>
					</td>
				</tr>
			</tfoot>
		</table>
		
	</div>

	<script>
		$(function() {
			$("#deptno").change(function(event) {
				let deptno = $(this).val();
				let url = `http://localhost/jspPro/days02/ex01.jsp?deptno=\${deptno}`;
				location.href = url;
			})
			
			//
			// $("#deptno").val('${param.deptno}');
			$("#deptno").val(<%= pDeptno %>);
		})
	</script>

	<script>
		$("#ckbAll").on("click", function(event) {
			$("table tbody tr")
				.find("td:first-child :checkbox")
				.prop("checked", $(this).prop("checked"))
		})
		
		/* 
		
		$(":checkbox.all").click(function(event) {
		$(":checkbox:not(.all)").prop("checked", $(this).prop("checked"));

		})
		$(":checkbox:not(.all)").click(function(event) {
		 let count = $(":checkbox:not(.all)").length;
		 let checkedCount = $(":checkbox:not(.all):checked").length;
		 $(":checkbox.all").prop("checked", count == checkedCount ? true : false);
		}); 
		*/
		
		$("table tbody tr")
        .find("td:first-child :checkbox").on("click", function (){
           let ck = $("tbody :checkbox").length == $("tbody :checkbox:checked").length;
           $("#ckbAll").prop("checked", ck );
        });
		
		/* 풀이 1
		$("tfoot button").on("click", function(event) {
			let empnos = [];
			// 체크된 체크박스
			$("tbody :checkbox:checked").each(function(i, element) {
				let empno = $(element).data("empno");
				empnos.push(empno);
			})
			
			location.href = "ex01_ok.jsp?empnos=" + empnos.join("/")
		})
		*/
		
		// 풀이 2
		$("tfoot button").on("click", function(event) {
			let empnos = [];
			// 체크된 체크박스
			$("tbody :checkbox:checked").each(function(i, element) {
				let empno = $(element).data("empno");
				empnos.push(empno);
			})
			location.href = "ex01_ok_02.jsp?empno=" + empnos.join("&empno=");
		})
	</script>

</body>
</html>