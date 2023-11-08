/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package clases;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import clases.Miembro; // Importa la clase Miembro
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import clases.Miembro;
import conexion.ConexionMySQL;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

@WebServlet("/GuardarDatosMiembroServlet")
public class GuardarDatosMiembroServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Obtén los datos específicos del miembro del formulario
        String objetivo = request.getParameter("objetivo");
        boolean deseaPlanAlimentacion = "true".equals(request.getParameter("planAlimentacion"));

        // Obtiene el ID de la persona desde la sesión
        HttpSession session = request.getSession(false);
        Integer idPersona = (Integer) session.getAttribute("idPersona"); // Asegúrate de usar el nombre correcto

        if (idPersona != null) {
            // Crea una instancia de la clase Miembro con l os datos específicos
            Miembro miembro = new Miembro(idPersona, objetivo, deseaPlanAlimentacion);


            // Ahora puedes guardar los datos del miembro en la tabla "Miembro"
            if (guardarDatosMiembroEnBaseDeDatos(miembro)) {
                // Redirige a una página de confirmación si la operación de guardado fue exitosa
                System.out.println("se registro");
            } else {
                // Maneja el error, por ejemplo, muestra un mensaje de error al usuario
                System.out.println("no se registro");
            }
        }
    }

    // Implementa la lógica para guardar los datos del miembro en la base de datos
    private boolean guardarDatosMiembroEnBaseDeDatos(Miembro miembro) {
        try {
            Connection conexion = ConexionMySQL.obtenerConexion();
            String sql = "INSERT INTO Miembro (id_persona, objetivo, plan_alimentacion) VALUES (?, ?, ?)";
            PreparedStatement stmt = conexion.prepareStatement(sql);
            stmt.setInt(1, miembro.getIdPersona());
            stmt.setString(2, miembro.getObjetivoFit());
            stmt.setBoolean(3, miembro.isPlanAlimentacion());
            int filasAfectadas = stmt.executeUpdate();
            conexion.close();

            // Retorna true si se insertaron filas con éxito
            return filasAfectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            // Retorna false en caso de error
            return false;
        }
    }
}











