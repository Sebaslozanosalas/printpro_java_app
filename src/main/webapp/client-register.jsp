<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PrintPro - Registrar cliente</title>
</head>
<body>

	<%
		HttpSession s = request.getSession(false);
	    if (session == null || s.getAttribute("userId") == null) {  
	    	response.sendRedirect("index.jsp");
    	}
	%>

	<a class="navbar-brand" href="welcome.jsp">Home</a>
	<a class="navbar-brand" href="clients.jsp">Gestionar clientes</a>
	<a class="navbar-brand" href="orders.jsp">Gestionar ordenes</a>
	<a class="navbar-brand" href="logout">Cerrar session</a>
	
	<br>
	<br>
	
	<h1 class="text-center">Registrar nuevo cliente</h1>
	
	<form action="register-client" method="post" class="mt-4">
        <div class="form-group">
            <label for="first_name">Nombre:</label>
            <input type="text" id="first_name" name="first_name" class="form-control" required>
        </div>
        
        <div class="form-group">
            <label for="last_name">Apellido:</label>
            <input type="text" id="last_name" name="last_name" class="form-control" required>
        </div>
        
        <div class="form-group">
            <label for="email">Correo:</label>
            <input type="text" id="email" name="email" class="form-control" required>
        </div>
        
        <div class="form-group">
            <label for="phone">Telefono:</label>
            <input type="text" id="phone" name="phone" class="form-control" required>
        </div>
        
        <div class="form-group">
            <label for="address">Direccion:</label>
            <input type="text" id="address" name="address" class="form-control" required>
        </div>
        
        <br>
        <button type="submit" class="btn btn-primary w-100">Registrar</button>
    </form>
    
    <% if (request.getAttribute("error") != null) { %>
	      <div class="alert alert-danger" role="alert">
	          <%= request.getAttribute("error") %>
	      </div>
    <% } %>

</body>
</html>