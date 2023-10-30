import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBaseDatos {
    private static final String URL = "jdbc:mysql://localhost:3306/gimnasio";
    private static final String USUARIO = "root";
    private static final String CONTRASEÑA = "";

    public static Connection obtenerConexion() {
        Connection conexion = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Cargar el controlador JDBC
            conexion = DriverManager.getConnection(URL, USUARIO, CONTRASEÑA);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Manejo de errores
        }
        return conexion;
    }

    public static void cerrarConexion(Connection conexion) {
        try {
            if (conexion != null && !conexion.isClosed()) {
                conexion.close();
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo de errores
        }
    }
}


