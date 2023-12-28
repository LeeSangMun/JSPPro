package days02;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import domain.EmpVO;

@WebServlet("/scott/emp")
public class ScottEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
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
		
		request.setAttribute("list", list);
		
		// String path = "/days02/ex13_emp.jsp";
		String path = "/days02/ex13_emp_jstl.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
