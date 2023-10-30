import java.io.Serializable;

public class FormularioDatos implements Serializable {
    private String nombre;
    private String apellido;
    private String genero;
    private String objetivo;
    private String planAlimentario;

    public FormularioDatos(String nombre, String apellido, String genero, String objetivo, String planAlimentario) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.genero = genero;
        this.objetivo = objetivo;
        this.planAlimentario = planAlimentario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public String getPlanAlimentario() {
        return planAlimentario;
    }

    public void setPlanAlimentario(String planAlimentario) {
        this.planAlimentario = planAlimentario;
    }
    
    
}
