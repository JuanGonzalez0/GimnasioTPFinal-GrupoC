
package paquete;

public class Plato {
    protected Tipo tipo;
    protected String desc;
    protected int calorias;

    public Plato(Tipo tipo, String desc, int calorias) { // constructor 
        this.tipo = tipo;
        this.desc = desc;
        this.calorias = calorias;
    }
    

    
    // Getters y Setters: 

    public Tipo getTipo() {
        return tipo;
    }

    public String getDesc() {
        return desc;
    }

    public int getCalorias() {
        return calorias;
    }
    
    
    
    

}
