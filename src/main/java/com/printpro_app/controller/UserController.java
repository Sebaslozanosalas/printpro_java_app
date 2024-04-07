package com.printpro_app.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.printpro_app.service.UserService;


@WebServlet(name = "UserController", urlPatterns = {"/login", "/logout", "/register"})
public class UserController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private UserService userService;
       
    public UserController() {
        super();
        this.userService = new UserService();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	
    	String path = request.getServletPath();

        switch (path) {
            case "/logout":
                logout(request, response);
                break;
        }
		
	}
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    		throws IOException, ServletException {
    	

        String path = request.getServletPath();

        switch (path) {
            case "/login":
                login(request, response);
                break;
            case "/register":
                register(request, response);
                break;
        }
    }
    

    private void login(HttpServletRequest request, HttpServletResponse response)
    		throws IOException, ServletException {
    	
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	
    	int userId = userService.userLogIn(username, password);
    	
	    if( userId != -1 ) {
	    	request.getSession().setAttribute("userId", userId);
	    	response.sendRedirect("welcome.jsp"); 

	    } else {
	        request.setAttribute("error", "Error al inciar sesion.");
	        request.getRequestDispatcher("login.jsp").forward(request, response);
	    }

    }
    
    private void logout(HttpServletRequest request, HttpServletResponse response)
    		throws IOException {
    	
    	HttpSession session = request.getSession();
		
		// Elimina los datos de la sesion para hacer log out
		session.removeAttribute("userId");
		session.invalidate();
		
		// Redirige a la pagina de inicio
		response.sendRedirect("index.jsp");

    	
    }
    

    private void register(HttpServletRequest request, HttpServletResponse response)
    		throws IOException, ServletException {
    	
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	
    	int userId = userService.registerUser(username, password);
    	
	    if (userId != -1) { 
	        request.getSession().setAttribute("userId", userId);
	        response.sendRedirect("welcome.jsp"); 
	        
	    } else {
	    	String errorMessage = userService.getErrorMessage();
	    	
	        request.setAttribute("error", errorMessage);
	        request.getRequestDispatcher("register.jsp").forward(request, response);
	        
	    }
    	
    }
    
    

}
