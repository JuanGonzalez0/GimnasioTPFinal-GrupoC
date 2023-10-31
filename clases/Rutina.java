
package paquete;

import java.util.ArrayList;


public class Rutina {
    private ArrayList<Ejercicio> ejercicios;
    private int cantDias;

    public Rutina(ArrayList<Ejercicio> ejercicios, int cantDias) {
        this.ejercicios = ejercicios;
        this.cantDias = cantDias;
    }
    
  
    // Getters y Setters: 

    public ArrayList<Ejercicio> getEjercicios() {
        return ejercicios;
    }

    public void setEjercicios(ArrayList<Ejercicio> ejercicios) {
        this.ejercicios = ejercicios;
    }

    public int getCantDias() {
        return cantDias;
    }

    public void setCantDias(int cantDias) {
        this.cantDias = cantDias;
    }
    
    
    
    
}
