package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import days04.board.persistence.BoardDAOImpl;

public class DeleteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> DeleteHandler.process...");
		String method = request.getMethod();
		if(method.equals("GET")) {
			return "/days06/board/delete.jsp";
			
		} else {
			request.setCharacterEncoding("UTF-8");
			
			int pseq = Integer.parseInt(request.getParameter("seq"));
			String pwd = request.getParameter("pwd");

			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);

			int rowCount = 0;
			String originalPwd;
			String location = null;
			try {
				originalPwd = dao.getOriginalPwd(pseq);
				if(originalPwd.equals(pwd)) {
					rowCount = dao.delete(pseq);
					location = "/jspPro/board/list.do?delete=success";
				} else {
					location = "/jspPro/board/view.do?seq=" + pseq + "&delete=fail";
				}
				
				
			} catch (SQLException e1) {
				System.out.println(">DeleteHandler.process Exception...");
				e1.printStackTrace();
			} finally {
				conn.close();
			}

			response.sendRedirect(location);
		}	
			
		return null;
	}

}
