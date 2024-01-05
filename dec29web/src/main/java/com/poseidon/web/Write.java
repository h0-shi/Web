package com.poseidon.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poseidon.dao.BoardDAO;

@WebServlet("/write")
public class Write extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Write() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("서블릿 통과");
//		response.sendRedirect("write.jsp");
		RequestDispatcher rd = request.getRequestDispatcher("write.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		java.lang.IllegalStateException: 응답이 이미 커밋된 후에는, sendRedirect()를 호출할 수 없습니다.
//		response를 이미 보냈는데 한번 더 보내려고 시도하면 발생하는 오류. doGet 구문을 지우니 정삭 작동한다!
//		doGet(request, response);
		
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		/*
		1. DAO 호출
		2. write(title, content);
		*/
		BoardDAO dao = new BoardDAO();
		int result = dao.write(title, content);

		if (result == 1) {
//			페이지 이동
			response.sendRedirect("./index.jsp");
		} else {
			response.sendRedirect("./error.jsp");
		}
		
		//지금은 해당하지 않지만 나가는 파일도 UTF-8로 할거면
//		response.setCharacterEncoding("text/html; charset=UTF-8");
		
	}
	
	

}
