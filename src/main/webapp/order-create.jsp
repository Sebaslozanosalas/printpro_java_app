<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PrintPro - Crear nueva orden</title>
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
                        <a class="nav-link" href="clients.jsp">Gestionar clientes</a>
                    </li>
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
        <h1 class="text-center mb-4">Crear nueva orden</h1>
        
        <!-- Formulario para crear nueva orden -->
        <form action="create-order" method="post">
            <div class="form-group">
                <label for="client_id">ID Cliente:</label>
                <input type="text" id="client_id" name="client_id" class="form-control" required>
            </div>
            
            <div class="form-group">
                <label for="description">Descripción:</label>
                <input type="text" id="description" name="description" class="form-control" required>
            </div>
            
            <div class="form-group">
                <label for="quantity">Cantidad:</label>
                <input type="number" id="quantity" name="quantity" class="form-control" required>
            </div>
            
            <button type="submit" class="btn btn-primary btn-block">Crear orden</button>
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
