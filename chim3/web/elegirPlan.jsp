<%-- 
    Document   : elegirPlan
    Created on : 6 nov. 2023, 14:02:16
    Author     : ET36
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Elige un Plan de Entrenamiento</title>
</head>
<body>
    <h1>Elige un Plan de Entrenamiento</h1>
    
    <form action="Progreso.jsp" method="post">
        <!-- Genera dinámicamente las opciones de los planes de entrenamiento -->
        <label for="planSeleccionado">Selecciona un plan:</label>
        <select name="planSeleccionado" id="planSeleccionado">
            <c:forEach var="plan" items="${planesEntrenamiento}">
                <option value="${plan.getNombre()}">${plan.getNombre()}</option>
            </c:forEach>
        </select>
        <input type="submit" value="Elegir Plan">
    </form>
</body>
</html>

