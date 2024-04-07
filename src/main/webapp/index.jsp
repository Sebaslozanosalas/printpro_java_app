<%@ page import="com.printpro_app.util.DatabaseConnection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PrintPro App</title>
</head>
<body>

	<%
    java.sql.Connection conn = null;
    try {
        conn = DatabaseConnection.getConnection();
        if (conn != null) {
            out.println("Conexión a la base de datos exitosa!");
        } else {
            out.println("Conexión fallida!");
        }
    } catch (Exception e) {
        out.println("Excepción al obtener la conexión: " + e.getMessage());
        e.printStackTrace();
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception e) {
                out.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
    }
	%>

</body>
</html>