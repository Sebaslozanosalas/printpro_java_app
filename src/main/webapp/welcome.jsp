<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PrintPro - Bienvenido</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

	<!-- Redirige al usuario si no ha iniciado sesión -->
    <%
        HttpSession s = request.getSession(false);
        if (s == null || s.getAttribute("userId") == null) {  
            response.sendRedirect("index.jsp");
            return;
        }
    %>
    

    <!-- Barra de navegación con Bootstrap -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="welcome.jsp">Home</a>
            <div class="navbar-nav">
                <a class="nav-link" href="logout">Cerrar sesión</a>
            </div>
        </div>
    </nav>

    <div class="container text-center mt-5">
        <h1>Bienvenido a PrintPro</h1>
        <p class="lead">Utiliza los enlaces a continuación para gestionar la información.</p>
        <div class="mt-4">
            <a href="clients.jsp" class="btn btn-info btn-lg">Gestionar clientes</a>
            <br><br>
            <a href="orders.jsp" class="btn btn-info btn-lg">Gestionar órdenes</a>
        </div>
    </div>

    <!-- Bootstrap JS, Popper.js, y jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
