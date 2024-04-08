<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PrintPro - Iniciar Sesión</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

	<!-- Redirige al usuario si ya inicio sesión -->
	<%
        HttpSession s = request.getSession(false);
        if (s != null && s.getAttribute("userId") != null) {  
            response.sendRedirect("welcome.jsp");
        }
    %>

    <!-- Barra de navegación con Bootstrap -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	    <div class="container">
	        <a class="navbar-brand" href="index.jsp">PrintPro</a>
	        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
	            <span class="navbar-toggler-icon"></span>
	        </button>
	        <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
	            <div class="navbar-nav">
	                <a class="nav-item nav-link" href="login.jsp">Iniciar sesión</a>
	                <a class="nav-item nav-link" href="register.jsp">Registrarse</a>
	            </div>
	        </div>
	    </div>
	</nav>


    <!-- Contenedor para el formulario -->
    <div class="container mt-4">
        <h1 class="text-center mb-4">Iniciar sesión</h1>
        <form action="login" method="post">
            <div class="form-group">
                <label for="username">Usuario:</label>
                <input type="text" id="username" name="username" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary btn-block">Iniciar sesión</button>
        </form>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger mt-4" role="alert">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
    </div>

    <!-- Bootstrap JS, Popper.js, y jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
