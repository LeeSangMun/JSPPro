package days04.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

// @WebServlet("/cstvsboard/write.htm")
public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// list.jsp 글쓰기 클릭
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = (String)request.getSession().getAttribute("id");
		
		// 2. 포워딩.
		String path = "/days04/board/write.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}

	// write.jsp 작성완료 클릭
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String writer = request.getParameter("writer");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int tag = Integer.parseInt(request.getParameter("tag"));

		BoardDTO dto = new BoardDTO(0, writer, pwd, email, title, null, 0, tag, content);

		Connection conn = DBConn.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);

		int rowCount = 0;
		try {
			rowCount = dao.insert(dto);
		} catch (SQLException e1) {
			System.out.println(">write.dopost Exception...");
			e1.printStackTrace();
		}

		DBConn.close();
		
		System.out.println("Write.java - " + request.getRemoteAddr());

		// 포워딩 x
		// 리다이렉트 o
		String location = "/jspPro/cstvsboard/list.htm";
		location += rowCount == 1 ? "?write=success" : "? write=fail";
		response.sendRedirect(location);

	}

}
