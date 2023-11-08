/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package clases;

public class PlanEntrenamiento {
    private String tipo;
    private String descripcion;
    private int tiempoDuracion; // En minutos

    public PlanEntrenamiento(String tipo, String descripcion, int tiempoDuracion) {
        this.tipo = tipo;
        this.descripcion = descripcion;
        this.tiempoDuracion = tiempoDuracion;
    }

    public String getTipo() {
        return tipo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public int getTiempoDuracion() {
        return tiempoDuracion;
    }

    @Override
    public String toString() {
        return "Tipo: " + tipo + ", Descripción: " + descripcion + ", Duración: " + tiempoDuracion + " minutos";
    }
}
