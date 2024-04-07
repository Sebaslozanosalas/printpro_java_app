package com.printpro_app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import com.printpro_app.model.Client;
import com.printpro_app.util.DatabaseConnection;

public class ClientDAO {
	
	private Connection connection;

	public ClientDAO() {
		this.connection = DatabaseConnection.getConnection();
	}
	
	
	public boolean createNewClient(Client newclient) {
		
		// Query para insertar un nuevo cliente
	    String sql = "INSERT INTO clients (first_name, last_name, email, phone, address) " + 
	    		     "VALUES (?, ?, ?, ?, ?)";
	    
	    
		try (PreparedStatement statement = connection.prepareStatement(sql)) {
	    	
	    	// Inserta los datos al Query
	        statement.setString(1, newclient.getFirstName());
	        statement.setString(2, newclient.getLastName());
	        statement.setString(3, newclient.getEmail());
	        statement.setString(4, newclient.getPhone());
	        statement.setString(5, newclient.getAddress());
            
	        int rowsInserted = statement.executeUpdate();
	        
	        return rowsInserted > 0;
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	     	
	}
	
	
	public boolean deleteClient(int clientId) {
		
	    String sql = "DELETE FROM clients WHERE id = ?";

	    try (PreparedStatement statement = connection.prepareStatement(sql)) {
	    	
	        statement.setInt(1, clientId);
	        
	        int rowsDeleted = statement.executeUpdate();
	        
	        return rowsDeleted > 0;
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	
	public List<Client> getAllClients() {
		
		List<Client> records = new ArrayList<>();
		
		// Query para retraer todos los registrios ordenados 
	    String sql = "SELECT * FROM clients ORDER BY id DESC";
		
	    try (PreparedStatement statement = connection.prepareStatement(sql)) {
            

            try (ResultSet resultSet = statement.executeQuery()) {
            	
				// Recorrer todos los registros 
				while (resultSet.next()) {
				    
					// Crear un objeto Client para guardar los datos en la lista records
					Client record = new Client(resultSet.getInt("id"),
											   resultSet.getString("first_name"),
											   resultSet.getString("last_name"),
											   resultSet.getString("email"),
											   resultSet.getString("phone"),
											   resultSet.getString("address"),
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
