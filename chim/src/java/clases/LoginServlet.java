
package clases;
import conexion.ConexionMySQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
                // Usuario válido, obtén la idPersona y guárdala en la sesión.
                int idPersona = resultSet.getInt("id");
                HttpSession session = request.getSession();
                session.setAttribute("idPersona", idPersona);
                
                // Redirige a la página de inicio de progreso.
                response.sendRedirect("mostrarPlanAlimentacion.jsp");
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





