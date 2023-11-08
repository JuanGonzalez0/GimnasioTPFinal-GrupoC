<%-- 
    Document   : mostrarPlanesDeMiembros
    Created on : 8 nov 2023, 16:20:44
    Author     : gonza
--%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
  <title>Listar datos</title>
</head>
<body>

<table border="1">
  <tr>
    <th>Nombre</th>
    <th>ID Persona</th>
    <th>Descripción</th>
  </tr>

  <%
    // Obtener la conexión a la base de datos
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/chim", "root", "");

    // Obtener los datos de la tabla
    Statement sentencia = conexion.createStatement();
    ResultSet resultado = sentencia.executeQuery("SELECT nombre, id_persona, descripcion FROM tiene_plan_alimentacion");

    while (resultado.next()) {
      String nombre = resultado.getString("nombre");
      int id_persona = resultado.getInt("id_persona");
      String descripcion = resultado.getString("descripcion");
  %>

  <tr>
    <td><%= nombre %></td>
    <td><%= id_persona %></td>
    <td><%= descripcion %></td>
  </tr>

  <% } %>
</table>

</body>
</html>

