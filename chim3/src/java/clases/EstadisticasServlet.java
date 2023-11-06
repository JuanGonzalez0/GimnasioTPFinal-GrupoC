/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package clases;

import conexion.ConexionMySQL;
import java.io.IOException;
import java.sql.Connection;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EstadisticasServlet")
public class EstadisticasServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        
        Connection conn = null;
        CallableStatement callableStatement = null;

        try {
            // Usa tu clase ConexionMySQL para obtener la conexión
            conn = ConexionMySQL.obtenerConexion();

            // Llama al procedimiento almacenado
            callableStatement = conn.prepareCall("{call ObtenerPromedioYEstadoPlan()}");
            boolean hasResults = callableStatement.execute();

            List<Estadistica> estadisticas = new ArrayList<>();

            while (hasResults) {
                ResultSet rs = callableStatement.getResultSet();
                while (rs.next()) {
                    Estadistica estadistica = new Estadistica();
                    estadistica.setNombre(rs.getString("nombre"));
                    estadistica.setApellido(rs.getString("apellido"));
                    estadistica.setPromedio_peso(rs.getDouble("promedio_peso"));
                    estadistica.setPromedio_altura(rs.getDouble("promedio_altura"));
                    estadistica.setPromedio_asistencia(rs.getDouble("promedio_asistencia"));
                    estadistica.setEstado_plan(rs.getString("estado_plan"));
                    estadisticas.add(estadistica);
                }
                rs.close();
                hasResults = callableStatement.getMoreResults();
            }

            // Ahora tienes una lista de objetos Estadistica que puedes usar en tu vista.
            // Puedes guardar esta lista en el request para mostrarla en la vista.
            request.setAttribute("estadisticas", estadisticas);

            // Redirige a tu vista JSP (debes crear una vista JSP para mostrar los resultados).
            request.getRequestDispatcher("/Estadisticas.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            // Maneja cualquier excepción de base de datos adecuadamente
        } finally {
            try {
                if (callableStatement != null) {
                    callableStatement.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

