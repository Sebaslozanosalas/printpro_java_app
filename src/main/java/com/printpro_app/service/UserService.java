package com.printpro_app.service;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import com.printpro_app.dao.UserDAO;
import com.printpro_app.model.User;

public class UserService {
	
	private UserDAO userDAO;
	private String errorMessage;
	
	
    public UserService() {
        this.userDAO = new UserDAO();
    }
    
    
    public int registerUser(String username, String password) {
    	
		User newUser = new User(username, password);
		try {
			return userDAO.createNewUser(newUser);
			
        } catch (SQLIntegrityConstraintViolationException e) {
            errorMessage = "El nombre de usuario ya está en uso. Por favor elige otro.";
            return -1;
        } catch (SQLException e) {
            errorMessage = "Error del sistema al intentar registrar un nuevo usuario.";
            return -1; 
        } catch (Exception e) {
            return -1; 
        }
		
	}
	
	
	public int userLogIn(String userName, String password) {
		User user = new User(userName, password);
		return userDAO.verifyUserCredentials(user);
	}
	
	public String getErrorMessage() {
        return errorMessage;
    }
    
}
