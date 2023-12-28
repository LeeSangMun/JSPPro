package days04.board.persistence;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import days04.board.domain.BoardDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
@AllArgsConstructor
public class BoardDAOImpl implements BoardDAO {

	private Connection conn = null;
	// private PreparedStatement pstmt = null;

	@Override
	public ArrayList<BoardDTO> select(int currentPage, int numberPerPage) throws SQLException {
		// currentPage 1/2/3, numberPerPage 10
		int begin = (currentPage - 1) * numberPerPage + 1;
		int end = begin + numberPerPage - 1;

		String sql = "SELECT * " + "FROM ( " + "        SELECT ROWNUM no, t.* " + "        FROM ( "
				+ "                SELECT seq,  writer, email, title, readed , writedate  "
				+ "                FROM tbl_cstvsboard " + "                ORDER BY seq DESC " + "        ) t  "
				+ ")  b      " + "WHERE b.no BETWEEN ? AND ?";

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<BoardDTO> list = null;
		BoardDTO vo = null;

		int seq;
		String writer;
		String email;
		String title;
		Date writedate;
		int readed;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, begin);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<>();
				do {

					seq = rs.getInt("seq");
					title = rs.getString("title");
					writer = rs.getString("writer");
					email = rs.getString("email");
					writedate = rs.getDate("writedate");
					readed = rs.getInt("readed");

					vo = BoardDTO.builder().seq(seq).title(title).writer(writer).email(email).writedate(writedate)
							.readed(readed).build();

					list.add(vo);
				} while (rs.next());

			} // if

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	@Override
	public ArrayList<BoardDTO> select() throws SQLException {
		String sql = "SELECT seq, title, writer, email, writedate, readed   " + "FROM tbl_cstvsboard "
				+ "ORDER BY seq DESC";

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<BoardDTO> list = null;
		BoardDTO vo = null;

		int seq;
		String writer;
		String email;
		String title;
		Date writedate;
		int readed;

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<>();
				do {

					seq = rs.getInt("seq");
					title = rs.getString("title");
					writer = rs.getString("writer");
					email = rs.getString("email");
					writedate = rs.getDate("writedate");
					readed = rs.getInt("readed");

					vo = BoardDTO.builder().seq(seq).title(title).writer(writer).email(email).writedate(writedate)
							.readed(readed).build();

					list.add(vo);
				} while (rs.next());

			} // if

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	@Override
	public int insert(BoardDTO dto) throws SQLException {
		int rowCount = 0;
		String sql = "INSERT INTO tbl_cstvsboard" + " ( seq, writer, pwd, email, title, tag, content ) "
				+ " VALUES ( seq_tbl_cstvsboard.nextval, ?,?,?,?,?,? )";

		PreparedStatement pstmt = null;

		pstmt = this.conn.prepareStatement(sql);
		pstmt.setString(1, dto.getWriter());
		pstmt.setString(2, dto.getPwd());
		pstmt.setString(3, dto.getEmail());
		pstmt.setString(4, dto.getTitle());
		pstmt.setInt(5, dto.getTag());
		pstmt.setString(6, dto.getContent());
		rowCount = pstmt.executeUpdate();

		pstmt.close();

		return rowCount;

	}

	@Override
	public void increaseReaded(int seq) throws SQLException {
		String sql = "UPDATE tbl_cstvsboard " + " SET readed = readed + 1 " + " WHERE seq = ? ";
		PreparedStatement pstmt = null;
		pstmt = this.conn.prepareStatement(sql);
		pstmt.setInt(1, seq);
		int rowCount = pstmt.executeUpdate();
		pstmt.close();
	}

	@Override
	public BoardDTO view(int seq) throws SQLException {
		String sql = "SELECT seq, writer, email, title, readed, writedate, content " + " FROM tbl_cstvsboard "
				+ " WHERE seq = ? ";
		BoardDTO dto = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		pstmt = this.conn.prepareStatement(sql);
		pstmt.setInt(1, seq);

		rs = pstmt.executeQuery();

		if (rs.next()) {
			dto = BoardDTO.builder().seq(seq).writer(rs.getString("writer")).email(rs.getString("email"))
					.title(rs.getString("title")).readed(rs.getInt("readed")).writedate(rs.getDate("writedate"))
					.content(rs.getString("content")).build();
		} // if

		rs.close();
		pstmt.close();

		return dto; // null
	}

	@Override
	public int delete(int seq) throws SQLException {
		int rowCount = 0;
		String sql = "DELETE FROM tbl_cstvsboard " + " WHERE seq = ?";
		PreparedStatement pstmt = null;
		pstmt = this.conn.prepareStatement(sql);
		pstmt.setInt(1, seq);
		rowCount = pstmt.executeUpdate();
		pstmt.close();
		return rowCount;
	}

	@Override
	public int update(BoardDTO dto) throws SQLException {
		int rowCount = 0;

		String sql = "UPDATE tbl_cstvsboard " + " SET email = ?, title = ?, content = ? "
				+ " WHERE seq = ? AND pwd = ?";
		PreparedStatement pstmt = this.conn.prepareStatement(sql);
		pstmt.setString(1, dto.getEmail());
		pstmt.setString(2, dto.getTitle());
		pstmt.setString(3, dto.getContent());
		pstmt.setInt(4, dto.getSeq());
		pstmt.setString(5, dto.getPwd());

		rowCount = pstmt.executeUpdate();

		pstmt.close();
		return rowCount;
	}

	@Override
	public ArrayList<BoardDTO> search(int searchCondition, String searchWord) throws SQLException {
		// select() 복사+붙이기
		String sql = "SELECT seq, title, writer, email, writedate, readed   " + " FROM tbl_cstvsboard ";
		// 검색 조건, 검색어 => WHERE 조건절..
		switch (searchCondition) {
		case 1: // 제목
			sql += " WHERE REGEXP_LIKE( title, ?, 'i') ";
			break;
		case 2: // 내용
			sql += " WHERE REGEXP_LIKE( content, ?, 'i') ";
			break;
		case 3: // 작성자
			sql += " WHERE REGEXP_LIKE( writer, ?, 'i') ";
			break;
		case 4: // 제목 + 내용
			sql += " WHERE REGEXP_LIKE( title, ?, 'i') OR  REGEXP_LIKE( content, ?, 'i') ";
			break;
		} // switch

		sql += "ORDER BY seq DESC";

		System.out.println(sql);

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<BoardDTO> list = null;
		BoardDTO vo = null;

		int seq;
		String writer;
		String email;
		String title;
		Date writedate;
		int readed;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchWord);
			if (searchCondition == 4) {
				pstmt.setString(2, searchWord);
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<>();
				do {

					seq = rs.getInt("seq");
					title = rs.getString("title");
					writer = rs.getString("writer");
					email = rs.getString("email");
					writedate = rs.getDate("writedate");
					readed = rs.getInt("readed");

					vo = BoardDTO.builder().seq(seq).title(title).writer(writer).email(email).writedate(writedate)
							.readed(readed).build();

					list.add(vo);
				} while (rs.next());

			} // if

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	@Override
	public ArrayList<BoardDTO> search(int currentPage, int numberPerPage, int searchCondition, String searchWord)
			throws SQLException {

		int begin = (currentPage - 1) * numberPerPage + 1;
		int end = begin + numberPerPage - 1;

		String sql = "SELECT * " + "FROM ( " + "        SELECT ROWNUM no, t.* " + "        FROM ( "
				+ "                SELECT seq,  writer, email, title, readed , writedate  "
				+ "                FROM tbl_cstvsboard ";

		// 검색조건
		// 검색 조건, 검색어 => WHERE 조건절..
		switch (searchCondition) {
		case 1: // 제목
			sql += " WHERE REGEXP_LIKE( title, ?, 'i') ";
			break;
		case 2: // 내용
			sql += " WHERE REGEXP_LIKE( content, ?, 'i') ";
			break;
		case 3: // 작성자
			sql += " WHERE REGEXP_LIKE( writer, ?, 'i') ";
			break;
		case 4: // 제목 + 내용
			sql += " WHERE REGEXP_LIKE( title, ?, 'i') OR  REGEXP_LIKE( content, ?, 'i') ";
			break;
		} // switch
		sql += "                           ORDER BY seq DESC " + "        ) t  " + ")  b      "
				+ "WHERE b.no BETWEEN ? AND ?";

		System.out.println(sql);

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<BoardDTO> list = null;
		BoardDTO vo = null;

		int seq;
		String writer;
		String email;
		String title;
		Date writedate;
		int readed;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, searchWord);
			if (searchCondition == 4) {
				pstmt.setString(2, searchWord);
				pstmt.setInt(3, begin);
				pstmt.setInt(4, end);
			} else {
				pstmt.setInt(2, begin);
				pstmt.setInt(3, end);
			}

			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<>();
				do {

					seq = rs.getInt("seq");
					title = rs.getString("title");
					writer = rs.getString("writer");
					email = rs.getString("email");
					writedate = rs.getDate("writedate");
					readed = rs.getInt("readed");

					vo = BoardDTO.builder().seq(seq).title(title).writer(writer).email(email).writedate(writedate)
							.readed(readed).build();

					list.add(vo);
				} while (rs.next());

			} // if

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

	@Override
	public int getTotalRecords() throws SQLException {
		int totalRecords = 0;

		String sql = "SELECT COUNT(*) " + " FROM tbl_cstvsboard ";
		PreparedStatement pstmt = null;
		pstmt = this.conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
			totalRecords = rs.getInt(1);

		rs.close();
		pstmt.close();

		return totalRecords;
	}

	@Override
	public int getTotalPages(int numberPerPage) throws SQLException {
		// 4:05 수업 시작
		int totalPages = 0;

		String sql = "SELECT CEIL( COUNT(*)/? ) " + " FROM tbl_cstvsboard ";
		PreparedStatement pstmt = null;
		pstmt = this.conn.prepareStatement(sql);
		pstmt.setInt(1, numberPerPage);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next())
			totalPages = rs.getInt(1);

		rs.close();
		pstmt.close();

		return totalPages;
	}

	@Override
	public int getTotalPages(int numberPerPage, int searchCondition, String searchWord) throws SQLException {

		int totalPages = 0;

		String sql = "SELECT CEIL( COUNT(*)/? ) " + " FROM tbl_cstvsboard ";
		// where 조건절 추가.
		switch (searchCondition) {
		case 1: // 제목
			sql += " WHERE REGEXP_LIKE( title, ?, 'i') ";
			break;
		case 2: // 내용
			sql += " WHERE REGEXP_LIKE( content, ?, 'i') ";
			break;
		case 3: // 작성자
			sql += " WHERE REGEXP_LIKE( writer, ?, 'i') ";
			break;
		case 4: // 제목 + 내용
			sql += " WHERE REGEXP_LIKE( title, ?, 'i') OR  REGEXP_LIKE( content, ?, 'i') ";
			break;
		} // switch

		PreparedStatement pstmt = null;
		pstmt = this.conn.prepareStatement(sql);
		pstmt.setInt(1, numberPerPage);
		pstmt.setString(2, searchWord);
		if (searchCondition == 4)
			pstmt.setString(3, searchWord);

		ResultSet rs = pstmt.executeQuery();

		if (rs.next())
			totalPages = rs.getInt(1);

		rs.close();
		pstmt.close();

		return totalPages;
	}

	@Override
	public String getOriginalPwd(int seq) throws SQLException {
		String originalPwd = null;

		PreparedStatement pstmt = null;

		String sql = "SELECT pwd " 
				+ " FROM tbl_cstvsboard " 
				+ " WHERE seq =  ? ";

		pstmt = this.conn.prepareStatement(sql);
		pstmt.setInt(1, seq);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			originalPwd = rs.getString("pwd");
		}
		pstmt.close();
		rs.close();
		return originalPwd;
	}

}
