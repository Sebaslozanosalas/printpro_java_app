package com.printpro_app.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.printpro_app.service.OrderService;
import com.printpro_app.model.Order;

@WebServlet(name = "OrderController", urlPatterns = {"/delete-order", "/create-order"})
public class OrderController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private OrderService orderService;
	
       
    public OrderController() {
        super();
        this.orderService = new OrderService();
    }
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.removeAttribute("error");
		
		String path = request.getServletPath();
		
		switch (path) {
	        case "/delete-order":
	        	deleteOrder(request, response);
	            break;
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.removeAttribute("error");
		
		String path = request.getServletPath();
		
		switch (path) {
	        case "/create-order":
	        	createOrder(request, response);
	            break;
		}
		
	}
	
	
	private void deleteOrder(HttpServletRequest request, HttpServletResponse response)
    		throws IOException, ServletException {
    	
    	int orderId = Integer.parseInt(request.getParameter("order_id"));

    	boolean success = orderService.deleteOrder(orderId);
    	
    	if (success) {
    		response.sendRedirect("orders.jsp");
    	} else {
    		request.setAttribute("error", "Error al eliminar la orden.");
	        request.getRequestDispatcher("orders.jsp").forward(request, response);
    	}

    }
	
	private void createOrder(HttpServletRequest request, HttpServletResponse response)
    		throws IOException, ServletException {
    	
    	int clientId = Integer.parseInt(request.getParameter("client_id"));
    	String description = request.getParameter("description");
    	int quantity = Integer.parseInt(request.getParameter("quantity"));
    	
    	Order order = new Order(clientId, description, quantity);

    	boolean success = orderService.createOrder(order);
    	
    	if (success) {
    		response.sendRedirect("orders.jsp");
    	} else {
    		String errorMessage = orderService.getErrorMessage();
    		request.setAttribute("error", errorMessage);
	        request.getRequestDispatcher("orders.jsp").forward(request, response);
    	}

    }

}
