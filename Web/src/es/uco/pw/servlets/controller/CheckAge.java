package es.uco.pw.servlets.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckAge
 */

public class CheckAge extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CheckAge() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("De la vista me llega: " + request.getParameter("age"));
		
		String age = request.getParameter("age");
		
		
		if(Integer.parseInt(age) >= 18)
		{
			RequestDispatcher rd = request.getRequestDispatcher("Login");
			rd.forward(request, response);
		}
		else
		{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("Lo sentimos eres menor de edad, la edad mínima es 18");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}

