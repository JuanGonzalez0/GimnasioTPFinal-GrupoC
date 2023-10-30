import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Obtener los valores del formulario (nombre y apellido)
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");

        // Validar las credenciales (esto debe ser personalizado para tu aplicación)
        if (validarCredenciales(nombre, apellido)) {
            // Las credenciales son válidas, puedes establecer una sesión de usuario
            request.getSession().setAttribute("usuarioLogeado", true);
            // Redirigir a la vista de progreso
            response.sendRedirect("VistaDeProgreso.jsp");
        } else {
            // Las credenciales no son válidas, puedes redirigir nuevamente a la página de inicio de sesión con un mensaje de error
            response.sendRedirect("logeo.jsp?error=1");
        }
    }

    // Método para validar las credenciales (personalízalo según tu base de datos o lógica de autenticación)
private boolean validarCredenciales(String nombre, String apellido) {
    Connection conexion = null;
    try {
        conexion = ConexionBaseDatos.obtenerConexion();

        // Realiza una consulta SQL para verificar si el registro existe
        String sql = "SELECT COUNT(*) FROM formulario WHERE nombre = ? AND apellido = ?";
        PreparedStatement preparedStatement = conexion.prepareStatement(sql);
        preparedStatement.setString(1, nombre);
        preparedStatement.setString(2, apellido);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next() && resultSet.getInt(1) > 0) {
            // Existe un registro con los valores proporcionados
            return true;
        }
    } catch (SQLException e) {
        e.printStackTrace(); // Manejo de errores
    } finally {
        ConexionBaseDatos.cerrarConexion(conexion);
    }

    return false; // No se encontró un registro con los valores proporcionados
}

}
