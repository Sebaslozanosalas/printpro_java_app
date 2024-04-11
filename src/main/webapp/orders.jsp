<%@ page import="java.util.List" %>
<%@ page import="com.printpro_app.model.Order" %>
<%@ page import="com.printpro_app.service.OrderService" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PrintPro - Orders</title>
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
                        <a class="nav-link" href="logout">Cerrar sesión</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Contenido principal -->
    <div class="container mt-4">
        <h1 class="text-center mb-4">Órdenes</h1>
        
        <!-- Botón para crear nueva orden -->
        <div class="text-right mb-3">
            <a class="btn btn-success" href="order-create.jsp">Nueva orden</a>
        </div>
        
        <!-- Formulario para eliminar una orden -->
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <form action="delete-order" method="get" class="mb-4">
                    <div class="form-group">
                        <label for="order_id">ID Orden:</label>
                        <input type="text" id="order_id" name="order_id" class="form-control" required>
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
        
        <!-- Tabla de órdenes -->
        <%
            HttpSession s = request.getSession(false); 
            if (session == null || s.getAttribute("userId") == null) {  
                response.sendRedirect("index.jsp");
                return; // Detiene la ejecución del JSP aquí si el usuario no está logueado
            }
            
            OrderService orderService = new OrderService();
            List<Order> orders = orderService.getAllOrders();
            if (orders != null && !orders.isEmpty()) {
        %>
        
        <!-- Tabla de órdenes con estilo de Bootstrap -->
        <table class="table table-striped">
            <thead class="thead-dark">
                <tr>
                    <th>ID Orden</th>
                    <th>ID Cliente</th>
                    <th>Nombre Cliente</th>
                    <th>Descripción</th>
                    <th>Cantidad</th>
                    <th>Estado</th>
                    <th>Fecha creación</th>
                    <th>Fecha última modificación</th>
                </tr>
            </thead>
            <tbody>
                <%
                for (Order order : orders) {
                %>
                    <tr>
                        <td><%= order.getId() %></td>
                        <td><%= order.getClientId() %></td>
                        <td><%= order.getClientName() %></td>
                        <td><%= order.getDescription() %></td>
                        <td><%= order.getQuantity() %></td>
                        <td><%= order.getStatus() %></td>
                        <td><%= order.getCreatedAt().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")) %></td>
                        <td><%= order.getUpdatedAt().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm")) %></td>
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
