package days06.mvc.persistence;

import java.sql.SQLException;

import days06.mvc.domain.MemberInfo;

public interface UserDAO {
	int login(String id, String pwd) throws SQLException;
	int addUser(MemberInfo mi) throws SQLException;
	
}
