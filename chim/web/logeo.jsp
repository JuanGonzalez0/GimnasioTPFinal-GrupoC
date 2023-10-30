<%-- 
    Document   : logeo
    Created on : 30 oct. 2023, 13:02:13
    Author     : ET36
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Iniciar Sesión</title>
</head>
<body>
    <h1>Iniciar Sesión</h1>

    <%-- Verificar si se ha producido un error de inicio de sesión --%>
    <c:if test="${param.error eq '1'}">
        <p style="color: red;">Credenciales incorrectas. Inténtalo de nuevo.</p>
    </c:if>

    <form action="LoginServlet" method="post">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required><br>

        <label for="apellido">Apellido:</label>
        <input type="text" id="apellido" name="apellido" required><br>

        <input type="submit" value="Iniciar Sesión">
    </form>
</body>
</html>

