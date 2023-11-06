package clases;


import conexion.ConexionMySQL;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpSession;

@WebServlet("/RegistroServlet")
public class RegistroServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Obtener los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String generoValue = request.getParameter("genero");
        String contrasena = request.getParameter("contrasena");

        // Convertir el valor del formulario a un valor de la enumeración Genero
        Persona.Genero genero = Persona.Genero.valueOf(generoValue);

        // Crear una instancia de la clase Persona con los datos generales
        Persona persona = new Persona(nombre, apellido, genero, contrasena);

        // Realizar la inserción de los datos generales en la base de datos
        try {
            Connection conexion = ConexionMySQL.obtenerConexion();
            String sql = "INSERT INTO persona (nombre, apellido, genero, contrasena) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conexion.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, persona.getNombre());
            stmt.setString(2, persona.getApellido());
            stmt.setString(3, persona.getGenero().name()); // Convertir el enum a una cadena
            stmt.setString(4, persona.getContraseña());
            stmt.executeUpdate();

            // Obtener la clave generada (ID de la persona)
            ResultSet generatedKeys = stmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                int idPersona = generatedKeys.getInt(1);

                // Guardar el ID de la persona en la sesión
                HttpSession session = request.getSession();
                session.setAttribute("idPersona", idPersona);

                // Redirigir a la página de ingreso de datos específicos de miembro
                response.sendRedirect("formularioDatosMiembro.jsp");
            } else {
                // Manejar el error si no se generó una clave
                response.sendRedirect("error.jsp");
            }

            conexion.close(); // Cerrar la conexión
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar el error, por ejemplo, mostrando un mensaje de error al usuario
            response.sendRedirect("error.jsp");
        }
    }
}

