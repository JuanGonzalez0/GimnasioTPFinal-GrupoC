
package clases;

public class Nutricionista extends Persona {
    protected String lugarEstudio;
    protected int idNutricionista;

    public Nutricionista(int idNutricionista, String lugarEstudio) {
        super(null,null,null,null);
        this.idNutricionista = idNutricionista;
        this.lugarEstudio = lugarEstudio;
    }

    public String getLugarEstudio() {
        return lugarEstudio;
    }

    public void setLugarEstudio(String lugarEstudio) {
        this.lugarEstudio = lugarEstudio;
    }

    public int getIdNutricionista() {
        return idNutricionista;
    }

    public void setIdNutricionista(int idNutricionista) {
        this.idNutricionista = idNutricionista;
    }
    
    
    
}
