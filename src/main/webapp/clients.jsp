<%@ page import="java.util.List" %>
<%@ page import="com.printpro_app.model.Client" %>
<%@ page import="com.printpro_app.service.ClientService" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>PrintPro - Clientes</title>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

	<!-- Barra de navegación con Bootstrap -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	    <div class="container">
	        <a class="navbar-brand" href="welcome.jsp">PrintPro</a>
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse" id="navbarNavDropdown">
	            <ul class="navbar-nav ml-auto">
	                <li class="nav-item">
	                    <a class="nav-link" href="orders.jsp">Gestionar órdenes</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="logout">Cerrar sesión</a>
	                </li>
	            </ul>
	        </div>
	    </div>
	</nav>


    <div class="container mt-4">
		<h1 class="text-center mb-4">Clientes</h1>

		<!-- Botón para registrar nuevo cliente -->
		<div class="text-right mb-3">
			<a class="btn btn-success" href="client-register.jsp">Nuevo cliente</a>
		</div>

		<!-- Formulario para eliminar un cliente -->
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<form action="delete-client" method="get" class="mb-4">
					<div class="form-group">
						<label for="client_id">ID Cliente:</label>
						<input type="text" id="client_id" name="client_id" class="form-control" required>
					</div>
					<button type="submit" class="btn btn-danger btn-block">Eliminar</button>
				</form>
				<% if (request.getAttribute("error") != null) { %>
					<div class="alert alert-danger" role="alert">
						<%= request.getAttribute("error") %>
					</div>
				<% } %>
			</div>
		</div>

		<%
			// Redirige a index en caso de que el usuario no haya iniciado sesión
			HttpSession s = request.getSession(false); 
			if (s == null || s.getAttribute("userId") == null) {  
				response.sendRedirect("index.jsp");
				return; // Detiene la ejecución del JSP aquí si el usuario no está logueado
			}
			
			// Obtener e imprimir la lista de clientes
			ClientService clientService = new ClientService();
			List<Client> clients = clientService.getAllClients();
			if (clients != null && !clients.isEmpty()) {
		%>

		<!-- Tabla de clientes con estilo de Bootstrap -->
		<table class="table table-striped">
			<thead class="thead-dark">
				<tr>
					<th>ID</th>
					<th>Nombre</th>
					<th>Apellido</th>
					<th>Correo</th>
					<th>Teléfono</th>
					<th>Dirección</th>
					<th>Fecha de registro</th>
					<th>Fecha de última modificación</th>
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
				<% 
				} 
				%>
			</tbody>
		</table>
		<%
			}
		%>
	</div>

	<!-- Bootstrap JS, Popper.js, y jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
