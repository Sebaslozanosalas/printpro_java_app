package com.printpro_app.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.printpro_app.dao.UserDAO;
import com.printpro_app.model.User;

@WebServlet("/test")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public TestController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Crea variables extrayendo los datos del request
		String userName = request.getParameter("user");
	    String password = request.getParameter("password");
	    
	    
	    response.sendRedirect("index.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
