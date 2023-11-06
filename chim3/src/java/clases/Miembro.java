package clases;

public class Miembro extends Persona {
    protected String objetivoFit;
    protected boolean planAlimentacion;
    protected int idPersona; // Agregar un atributo para el id de la persona

    public Miembro(int idPersona, String objetivoFit, boolean planAlimentacion) {
        super(null, null, null, null); // Llama al constructor de la superclase Persona con valores nulos
        this.idPersona = idPersona; // Asigna el idPersona
        this.objetivoFit = objetivoFit;
        this.planAlimentacion = planAlimentacion;
    }

    public String getObjetivoFit() {
        return objetivoFit;
    }

    public void setObjetivoFit(String objetivoFit) {
        this.objetivoFit = objetivoFit;
    }

    public boolean isPlanAlimentacion() {
        return planAlimentacion;
    }

    public void setPlanAlimentacion(boolean planAlimentacion) {
        this.planAlimentacion = planAlimentacion;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }
}









