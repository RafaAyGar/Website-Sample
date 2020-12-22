package es.uco.pw.business.contacto;


import java.time.LocalDate;
import java.time.Period;
import java.util.List;

import es.uco.pw.vo.Interes;

public class Contacto {

	private String nombre;
	private String apellidos;
	private LocalDate fechaNacimiento;
	private String email;
	private String pass;
	private List<Interes> intereses;
	
	public Contacto(String nombre, String apellidos, LocalDate fechaNacimiento, String email, String pass, List<Interes> intereses) {
		super();
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.fechaNacimiento = fechaNacimiento;
		this.email = email;
		this.pass = pass;
		this.intereses = intereses;
	}

	public String toString()
	{
		return "\n_________________" + "\n" + "\n" +
				"Nombre: " + getNombre() + "\n" + 
				"Apellidos: " + getApellidos() + "\n" +
				"Fecha de Nacimiento: " + getFechaNacimiento() + "\n" + 
				"Email: " + getEmail() + "\n" +
				"Intereses: " + getIntereses() + "\n" +
				"_________________ \n";
	}
	
	//Getters y Setters:
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}

	public String getNombreYApellidos()
	{
		return nombre + ", " + apellidos;
	}
	
	public LocalDate getFechaNacimiento() {
		return fechaNacimiento;
	}
	
	public int getEdad()
	{
		return Period.between(fechaNacimiento, LocalDate.now()).getYears();
	}

	public void setFechaNacimiento(LocalDate fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getEmail() {
		return email;
	}
	
	public List<Interes> getIntereses() {
		return intereses;
	}
	
	public String printIntereses()
	{
		return intereses.toString().replace("[", "").replace("]", "").replace(" ", "");
	}

	public void setIntereses(List<Interes> intereses) {
		this.intereses = intereses;
	}
}
