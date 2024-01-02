package com.poseidon.web;

import java.io.IOException;

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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
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
