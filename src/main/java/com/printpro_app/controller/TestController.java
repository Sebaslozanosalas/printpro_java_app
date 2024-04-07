package com.printpro_app.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.printpro_app.model.*;
import com.printpro_app.dao.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/test")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public TestController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// Crea variables extrayendo los datos del request
		int clientId = Integer.parseInt(request.getParameter("client_id"));
		String description = request.getParameter("description");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String status = request.getParameter("status");

	    
	    OrderDAO orderDAO = new OrderDAO();
	    Order newOrder = new Order(clientId, description, quantity, status);
	    
	    
	    boolean success = orderDAO.createNewOrder(newOrder);
	    
	    if (success) {
	    	
	    	System.out.println("Orden creada con exito!");
	    	
	    	List<Order> orders = orderDAO.getAllOrders();
		    
		    for (Order order : orders) {
	            System.out.println(order);
	        }
	    	
	    } else {
	    	System.out.println("Error al crear la orden");
	    }
	    
	    
	    
	    response.sendRedirect("index.jsp");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
