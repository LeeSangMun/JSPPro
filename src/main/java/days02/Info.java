package days02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// @WebServlet("/days02/info.htm")
public class Info extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Info() {
        super();
    }

    // get 요청
    // info.htm?name???
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.append("GET 방식 요청<br>")
			.append("> 이름 : " + name + "<br>")
			.append("> 나이 : " + age + "<br>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doGet(request, response);
		
		// 			서블릿
		// 브라우저 -> post/get 요청
		// 홍길동
		// 20		utf-8 인코딩
		// 		  -> ISO-8859-1 인코딩. UTF-8 인코딩
		//
		request.setCharacterEncoding("utf-8"); // 파라미터 값이 깨질 수 있다.
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		
		PrintWriter out = response.getWriter();
		out.append("POST 방식 요청<br>")
			.append("> 이름 : " + name + "<br>")
			.append("> 나이 : " + age + "<br>");
	}

}
