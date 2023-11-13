<%-- 
    Document   : modificar
    Created on : 8 nov 2023, 16:07:31
    Author     : gonza
--%>

<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
  <title>Modificar descripción</title>
  <link rel="stylesheet" href="modificar.css"/>
</head>
    <body>
        
        <h1>Modificar Plan:</h1>
        <form action="modificar.jsp" method="post">
          <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
          <input type="text" name="descripcion" value="<%= request.getParameter("descripcion") %>">
          <input type="submit" value="Guardar">
        </form>

        <script>
          function validarFormulario() {
            var descripcion = document.getElementById("descripcion").value;
            var id = document.getElementById("id").value;

            if (descripcion == "") {
              alert("Debe ingresar una descripción");
              return false;
            }

            if (id == "") {
              alert("Debe seleccionar un registro");
              return false;
            }

            return true;
          }
        </script>
<%
  // Obtener la conexión a la base de datos
  Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/chim", "root", "");

  // Obtener el valor del campo descripción del formulario
  String descripcion = request.getParameter("descripcion");

  // Obtener el ID del registro
  int id = Integer.parseInt(request.getParameter("id"));

  // Actualizar el campo descripción en la base de datos
  PreparedStatement sentenciaActualizacion = conexion.prepareStatement("UPDATE tiene_plan_alimentacion SET descripcion=? WHERE id=?");
  sentenciaActualizacion.setString(1, descripcion);
  sentenciaActualizacion.setInt(2, id);
  sentenciaActualizacion.executeUpdate();

  conexion.close();
%>
    </body>
</html>

