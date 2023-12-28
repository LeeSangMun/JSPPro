package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;
import days06.mvc.domain.MemberInfo;
import days06.mvc.persistence.UserDAO;
import days06.mvc.persistence.UserDAOImpl;

public class AddUserHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> AddUserHandler.process...");
		String method = request.getMethod();
		if(method.equals("GET")) {
			return "/days05/ex05_02.jsp";
		} else {
			request.setCharacterEncoding("UTF-8");
			
			String id = request.getParameter("id");
			String pwd = request.getParameter("passwd");
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			
			MemberInfo mi = new MemberInfo(id, pwd, email, null, name);
			
			Connection conn = ConnectionProvider.getConnection();
			UserDAO userDAO = new UserDAOImpl(conn);
			
			int rowCount = 0;
			try {
				rowCount = userDAO.addUser(mi);
				
			} catch (SQLException e1) {
				System.out.println(">edit.dopost Exception...");
				e1.printStackTrace();
			}

			conn.close();

			String location = "";
			if(rowCount == 1) {
				location = "/jspPro/board/list.do?logsuccess=" + "logsuccess";
			} else {
				location = "/jspPro/board/addUser.do?logsuccess=" + "fail";
			}
			response.sendRedirect(location);
		}
		
		return null;
	}

}
