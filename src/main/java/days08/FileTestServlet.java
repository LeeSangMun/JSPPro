package days08;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

@WebServlet("*.ss")
public class FileTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		
		Connection conn = null;
		String saveDirectory = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			FileTestDAO dao = FileTestDAO.getInstance();
				
			saveDirectory = request.getRealPath("/days08/upload");
			System.out.println(saveDirectory);

			if (uri.indexOf("list.ss") != -1) { // 자료실 목록
				ArrayList<FileTestDTO> list = dao.selectFileList(conn);
				request.setAttribute("list", list);
				String path = "/days08/ex11_list.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
				
			} else if (uri.indexOf("write.ss") != -1) { // 자료실 쓰기 + 폼
				String path = "/days08/ex11_write.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
				
			} else if (uri.indexOf("write_ok.ss") != -1) { // 자료실 쓰기 + 저장
				// ㄴ.
				
				File f = new File(saveDirectory);
				if(!f.exists()) {
					f.mkdirs();
				}
				// ㄷ.
				int maxPostSize = 5 * 1024 * 1024; // 기본 단위 바이트
				
				// ㄹ.
				String encoding = "UTF-8";
				
				// ㅁ.
				FileRenamePolicy policy = new DefaultFileRenamePolicy();
				
				MultipartRequest multiRequest = new MultipartRequest(
						request
						, saveDirectory
						, maxPostSize
						, encoding
						, policy
						);
				
				FileTestDTO dto = new FileTestDTO();
				// 벌써 파일 업로드 
				String subject = multiRequest.getParameter("subject");
				dto.setSubject(subject);
				
				// 첨부 파일 유무
				File attachFile = multiRequest.getFile("attachFile");
				if(attachFile != null) { // 첨부된 파일이 있다.
					String fileName = attachFile.getName();
					long filelength = attachFile.length();
					// 실제 저장 파일명
					String originalFileName = multiRequest.getOriginalFileName("attachFile");
					String filesystemName = multiRequest.getFilesystemName("attachFile");
					dto.setFilelength(filelength);
					dto.setOriginalfilename(originalFileName);
					dto.setFilesystemname(filesystemName);
				}
				
				int rowCount = dao.insert(conn, dto);	
				response.sendRedirect("list.ss");
				
			} else if (uri.indexOf("delete.ss") != -1) { // 삭제
				int num = Integer.parseInt(request.getParameter("num"));
				String filesystemname = request.getParameter("filesystemname");
				int rowCount = dao.delete(conn, num);
				// upload 폴더에 실제 파일 삭제
				String pathname = String.format("%s\\%s", saveDirectory, filesystemname);
				File deleteFile = new File(pathname);
				
				if(deleteFile.exists()) {
					deleteFile.delete();
				}
				
				// 목록 페이지 이동
				response.sendRedirect("/jspPro/days08/list.ss");
				
			} else if (uri.indexOf("update.ss") != -1) { // 수정 + 폼
				// ?num=2&filesystemname=파일명.확장자
				int num = Integer.parseInt(request.getParameter("num"));
				FileTestDTO dto = dao.selectOne(conn, num);
				request.setAttribute("dto", dto);
				
				String path = "/days08/ex11_update.jsp";
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);
				
			} else if (uri.indexOf("update_ok.ss") != -1) { // 수정 + 저장
				
				
			} // if

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
