<%@ page import="java.util.List" %>
<%@ page import="com.printpro_app.model.Order" %>
<%@ page import="com.printpro_app.service.OrderService" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>PrintPro - Orders</title>
</head>
<body>

	<a class="navbar-brand" href="welcome.jsp">Home</a>
	<a class="navbar-brand" href="logout">Cerrar session</a>
	
	<br>
	<br>
	<br>
	
	<a class="navbar-brand" href="clients.jsp">Gestionar clientes</a>
	
	<br>
	<br>
	
	<h1 class="text-center">Ordenes</h1>
	
	<a class="navbar-brand" href=order-create.jsp>Nueva orden</a>
	<br>
	<br>
	
	<form action="delete-order" method="get" class="mt-4">
	
        <div class="form-group">
            <label for="order_id">ID Orden:</label>
            <input type="text" id="order_id" name="order_id" class="form-control" required>
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

		HttpSession s = request.getSession(false); 
		if (session == null || s.getAttribute("userId") == null) {  
			response.sendRedirect("index.jsp");
		}
		
		OrderService orderService = new OrderService();
		List<Order> orders = orderService.getAllOrders();
		if (orders != null && !orders.isEmpty()) {
			
	%>
	
		<table class="table">
	        <thead>
	            <tr>
	           		<th>Id</th>
	                <th>ID Cliente</th>
	                <th>Descripcion</th>
	                <th>Cantidad</th>
	                <th>Estado</th>
	                <th>Fecha creacion</th>
	                <th>Fecha ultima modificacion</th>
	            </tr>
	        </thead>
	        <tbody>
	            <%
	            for (Order order : orders) {
	            %>
	                <tr>
	                    <td><%= order.getId() %></td>
	                    <td><%= order.getClientId() %></td>
	                    <td><%= order.getDescription() %></td>
	                    <td><%= order.getQuantity() %></td>
	                    <td><%= order.getStatus() %></td>
	                    <td><%= order.getCreatedAt().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")) %></td>
	                    <td><%= order.getUpdatedAt().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")) %></td>
	                </tr>
	            <% } %>
	        </tbody>
	    </table>
	
	<%
			
		}
		
	%>


</body>
</html>