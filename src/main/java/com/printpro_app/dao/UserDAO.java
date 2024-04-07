package com.printpro_app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;

import com.printpro_app.model.User;
import com.printpro_app.util.DatabaseConnection;

public class UserDAO {
	
	private Connection connection;
	

	public UserDAO() {
		this.connection = DatabaseConnection.getConnection();
	}
	
	public int createNewUser(User newUser)
			throws SQLIntegrityConstraintViolationException, SQLException {
		
		// Query para insertar un nuevo usuario
	    String sql = "INSERT INTO users (username, password) " +
	    			 "VALUES (?, ?)";
	    
	    PreparedStatement statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
	    	
    	// Inserta los datos al Query
        statement.setString(1, newUser.getUserName());	// user_name 
        statement.setString(2, newUser.getPassword()); 	// password
        
        int rowsInserted = statement.executeUpdate();
        
        if (rowsInserted > 0) {
            try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1); // Retorna el ID generado para el nuevo usuario
                }
            }
        }
	    
	    return -1;
	    
	}
	
	public int verifyUserCredentials(User newUser) {

		// Query para consultar si existe un registro con ese usuario y contraseña
        String sql = "SELECT id FROM users WHERE username = ? AND password = ?";
        
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
        	
			// Inserta los datos al Query
            statement.setString(1, newUser.getUserName());
            statement.setString(2, newUser.getPassword());

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt("id"); // Devuelve el id del usuario
                } else {
                    return -1;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return -1; 
        
    }

}
