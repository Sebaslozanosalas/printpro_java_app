<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PrintPro - Home</title>
</head>
<body>

	<a class="navbar-brand" href="index.jsp">Home</a>
	<a class="nav-link" href="login.jsp">Iniciar sesion</a>
	<a class="nav-link" href="register.jsp">Registrarse</a>
	
	<%
	    HttpSession s = request.getSession(false); // false para no crear una nueva si no existe
	    if (session == null || s.getAttribute("userId") == null) {  
    } else {
        // Existe userId, imprimir el ID del usuario
        response.sendRedirect("welcome.jsp");
	
	    }
	%>

</body>
</html>