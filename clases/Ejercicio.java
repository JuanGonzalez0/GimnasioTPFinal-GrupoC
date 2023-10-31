
package paquete;


public class Ejercicio {
    private String nombre;
    private int series;
    private  String maquina;
    private String grupoMuscular;
    private int repeticiones;

    public Ejercicio(String nombre, int series, String maquina, String grupoMuscular, int repeticiones) {
        this.nombre = nombre;
        this.series = series;
        this.maquina = maquina;
        this.grupoMuscular = grupoMuscular;
        this.repeticiones = repeticiones;
    }
    
    //Getters y Setters: 

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getSeries() {
        return series;
    }

    public void setSeries(int series) {
        this.series = series;
    }

    public String getMaquina() {
        return maquina;
    }

    public void setMaquina(String maquina) {
        this.maquina = maquina;
    }

    public String getGrupoMuscular() {
        return grupoMuscular;
    }

    public void setGrupoMuscular(String grupoMuscular) {
        this.grupoMuscular = grupoMuscular;
    }

    public int getRepeticiones() {
        return repeticiones;
    }

    public void setRepeticiones(int repeticiones) {
        this.repeticiones = repeticiones;
    }
    
    
}
