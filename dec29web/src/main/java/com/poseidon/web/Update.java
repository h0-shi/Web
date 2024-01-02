package com.poseidon.web;

import java.io.IOException;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poseidon.dao.BoardDAO;

@WebServlet("/update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Update() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//		dao 호출
		BoardDAO dao = new BoardDAO();
//		날아오는 번호 잡기 ./update?no=10
		String no = request.getParameter("no");
//		db에 질의해서 레코드 1개 가져오기
		Map<String, Object> detail = dao.detail(no);
//		update.jsp에게 돌려주기
//		System.out.println(detail);
		
//		update.js에 값 보내기
		request.setAttribute("detail", detail);	//변수명, 값
		
//		jsp 호출 - 페이지 전환 할 때 쓰는 코드
		RequestDispatcher rd = request.getRequestDispatcher("update.jsp");
//		값을 붙여서 보낸다는거지.
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String no = request.getParameter("no");
		String content = request.getParameter("content");
			
		BoardDAO dao = new BoardDAO();
		int result = dao.update(no, title, content);

		if (result == 1) {
//			페이지 이동
			response.sendRedirect("./detail.jsp?no="+no);
		} else {
			response.sendRedirect("./error.jsp");
		}
	}
	

	
}
