/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package clases;



import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;

@WebServlet("/ListaPlanesServlet")
public class ListaPlanesServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<PlanEntrenamiento> listaPlanes = new ArrayList<>();
        listaPlanes.add(new PlanEntrenamiento("Básico", "3x10 de pecho", 30));
        listaPlanes.add(new PlanEntrenamiento("Avanzado", "4x12 de piernas", 45));
        listaPlanes.add(new PlanEntrenamiento("Profesional", "5x5 de espalda", 60));

        // Almacena la lista en el alcance de la aplicación para que esté disponible en toda la aplicación web
        getServletContext().setAttribute("listaPlanes", listaPlanes);

        // Redirige a la página JSP que muestra los planes
        request.getRequestDispatcher("elegirPlan.jsp").forward(request, response);
    }
}




