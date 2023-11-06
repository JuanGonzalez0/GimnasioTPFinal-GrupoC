<%-- 
    Document   : ElegirUsuario
    Created on : 2 nov 2023, 21:27:25
    Author     : gonza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Quien es usted?</h1>
        <form action="LoginMiembro.jsp" method="post">
            <input type="submit" value="Miembro">
        </form>
        <form action="LoginNutri.jsp" method="post">
            <input type="submit" value="Nutricionista">
        </form>
    </body>
</html>
