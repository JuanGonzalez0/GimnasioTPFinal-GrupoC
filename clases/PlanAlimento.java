
package paquete;

import java.util.ArrayList;

public class PlanAlimento {
     //variables: 
    protected Nutricionista nutricionista;
    protected ArrayList<Plato> listaPlato;
    
    //Constructor: 
    public PlanAlimento(Nutricionista nutricionista, ArrayList<Plato> listaPlato) {
        this.nutricionista = nutricionista;
        this.listaPlato = listaPlato;
    }
    
    
   public void AgregarPlato(Plato p) {
        listaPlato.add(p); //se agrega el Plato p a la lista de platos
    }

    
    public int cantCaloriasPlato() {
    int totalCalorias = 0; //Esta variable sirve para realizar un seguimiento de la suma toal de calorias de todos 
    //los platos de la lista.
    
    for (Plato p : listaPlato) {// Recorro todos los elementos de la lista de platos.
        int cont=0;
        totalCalorias += p.getCalorias();// En cada iteracion del bucle, se accede al objeto Plato y 
        //se llama al metodo getCalorias.Este metodo devuelve la cantidad de calorias del plato. 
        //Luego la cantidad de calorias se agrega a la variable totalCalorias.Se suma la cantidad de calorias 
        //del plato a la suma total de calorias.
        System.out.println("Calorias del plato " + (cont+1)+p);
    }
    
    return totalCalorias; //Una vez que el bucle recorrio todos los platos en la lista y 
    //calculo la suma total de calorias, devuelve la cantidad total de calorias de todos los platos.
}
    
    

    //Getter y setter: 

    public Nutricionista getNutricionista() {
        return nutricionista;
    }

    public void setNutricionista(Nutricionista nutricionista) {
        this.nutricionista = nutricionista;
    }

    public ArrayList<Plato> getListaPlato() {
        return listaPlato;
    }

    public void setListaPlato(ArrayList<Plato> listaPlato) {
        this.listaPlato = listaPlato;
    }
    
    

}

