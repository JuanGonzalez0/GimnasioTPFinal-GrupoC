
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Formulario Fitness</title>
</head>
<body>
    <h1>Formulario Fitness</h1>
    <form action="ProcesarFormularioServlet" method="post">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required><br>

        <label for="apellido">Apellido:</label>
        <input type="text" id="apellido" name="apellido" required><br>

        <label for="genero">Género:</label>
        <select id="genero" name="genero">
            <option value="masculino">Masculino</option>
            <option value="femenino">Femenino</option>
            <option value="otro">Otro</option>
        </select><br>

        <label for="objetivo">Objetivo Fitness:</label>
        <textarea id="objetivo" name="objetivo" rows="4" cols="50" required></textarea><br>

        <label for="plan-alimentario">¿Desea un Plan Alimentario?</label>
        <input type="radio" id="plan-si" name="plan" value="si">
        <label for="plan-si">Sí</label>
        <input type="radio" id="plan-no" name="plan" value="no">
        <label for="plan-no">No</label><br>

        <input type="submit" value="Enviar">
    </form>
</body>
</html>
