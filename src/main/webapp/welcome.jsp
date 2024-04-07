<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PrintPro - Welcome</title>
</head>
<body>

	<a class="navbar-brand" href="welcome.jsp">Home</a>
	<a class="navbar-brand" href="logout">Cerrar session</a>
	
	<br>
	<br>
	<br>
	
	<a class="navbar-brand" href="clients.jsp">Gestionar clientes</a>
	<br>
	<a class="navbar-brand" href="orders.jsp">Gestionar ordenes</a>
	
	<%
		HttpSession s = request.getSession(false); // false para no crear una nueva si no existe
	    if (session == null || s.getAttribute("userId") == null) {  
	    	response.sendRedirect("index.jsp");
    	}
	%>
	
</body>
</html>