<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultados de Estadísticas</title>
</head>
<body>
    <h1>Resultados de Estadísticas</h1>
    
    <table border="1">
        <tr>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>Promedio de Peso</th>
            <th>Promedio de Altura</th>
            <th>Promedio de Asistencia</th>
            <th>Estado del Plan</th>
        </tr>
        <c:forEach var="estadistica" items="${estadisticas}">
            <tr>
                <td>${estadistica.nombre}</td>
                <td>${estadistica.apellido}</td>
                <td>${estadistica.promedio_peso}</td>
                <td>${estadistica.promedio_altura}</td>
                <td>${estadistica.promedio_asistencia}</td>
                <td>${estadistica.estado_plan}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>




