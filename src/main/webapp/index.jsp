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
	    <label for="client_id">ID Cliente:</label>
	    <input type="text" id="client_id" name="client_id" class="form-control" required>
	</div>
	
	<div class="form-group">
	    <label for="description">Descripcion:</label>
	    <input type="text" id="description" name="description" class="form-control" required>
	</div>
	
	<div class="form-group">
	    <label for="quantity">Cantidad:</label>
	    <input type="text" id="quantity" name="quantity" class="form-control" required>
	</div>
	
	<div class="form-group">
	    <label for="status">Status:</label>
	    <input type="text" id="status" name="status" class="form-control" required>
	</div>


    <button type="submit" class="btn btn-primary w-100">Login</button>

</form>

</body>
</html>