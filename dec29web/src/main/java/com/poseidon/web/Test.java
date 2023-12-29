package com.poseidon.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Test
 */
@WebServlet("/test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Test() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.getWriter().append("Served at: ").append(request.getContextPath());
		String str = "박시호";
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>타이틀입니다.</title>");
//		pw.println("<style type=\"text/css\">");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>서블릿이 호출되었습니다.</h1>");
		pw.println("<img src=\"\">");
		pw.println("당신의 이름은 : "+str+"<br>");
		pw.println("이렇게 작업하기 너무 힘들어요<br>");
		pw.println("수정하려면 다 다시 작성하라고?<br>");
		pw.println("컴파일도 다시 해야해?!?!?!<br>");
		pw.println("JSP가 오지게 편하구나...<br>");
		pw.println("<a href=\"./main.jsp\">main<a>");
		pw.println("</body>");
		pw.println("<html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
