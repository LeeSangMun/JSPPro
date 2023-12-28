package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import days06.mvc.persistence.UserDAO;
import days06.mvc.persistence.UserDAOImpl;

public class LogonHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> LogonHandler.process...");
		String method = request.getMethod();
		if (method.equals("GET")) {
			return "/days06/ex01_default.jsp";

		} else {
			request.setCharacterEncoding("UTF-8");

			String id = request.getParameter("id");
			String pwd = request.getParameter("passwd");

			Connection conn = ConnectionProvider.getConnection();
			UserDAO userDAO = new UserDAOImpl(conn);

			int loginCheck = 0;
			try {
				loginCheck = userDAO.login(id, pwd);
			} catch (SQLException e1) {
				System.out.println(">LogonHandler.dopost Exception...");
				e1.printStackTrace();
			}

			conn.close();

			String location = "";
			if (loginCheck == 1) {
				request.getSession().setAttribute("id", id);
				location = "/jspPro/board/list.do?login=" + "success";
			} else {
				location = "/jspPro/board/logon.do?login=" + "fail";
			}
			response.sendRedirect(location);
		}

		return null;
	}
}
