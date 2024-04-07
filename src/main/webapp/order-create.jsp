<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>PrintPro - Crear nueva orden</title>
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
	
	<h1 class="text-center">Crear nueva orden</h1>
	
	<form action="create-order" method="post" class="mt-4">
        <div class="form-group">
            <label for="client_id">ID Cliente:</label>
            <input type="text" id="client_id" name="client_id" class="form-control" required>
        </div>
        
        <div class="form-group">
            <label for="description">Descripcion:</label>
            <input type="text" id="description" name="description" class="form-control" required>
        </div>
        
        <div class="form-group">
            <label for="quantity">Catidad:</label>
            <input type="number" id="quantity" name="quantity" class="form-control" required>
        </div>
        
        <br>
        <button type="submit" class="btn btn-primary w-100">Crear orden</button>
    </form>
    
    <% if (request.getAttribute("error") != null) { %>
	      <div class="alert alert-danger" role="alert">
	          <%= request.getAttribute("error") %>
	      </div>
    <% } %>

</body>
</html>