
package paquete;

public class Nutricionista extends Persona{
    protected int cod_Nutri;

    public Nutricionista(int cod_Nutri, String nombre, String apellido, Genero genero) {
        super(nombre, apellido, genero);
        this.cod_Nutri = cod_Nutri;
    }

    @Override
    public String toString() {
        return " Nutricionista " + " Codigo Nutricionista " + cod_Nutri;
    }
    
    
    //Getters y setters: 
    
    public int getCod_Nutri() {
        return cod_Nutri;
    }

    public void setCod_Nutri(int cod_Nutri) {
        this.cod_Nutri = cod_Nutri;
    }
    
    
}