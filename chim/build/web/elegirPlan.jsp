<%-- 
    Document   : elegirPlan
    Created on : 6 nov. 2023, 14:02:16
    Author     : ET36
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Planes de Entrenamiento</title>
    <link rel="stylesheet" href="elegirPlan.css"/>
</head>
<body>
    <h1>Lista de Planes de Entrenamiento</h1>
    <table>
        <tr>
            <th>Tipo</th>
            <th>Descripción</th>
            <th>Duración</th>
            <th>Seleccionar</th>
        </tr>
        <c:forEach items="${listaPlanes}" var="plan">
            <tr>
                <td>${plan.tipo}</td>
                <td>${plan.descripcion}</td>
                <td>${plan.tiempoDuracion} minutos</td>
                <td><a href="Progreso.jsp?tipo=${plan.tipo}">Seleccionar</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>


