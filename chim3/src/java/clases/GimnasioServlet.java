/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package clases;



import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GimnasioServlet")
public class GimnasioServlet extends HttpServlet {
    private ArrayList<PlanEntrenamiento> planesEntrenamiento = new ArrayList<>();

    public void init() {
        // Cargar los planes de entrenamiento en el ArrayList
        planesEntrenamiento.add(new PlanEntrenamiento("Plan A", "Descripción del Plan A", 30));
        planesEntrenamiento.add(new PlanEntrenamiento("Plan B", "Descripción del Plan B", 45));
        // Agregar más planes según tus necesidades
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Establecer la lista de planes como un atributo de solicitud para que esté disponible en la vista
        request.setAttribute("planesEntrenamiento", planesEntrenamiento);

        // Redirigir al usuario a la vista que mostrará los planes
        request.getRequestDispatcher("elegirPlan.jsp").forward(request, response);
    }
}




