<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PrintPro App</title>
</head>
<body>

<form action="test" method="post" class="mt-4">

    <div class="form-group">
        <label for="firstName">Nombre:</label>
        <input type="text" id="firstName" name="firstName" class="form-control" required>
    </div>

    <div class="form-group">
        <label for="lastName">Apellido:</label>
        <input type="text" id="lastName" name="lastName" class="form-control" required>
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

    <button type="submit" class="btn btn-primary w-100">Login</button>

</form>

</body>
</html>