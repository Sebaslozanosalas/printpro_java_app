<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PrintPro - Register</title>
</head>
<body>

	<a class="navbar-brand" href="index.jsp">Home</a>
	<a class="nav-link" href="login.jsp">Iniciar sesion</a>
	
	<br>
	<br>
	
	<h1 class="text-center">Registrarse</h1>
	
	<form action="register" method="post" class="mt-4">
        <div class="form-group">
            <label for="username">Usuario:</label>
            <input type="text" id="username" name="username" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" class="form-control" required>
        </div>
        <br>
        <button type="submit" class="btn btn-primary w-100">Registrarse</button>
    </form>
    
    <% if (request.getAttribute("error") != null) { %>
	      <div class="alert alert-danger" role="alert">
	          <%= request.getAttribute("error") %>
	      </div>
    <% } %>

</body>
</html>