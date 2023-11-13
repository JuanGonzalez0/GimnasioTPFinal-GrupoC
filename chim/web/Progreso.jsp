<%-- 
    Document   : Progreso
    Created on : 3 nov 2023, 20:51:03
    Author     : gonza
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Guardar Progreso</title>
        <link rel="stylesheet" href="Progreso.css"/>
    </head>
    <body>
        <div>
            <div class="contenedor">
                <h1>Registrar Progreso</h1>
                <form action="progreso" method="post">
                    <input type="hidden" name="idPersona" value="1"> <!-- ID del usuario logeado -->
                    <label for="altura">Altura (cm):</label>
                    <input type="number" name="altura" id="altura" required><br>

                    <label for="peso">Peso (kg):</label>
                    <input type="number" name="peso" id="peso" required><br>

                    <label for="asistencia">Asistencia a clases:</label>
                    <input type="number" name="asistencia" id="asistencia" required><br>

                    <button type="submit">Guardar Progreso</button>
                </form>
            </div>
        </div>
    </body>
</html>


