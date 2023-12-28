package days03;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import domain.DeptEmpSalgradeVO;
import domain.SalgradeVO;

/**
 * Servlet implementation class SalGradeEmp
 */
@WebServlet("/days03/salgradeEmp.htm")
public class SalGradeEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public SalGradeEmp() {
        super();
      
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> SalGradeEmp.doGet()...");
		
		Connection conn = null;

		String sql = "SELECT grade, losal, hisal, COUNT(*) cnt "
				+ "FROM salgrade s JOIN emp e ON sal BETWEEN losal AND hisal "
				+ "GROUP BY grade, losal, hisal "
				+ "ORDER BY grade ";
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		SalgradeVO salVO = null;

		String sql2 = "SELECT d.deptno, dname, empno, ename, sal, grade "
				+ "FROM dept d RIGHT JOIN emp e ON d.deptno = e.deptno "
				+ "            JOIN salgrade s ON sal BETWEEN losal AND hisal "
				+ "WHERE grade = ? ";
		ResultSet rs2 = null;
		PreparedStatement pstmt2 = null;
		ArrayList<DeptEmpSalgradeVO> empList = null;
		DeptEmpSalgradeVO empVO = null;

		LinkedHashMap<SalgradeVO, ArrayList<DeptEmpSalgradeVO>> map = new LinkedHashMap<>();
		
		int deptno;
		String dname;
		int empno;
		String ename;
		double sal;
		int grade;
		
		try {
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();

			if ( rs.next() ) {
				do {					
					grade = rs.getInt(1);
					// Key
					salVO = new SalgradeVO(grade, rs.getInt(2), rs.getInt(3), rs.getInt(4));

					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setInt(1, grade);
					rs2 = pstmt2.executeQuery();

					if ( rs2.next() ) {
						empList = new ArrayList<>();
						do {	
							deptno = rs2.getInt(1);
							dname = rs2.getString(2);
							empno = rs2.getInt(3);
							ename = rs2.getString(4);
							sal = rs2.getDouble(5);
							
							empVO = new DeptEmpSalgradeVO(deptno, dname, empno, ename, sal, grade);
							// Value
							empList.add(empVO);
							
						} while ( rs2.next() );
						
						map.put(salVO, empList);

						rs2.close();
						pstmt2.close();
						
					} //if
				} while ( rs.next() );
		
			} //if

			System.out.println(" end ");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();  		// close 순서 : rs - pstmt - conn
				pstmt.close();
				DBConn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}  	
		}
		
			
//			key			value			= entry
// 1. LinkedHashMap<SalgradeVO, ArrayList<DeptEmpSalgradeVO>>
			request.setAttribute("map", map);
			//2. 포워딩 
			
			 String path ="/days03/ex04_salgradeemp.jsp";
			 RequestDispatcher dispatcher =request.getRequestDispatcher(path);
			 dispatcher.forward(request, response);
		} // main



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
