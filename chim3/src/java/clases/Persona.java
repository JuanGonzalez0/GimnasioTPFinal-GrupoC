
package clases;

public class Persona {
    protected String nombre;
    protected String apellido;
    protected Genero genero;
    protected String contraseña; 

    public Persona(String nombre, String apellido, Genero genero, String contraseña) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.genero = genero;
        this.contraseña = contraseña;
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

    public Genero getGenero() {
        return genero;
    }

    public void setGenero(Genero genero) {
        this.genero = genero;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public enum Genero {
        Masculino, Femenino, Otro
    }
    
}
