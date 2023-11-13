<%-- 
    Document   : LoginMiembro
    Created on : 2 nov 2023, 21:30:51
    Author     : gonza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Iniciar sesión</title>
    <link rel="stylesheet" href="styles.css"/>
</head>
<body>
    <div class="contenedor">


        <h1>Iniciar sesión</h1>
        <form action="LoginServletMiembro" method="post">
            <label for="username">Nombre de usuario:</label>
            <input type="text" name="username" required><br>

            <label for="password">Contraseña:</label>
            <input type="password" name="password" required><br>

            <input type="submit" value="Iniciar sesión">
        </form>
    </div>
</body>
</html>
