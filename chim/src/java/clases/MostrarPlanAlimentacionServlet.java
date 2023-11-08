/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package clases;

import static conexion.ConexionMySQL.obtenerConexion;



import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mostrarPlanAlimentacion")
public class MostrarPlanAlimentacionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TienePlanAlimentacion> registros = new ArrayList<TienePlanAlimentacion>();

        try {
            // Conexión a la base de datos (asegúrate de configurar tu conexión)
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chim", "root", "");
            Statement stmt = con.createStatement();

            // Consulta para recuperar los registros de tiene_plan_alimentacion
            String query = "SELECT * FROM tiene_plan_alimentacion";
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                TienePlanAlimentacion registro = new TienePlanAlimentacion();
                registro.setId(rs.getInt("id"));
                registro.setIdPersona(rs.getInt("id_persona"));
                registro.setDescripcion(rs.getString("descripcion"));
                registro.setNombre(rs.getString("nombre"));
                registros.add(registro);
            }

            con.close();
        } catch (Exception e) {
            // Manejar errores
        }

        // Guardar los registros como un atributo en la solicitud
        request.setAttribute("registros", registros);

        // Redirigir al JSP para mostrar los registros
        RequestDispatcher dispatcher = request.getRequestDispatcher("/mostrarPlanAlimentacion.jsp");
        dispatcher.forward(request, response);
    }
}





