package days06.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

public class ViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pseq = Integer.parseInt(request.getParameter("seq"));
		// 1. seq 조회수 1증가
		// 2. seq -> BoardDTO

		Connection conn = ConnectionProvider.getConnection();
		BoardDAOImpl dao = new BoardDAOImpl(conn);

		BoardDTO dto = null;

		try {
			dao.increaseReaded(pseq);
			dto = dao.view(pseq);
		} catch (SQLException e1) {
			System.out.println(">View.doGet() Exception...");
			e1.printStackTrace();
		}

		conn.close();

		// 1.포워딩 전에 데이터 저장
		request.setAttribute("dto", dto);
		
		
		return "/days06/board/view.jsp";
	}

}
