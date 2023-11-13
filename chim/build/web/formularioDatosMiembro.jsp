<%-- 
    Document   : formularioDatosMiembro
    Created on : 31 oct. 2023, 11:35:09
    Author     : ET36
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registro de Datos de Miembro</title>
    <link rel="stylesheet" href="styles.css"/>
</head>
<body>
    <div class="contenedor">
    <h1>Registro de Datos de Miembro</h1>
    <form action="GuardarDatosMiembroServlet" method="post">
        <label for="objetivo">Objetivo de Fitness:</label>
        <input type="text" id="objetivo" name="objetivo" required><br><br>

        <label for="planAlimentacion">¿Desea un Plan de Alimentación?</label>
        <input type="checkbox" id="planAlimentacion" name="planAlimentacion" value="true"><br><br>

        <input type="submit" value="Registrar Datos de Miembro">
    </form>
    </div>
</body>
</html>

