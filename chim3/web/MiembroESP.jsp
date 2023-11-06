<%-- 
    Document   : MiembroESP
    Created on : 31 oct 2023, 15:13:51
    Author     : gonza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ingreso de Datos de Miembro</title>
</head>
<body>
    <h1>Ingreso de Datos de Miembro</h1>
    <form action="GuardarDatosMiembroServlet" method="post">
        <label for="objetivo">Objetivo de Fitness:</label>
        <input type="text" id="objetivo" name="objetivo" required><br><br>

        <label for="planAlimentacion">¿Desea un Plan de Alimentación?</label>
        <input type="checkbox" id="planAlimentacion" name="planAlimentacion" value="true"><br><br>

        <input type="submit" value="Registrar Datos de Miembro">
    </form>
</body>
</html>

