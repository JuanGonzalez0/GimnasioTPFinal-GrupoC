import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/ProcesarFormularioServlet")
public class ProcesarFormularioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Obtén los datos del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String genero = request.getParameter("genero");
        String objetivo = request.getParameter("objetivo");
        String planAlimentario = request.getParameter("plan");

        // Crea una instancia de FormularioDatos y asigna los valores
        FormularioDatos formularioDatos = new FormularioDatos( nombre,  apellido,  genero,  objetivo,  planAlimentario);
        formularioDatos.setNombre(nombre);
        formularioDatos.setApellido(apellido);
        formularioDatos.setGenero(genero);
        formularioDatos.setObjetivo(objetivo);
        formularioDatos.setPlanAlimentario(planAlimentario);

        // Guardar los datos en la base de datos
        Connection conexion = null;
        try {
            conexion = ConexionBaseDatos.obtenerConexion();

            // Crear la sentencia SQL de inserción
            String sql = "INSERT INTO formulario (nombre, apellido, genero, obj_fit, plan_alimentario) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = conexion.prepareStatement(sql);
            preparedStatement.setString(1, formularioDatos.getNombre());
            preparedStatement.setString(2, formularioDatos.getApellido());
            preparedStatement.setString(3, formularioDatos.getGenero());
            preparedStatement.setString(4, formularioDatos.getObjetivo());
            preparedStatement.setString(5, formularioDatos.getPlanAlimentario());

            // Ejecutar la inserción
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo de errores
        } finally {
            ConexionBaseDatos.cerrarConexion(conexion);
        }

        // Establece formularioDatos como atributo de la solicitud
        request.setAttribute("formularioDatos", formularioDatos);

        // Redirige a la página de confirmación
    }
}


