<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resumen de Miembros</title>
</head>
<body>
    <h1>Resumen de Miembros</h1>
    <table border="1">
        <tr>
            <th>Miembro ID</th>
            <th>Nombre</th>
            <th>Tiene Plan</th>
            <th>Promedio Peso</th>
            <th>Promedio Altura</th>
            <th>Promedio Asistencia</th>
        </tr>
        <%
        Connection conn = null;
        CallableStatement cs = null;
        try {
            // Establece la conexión a la base de datos
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chim", "root", "");

            // Llama al procedimiento almacenado
            cs = conn.prepareCall("{call CalcularPromedioYPlanConNombre()}");
            ResultSet rs = cs.executeQuery();

            // Procesa los resultados y muestra los datos en la página
            while (rs.next()) {
                int miembroID = rs.getInt("Miembro_ID");
                String nombre = rs.getString("Nombre");
                int tienePlan = rs.getInt("Tiene_Plan");
                double promedioPeso = rs.getDouble("Promedio_Peso");
                double promedioAltura = rs.getDouble("Promedio_Altura");
                double promedioAsistencia = rs.getDouble("Promedio_Asistencia");
        %>
            <tr>
                <td><%= miembroID %></td>
                <td><%= nombre %></td>
                <td><%= (tienePlan == 1) ? "Sí" : "No" %></td>
                <td><%= promedioPeso %></td>
                <td><%= promedioAltura %></td>
                <td><%= promedioAsistencia %></td>
            </tr>
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
    </table>
</body>
</html>








