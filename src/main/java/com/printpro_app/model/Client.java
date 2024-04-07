package com.printpro_app.model;

import java.time.LocalDateTime;

public class Client {
	
	private int id;
	private String firstName;
	private String lastName;
	private String phone;
	private String email;
	private String address;
	private LocalDateTime createdAt;
	private LocalDateTime updatedAt;
	
	
	public Client(int id, String fisrtName, String lastName, String email,
			String phone, String address, LocalDateTime createdAt, LocalDateTime updatedAt) {
	super();
	this.id = id;
	this.firstName = fisrtName;
	this.lastName = lastName;
	this.phone = phone;
	this.email = email;
	this.address = address;
	this.createdAt = createdAt;
	this.updatedAt = updatedAt;
}
	
	
	
	public Client(String fisrtName, String lastName, String email,
			String phone, String address) {
		super();
		this.firstName = fisrtName;
		this.lastName = lastName;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String fisrtName) {
		this.firstName = fisrtName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
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
		return "Client [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", phone=" + phone
				+ ", email=" + email + ", address=" + address + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt
				+ "]";
	}


	
	
	
}
