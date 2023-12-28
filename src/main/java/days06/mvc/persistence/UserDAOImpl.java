package days06.mvc.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.ConnectionProvider;

import days06.mvc.domain.MemberInfo;

public class UserDAOImpl implements UserDAO {
	private Connection conn = null;

	public UserDAOImpl(Connection conn) {
		this.conn = conn;
	}

	@Override
	public int login(String id, String pwd) throws SQLException {
		String sql = "SELECT COUNT(*) cnt FROM member"
				+ " WHERE id=? AND passwd=?";

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		
		int userCheck = 0;

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			rs.next();
			userCheck = rs.getInt("cnt");
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

		return userCheck;
	}

	@Override
	public int addUser(MemberInfo mi) throws SQLException {
		String sql = "INSERT INTO member(id, passwd, name, email)"
				+ " VALUES(?,?,?,?)";

		PreparedStatement pstmt = null;
		
		int rowCount = 0;

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mi.getId());
			pstmt.setString(2, mi.getPasswd());
			pstmt.setString(3, mi.getName());
			pstmt.setString(4, mi.getEmail());
			rowCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return rowCount;
	}
	
}
