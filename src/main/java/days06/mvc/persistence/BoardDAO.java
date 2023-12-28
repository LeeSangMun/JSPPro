package days06.mvc.persistence;

import java.sql.SQLException;
import java.util.ArrayList;

import days06.mvc.domain.BoardDTO;



public interface BoardDAO {
	
	// 1. 게시글 목록 조회 + 페이징 처리 X
	ArrayList<BoardDTO> select() throws SQLException;
	// 9. 
	ArrayList<BoardDTO> select(int currentPage, int numberPerPage) throws SQLException;
	
	// 2. 게시글 쓰기 
	int insert(BoardDTO dto) throws SQLException;

	// 3. 조회수 증가
	void increaseReaded(int seq) throws SQLException;

	// 4. 게시글 상세 보기
	BoardDTO view(int seq) throws SQLException;

	// 5. 게시글 삭제
	int delete(int seq) throws SQLException;
	
	// 6. 게시글 수정
	int update(BoardDTO dto) throws SQLException;

	// 7. 게시글 검색
	ArrayList<BoardDTO> search(int searchCondition, String searchWord) throws SQLException;
	//7_2. 게시글 검색 + 페이징 처리 
	ArrayList<BoardDTO> search(int currentPage, int numberPerPage, int searchCondition, String searchWord)throws SQLException;
	
	// 8-1. 총 레코드 수
	int getTotalRecords()  throws SQLException;
	
	// 8-2. 총 페이지 수
	int getTotalPages(int numberPerPage)  throws SQLException;
	
	int getTotalPages(int numberPerPage, int searchCondition, String searchWord)throws SQLException;
	
	// 9
	String getOriginalPwd(int seq) throws SQLException;
} // class









