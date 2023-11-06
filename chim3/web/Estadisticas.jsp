<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultado del Procedimiento Almacenado</title>
</head>
<body>
    <h1>Resultado del Procedimiento Almacenado</h1>
    
    <%
    Connection conn = null;
    CallableStatement cs = null;
    try {
        // Establece la conexión a la base de datos
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chim", "root", "");

        // Llama al procedimiento almacenado
        cs = conn.prepareCall("{call CalcularPromedioPorMiembro()}");
        ResultSet rs = cs.executeQuery();

        // Procesa los resultados y muestra los datos en la página
        while (rs.next()) {
            int miembroID = rs.getInt("Miembro_ID");
            int planAlimentacion = rs.getInt("Tiene_Plan_Alimentacion");
            double promedioPeso = rs.getDouble("Promedio_Peso");
            double promedioAltura = rs.getDouble("Promedio_Altura");
            double promedioAsistencia = rs.getDouble("Promedio_Asistencia");
    %>
            <p>Información para Miembro ID: <%= miembroID %></p>
            <p>Tiene Plan de Alimentación: <%= (planAlimentacion == 1) ? "Sí" : "No" %></p>
            <p>Promedio de Peso: <%= promedioPeso %></p>
            <p>Promedio de Altura: <%= promedioAltura %></p>
            <p>Promedio de Asistencia: <%= promedioAsistencia %></p>
            <hr>
    <%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Cierra las conexiones
        if (cs != null) cs.close();
        if (conn != null) conn.close();
    }
    %>
</body>
</html>






