package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

public class EditHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> EditHandler.process...");
		String method = request.getMethod();
		if(method.equals("GET")) {
			int pseq = Integer.parseInt(request.getParameter("seq"));
			
			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);

			BoardDTO dto = null;

			try {
				dto = dao.view(pseq);
			} catch (SQLException e1) {
				System.out.println(">Edit.doGet() Exception...");
				e1.printStackTrace();
			}

			conn.close();

			// 1.포워딩 전에 데이터 저장
			request.setAttribute("dto", dto);
			
			// 2. 포워딩.
			String path = "/days06/board/edit.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
			
		} else {
			request.setCharacterEncoding("UTF-8");
			
			int pseq = Integer.parseInt(request.getParameter("seq"));

			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			int tag = Integer.parseInt(request.getParameter("tag"));

			BoardDTO dto = new BoardDTO(pseq, null, pwd, email, title, null, 0, tag, content);

			Connection conn = ConnectionProvider.getConnection();
			BoardDAOImpl dao = new BoardDAOImpl(conn);

			int rowCount = 0;
			try {
				rowCount = dao.update(dto);
			} catch (SQLException e1) {
				System.out.println(">EditHandler.process Exception...");
				e1.printStackTrace();
			}

			conn.close();

			// 포워딩 x
			// 리다이렉트 o
			String location = "/jspPro/board/view.do?seq=" + pseq;
			location += rowCount == 1 ? "&edit=success" : "&edit=fail";
			response.sendRedirect(location);
		}
		
		return null;
	}

}
