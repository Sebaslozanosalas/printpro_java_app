package com.printpro_app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import com.printpro_app.model.Order;
import com.printpro_app.util.DatabaseConnection;

public class OrderDAO {
	
private Connection connection;
	

	public OrderDAO() {
		this.connection = DatabaseConnection.getConnection();
	}
	
	public boolean createOrder(Order newOrder)
			throws SQLIntegrityConstraintViolationException, SQLException  {
		
		// Query para insertar un nuevo cliente
	    String sql = "INSERT INTO orders (client_id, description, quantity, status) " + 
	    		     "VALUES (?, ?, ?, ?)";
	    
	    
		PreparedStatement statement = connection.prepareStatement(sql);
	    	
    	// Inserta los datos al Query
        statement.setInt(1, newOrder.getClientId());
        statement.setString(2, newOrder.getDescription());
        statement.setInt(3, newOrder.getQuantity());
        statement.setString(4, newOrder.getStatus());
        
        int rowsInserted = statement.executeUpdate();
        
        return rowsInserted > 0;
	        

	    	
	}
	
	public boolean deleteOrder(int orderId) {
		
		 String sql = "DELETE FROM orders WHERE id = ?";
		 
		 try (PreparedStatement statement = connection.prepareStatement(sql)) {
		    	
		        statement.setInt(1, orderId);
		        
		        int rowsDeleted = statement.executeUpdate();
		        
		        return rowsDeleted > 0;
		        
		    } catch (SQLException e) {
		        e.printStackTrace();
		        return false;
		    }
		
	}
	
	public List<Order> getAllOrders() {
		
		List<Order> records = new ArrayList<>();
		
		// Query para retraer todos los registrios ordenados 
	    String sql = 
			"""
				select
					o.id,
					o.client_id,
					concat(c.first_name, " ", c.last_name) as client_name,
					o.description,
					o.quantity,
					o.status,
					o.created_at,
					o.updated_at
				from orders o
				left join clients c
					on o.client_id = c.id
				order by
					o.created_at desc
				""";
		
	    try (PreparedStatement statement = connection.prepareStatement(sql)) {
            

            try (ResultSet resultSet = statement.executeQuery()) {
            	
				// Recorrer todos los registros 
				while (resultSet.next()) {
				    
					// Crear un objeto Client para guardar los datos en la lista records
					Order record = new Order(resultSet.getInt("id"),
											   resultSet.getInt("client_id"),
											   resultSet.getString("client_name"),
											   resultSet.getString("description"),
											   resultSet.getInt("quantity"),
											   resultSet.getString("status"),
											   resultSet.getTimestamp("created_at").toLocalDateTime(),
											   resultSet.getTimestamp("updated_at").toLocalDateTime()
											   );
					
					
				    records.add(record);
				}
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
	    
		return records;
	}

}
