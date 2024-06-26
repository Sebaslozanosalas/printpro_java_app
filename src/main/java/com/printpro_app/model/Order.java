package com.printpro_app.model;

import java.time.LocalDateTime;

public class Order {
	
	private int id;
	private int clientId;
	private String clientName;
	private String description;
	private int quantity;
	private String status;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;

	public Order(int id, int clientId, String clientName, String description,int quantity,
			String status, LocalDateTime createdAt, LocalDateTime updatedAt) {
		super();
		this.id = id;
		this.clientId = clientId;
		this.clientName = clientName;
		this.description = description;
		this.quantity = quantity;
		this.status = status;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	
	
	public Order(int id, int clientId, String description,int quantity,
			String status, LocalDateTime createdAt, LocalDateTime updatedAt) {
		super();
		this.id = id;
		this.clientId = clientId;
		this.description = description;
		this.quantity = quantity;
		this.status = status;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}
	
	
	public Order(int id, String description, int quantity, String status) {
		super();
		this.id = id;
		this.description = description;
		this.quantity = quantity;
		this.status = status;
	}
	
	
	public Order(int clientId, String description,int quantity) {
		super();
		this.clientId = clientId;
		this.description = description;
		this.quantity = quantity;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getClientId() {
		return clientId;
	}


	public void setClientId(int clientId) {
		this.clientId = clientId;
	}
	

	public String getClientName() {
		return clientName;
	}
	

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public LocalDateTime getCreatedAt() {
		return createdAt;
	}


	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}


	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}


	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", clientId=" + clientId + ", description=" + description + ", quantity=" + quantity
				+ ", status=" + status + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt + "]";
	}


	

}
