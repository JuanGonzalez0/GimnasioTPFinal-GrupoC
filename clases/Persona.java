
package paquete;

public class Persona {
    protected String nombre;
    protected String apellido;
    protected Genero genero;

    public Persona(String nombre, String apellido, Genero genero) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.genero = genero;
    }

    @Override
    public String toString() {
        return " Persona " + " Nombre " + nombre + " Apellido " + apellido + " Genero" + genero;
    }

    // Getters y Setters: 
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

}

