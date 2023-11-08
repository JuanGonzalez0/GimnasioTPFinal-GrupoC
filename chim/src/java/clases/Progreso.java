
package clases;

public class Progreso {
    private int idPersona;
    private double altura;
    private double peso;
    private int asistencia;

    public Progreso(int idPersona, double altura, double peso, int asistencia) {
        this.idPersona = idPersona;
        this.altura = altura;
        this.peso = peso;
        this.asistencia = asistencia;
    }

    public int getIdPersona() {
        return idPersona;
    }

    public void setIdPersona(int idPersona) {
        this.idPersona = idPersona;
    }

    public double getAltura() {
        return altura;
    }

    public void setAltura(double altura) {
        this.altura = altura;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public int getAsistencia() {
        return asistencia;
    }

    public void setAsistencia(int asistencia) {
        this.asistencia = asistencia;
    }

    
}

