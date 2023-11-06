/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package clases;
import static conexion.ConexionMySQL.obtenerConexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/progreso")
public class ProgresoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recuperar los datos del formulario
        double altura = Double.parseDouble(request.getParameter("altura"));
        double peso = Double.parseDouble(request.getParameter("peso"));
        int asistencia = Integer.parseInt(request.getParameter("asistencia"));

        // Obtener el idPersona desde la sesión
        HttpSession session = request.getSession();
        int idPersona = (int) session.getAttribute("idPersona");

        // Crear un objeto Progreso con los datos
        Progreso progreso = new Progreso(idPersona, altura, peso, asistencia);

        // Guardar los datos en la base de datos
        Connection conn = null;
        try {
            conn = obtenerConexion(); // Implementa este método según tu configuración

            String sql = "INSERT INTO progreso (id_persona, altura, peso, asistencia) VALUES (?, ?, ?, ?)";

            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setInt(1, progreso.getIdPersona());
            statement.setDouble(2, progreso.getAltura());
            statement.setDouble(3, progreso.getPeso());
            statement.setInt(4, progreso.getAsistencia());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo de errores
        }

        // Redirigir a la vista de progreso
        PrintWriter out = response.getWriter();
        out.println("Datos Guardados");
    }
}


