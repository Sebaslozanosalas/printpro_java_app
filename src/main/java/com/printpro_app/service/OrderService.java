package com.printpro_app.service;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.List;

import com.printpro_app.dao.OrderDAO;
import com.printpro_app.model.Order;

public class OrderService {
	
	OrderDAO orderDAO;
	private String errorMessage;
	
	public OrderService() {
		this.orderDAO = new OrderDAO();
	}
	
	public boolean createOrder(Order order) {
		
		order.setStatus("Pendiente");
		
		try {
			return orderDAO.createOrder(order);
		} catch (SQLIntegrityConstraintViolationException e) {
            errorMessage = "Ese cliente no existe";
            return false;
        } catch (SQLException e) {
            errorMessage = "Error del sistema al intentar crear la orden.";
            return false; 
        } catch (Exception e) {
            return false; 
        } 
		

	}
	
	public boolean deleteOrder(int orderId) {
		return orderDAO.deleteOrder(orderId);
	}
	
	
	public boolean editOrder(Order order) {
		return orderDAO.editOrder(order);
	}
	
	
	public List<Order> getAllOrders(){
		return orderDAO.getAllOrders();
	}
	
	public String getErrorMessage() {
        return errorMessage;
    }
	
}
