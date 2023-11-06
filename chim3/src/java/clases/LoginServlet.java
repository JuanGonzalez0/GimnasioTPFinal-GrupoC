
package clases;
import conexion.ConexionMySQL;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("username");
        String contraseña = request.getParameter("password");
        
        Connection connection = ConexionMySQL.obtenerConexion();
        
        try {
            String sql = "SELECT * FROM persona WHERE nombre=? AND contrasena=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, contraseña);
            
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                // Usuario válido, redirige a la página de inicio.
                response.sendRedirect("SeleccionMiembro.jsp");
            } else {
                // Usuario no válido, muestra un mensaje de error.
                PrintWriter out = response.getWriter();
                out.println("Usuario o contraseña incorrectos");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}





