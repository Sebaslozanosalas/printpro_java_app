package com.printpro_app.service;

import java.util.List;

import com.printpro_app.model.Client;
import com.printpro_app.dao.ClientDAO;

public class ClientService {
	
	private ClientDAO clientDAO;
	
	public ClientService() {
        this.clientDAO = new ClientDAO();
    }
	
	public boolean createNewClient(Client newClient) {
		return clientDAO.createNewClient(newClient);
	}
	
	public boolean deleteClient(int clientId) {
		return clientDAO.deleteClient(clientId);
	}
	
	public List<Client> getAllClients() {
		return clientDAO.getAllClients();
	}

}
