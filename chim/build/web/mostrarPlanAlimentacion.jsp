<%-- 
    Document   : AsignarPlan
    Created on : 7 nov 2023, 22:19:02
    Author     : gonza
--%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.*" %>
<%@page import="java.util.ArrayList"%>
<%@page import="clases.TienePlanAlimentacion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
  <title>Modificar descripción</title>
  <link rel="stylesheet" href="mostrarPlanAlimentacion.css"/>
</head>
    <body>
        <table border="1">
          <tr>
            <th>ID</th>
            <th>ID Persona</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Modificar</th>
          </tr>

          <%
            // Obtener la conexión a la base de datos
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/chim", "root", "");

            // Obtener los datos de la tabla
            Statement sentencia = conexion.createStatement();
            ResultSet resultado = sentencia.executeQuery("SELECT id, id_persona, nombre, descripcion FROM tiene_plan_alimentacion");

            while (resultado.next()) {
              int id = resultado.getInt("id");
              int id_persona = resultado.getInt("id_persona");
              String nombre = resultado.getString("nombre");
              String descripcion = resultado.getString("descripcion");
          %>

          <tr>
            <td><%= id %></td>
            <td><%= id_persona %></td>
            <td><%= nombre %></td>
            <td><%= descripcion %></td>
            <td><a href="modificar.jsp?id=<%= id %>">Modificar</a></td>
          </tr>

          <% } %>
        </table>
    </body>
</html>







