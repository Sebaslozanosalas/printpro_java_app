<%@ page import="java.util.List" %>
<%@ page import="com.printpro_app.model.Client" %>
<%@ page import="com.printpro_app.service.ClientService" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>PrintPro - Clients</title>
</head>

<body>

	<a class="navbar-brand" href="welcome.jsp">Home</a>
	<a class="navbar-brand" href="logout">Cerrar session</a>
	
	<br>
	<br>
	<br>
	
	<a class="navbar-brand" href="orders.jsp">Gestionar ordenes</a>
	
	<br>
	<br>
	
	<h1 class="text-center">Clientes</h1>
	
	<a class="navbar-brand" href=client-register.jsp>Nuevo cliente</a>
	<br>
	<br>
	
	<form action="delete-client" method="get" class="mt-4">
	
        <div class="form-group">
            <label for="client_id">ID Cliente:</label>
            <input type="text" id="client_id" name="client_id" class="form-control" required>
        </div>

        <br>
        <button type="submit" class="btn btn-primary w-100">Borrar</button>
    </form>
    
    <% if (request.getAttribute("error") != null) { %>
	      <div class="alert alert-danger" role="alert">
	          <%= request.getAttribute("error") %>
	      </div>
    <% } %>
    
    <br>
    <br>
	
	<%
		// Redirige a index en caso de que el usuario no haya iniciado sesion
		HttpSession s = request.getSession(false); 
		if (session == null || s.getAttribute("userId") == null) {  
			response.sendRedirect("index.jsp");
		}
		
		// Retraer e imprimir los clientes
		
		ClientService clientService = new ClientService();
		List<Client> clients = clientService.getAllClients();
		
		// Si hay informacion de clientes
		if (clients != null && !clients.isEmpty()) {
			
	%>
	
		<table class="table">
	        <thead>
	            <tr>
	           		<th>Id</th>
	                <th>Nombre</th>
	                <th>Apellido</th>
	                <th>Correo</th>
	                <th>Telefono</th>
	                <th>Direccion</th>
	                <th>Fecha registro</th>
	                <th>Fecha ultima modificacion</th>
	            </tr>
	        </thead>
	        <tbody>
	            <%
	            for (Client client : clients) {
	            %>
	                <tr>
	                    <td><%= client.getId() %></td>
	                    <td><%= client.getFirstName() %></td>
	                    <td><%= client.getLastName() %></td>
	                    <td><%= client.getEmail() %></td>
	                    <td><%= client.getPhone() %></td>
	                    <td><%= client.getAddress() %></td>
	                    <td><%= client.getCreatedAt().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")) %></td>
	                    <td><%= client.getUpdatedAt().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")) %></td>
	                </tr>
	            <% } %>
	        </tbody>
	    </table>
	
	<%
			
		}
		
	%>

</body>

</html>