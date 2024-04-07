package com.printpro_app.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.printpro_app.service.ClientService;
import com.printpro_app.model.Client;

@WebServlet(name = "ClientController", urlPatterns = {"/delete-client", "/register-client"})
public class ClientController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private ClientService clientService;

    public ClientController() {
        super();
        this.clientService = new ClientService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.removeAttribute("error");
		
		String path = request.getServletPath();
		
		switch (path) {
	        case "/delete-client":
	        	deleteClient(request, response);
	            break;
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.removeAttribute("error");
		
		String path = request.getServletPath();
		
		switch (path) {
	        case "/register-client":
	        	registerClient(request, response);
	            break;
		}
	}

	
	private void deleteClient(HttpServletRequest request, HttpServletResponse response)
    		throws IOException, ServletException {
    	
    	int clientId = Integer.parseInt(request.getParameter("client_id"));

    	boolean success = clientService.deleteClient(clientId);
    	
    	if (success) {
    		response.sendRedirect("clients.jsp");
    	} else {
    		request.setAttribute("error", "Error al eliminar el cliente.");
	        request.getRequestDispatcher("clients.jsp").forward(request, response);
    	}

    }
	
	private void registerClient(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
    	
		String firstName = request.getParameter("first_name");
		String lastName = request.getParameter("last_name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		Client client = new Client(firstName, lastName, email, phone, address);
		
		boolean success = clientService.createNewClient(client);
		
		if (success) {
			response.sendRedirect("clients.jsp");
		} else {
			request.setAttribute("error", "Error al registrar cliente");
	        request.getRequestDispatcher("client-register.jsp").forward(request, response);
		}

    }

}
