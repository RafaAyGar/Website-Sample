package es.uco.pw.business.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import es.uco.pw.vo.Interes;

public class Converters {

	public static List<Interes> LeerInteresesDelInputIndexado(String input)
	{
		List<Interes> interesesLeidos = new ArrayList<Interes>();
		
		input = input.replaceAll("\\s","");
		input = input.replaceAll("\\[","");
		input = input.replaceAll("\\]","");
		
		String[] arrayDeInteresesLeidos = input.split(",");
		
		for(String s : arrayDeInteresesLeidos)
		{
			int interesIndex = Integer.parseInt(s);
			
			switch(interesIndex)
			{
				case 0:
					interesesLeidos.add(Interes.Deporte);
				break;
				
				case 1:
					interesesLeidos.add(Interes.Musica);
				break;
				
				case 2:
					interesesLeidos.add(Interes.Television);
				break;
				
				case 3:
					interesesLeidos.add(Interes.Baile);
				break;
				
				case 4:
					interesesLeidos.add(Interes.Videojuegos);
				break;
				
				case 5:
					interesesLeidos.add(Interes.Informatica);
				break;
			}
		}
		
		return interesesLeidos;
	}
	
	public static List<Interes> LeerInteresesDelInput(String input)
	{
		List<Interes> interesesLeidos = new ArrayList<Interes>();
		
		input = input.replaceAll("\\s","");
		input = input.replaceAll("\\[","");
		input = input.replaceAll("\\]","");
		
		String[] arrayDeInteresesLeidos = input.split(",");
		
		for(String s : arrayDeInteresesLeidos)
		{
			for(Interes i : Interes.values())
			{
				if(s.contentEquals(i.toString()))
				{
					interesesLeidos.add(Interes.valueOf(s));
				}
			}
		}
		
		return interesesLeidos;
	}
	
	//Funcion que lee una cadena de intereses y los transforma en sus indices
	//Sirve para el edit profile, para que en el campo aparezcan los intereses indexados, y así no confundir al usuario,
	//ya que este debe introducirlos también indexados.
	public static String transformaInteresesAIndexado(String intereses)
	{
		String interesesIndexados = "";
		
		intereses = intereses.replaceAll("\\s","");
		intereses = intereses.replaceAll("\\[","");
		intereses = intereses.replaceAll("\\]","");
		
		String[] arrayDeInteresesLeidos = intereses.split(",");
		
		//Vamos leyendo cada interes y lo transformamos en su indice correspondiente, añadiendo este al string que devolverá la función
		for(String s : arrayDeInteresesLeidos)
		{
			switch(s)
			{
				case  "Deporte":
					interesesIndexados += "0, ";
				break;
				
				case  "Musica":
					interesesIndexados += "1, ";
				break;
					
				case  "Television":
					interesesIndexados += "2, ";
				break;
					
				case  "Baile":
					interesesIndexados += "3, ";
				break;
					
				case  "Videojuegos":
					interesesIndexados += "4, ";
				break;
					
				case  "Informática":
					interesesIndexados += "5, ";
				break;
			}
		}
		
		if(interesesIndexados.length() > 2)
		{
			//Quitamos los dos últimos caracteres, ya que, tal y como hemos rellenado el string, siempre serán una coma y un espacio.
			interesesIndexados = interesesIndexados.substring(0, interesesIndexados.length() -2);			
		}
		
		return interesesIndexados;
	}
	
	//Convierte una fecha con formato yyyy/mm/dd en dd/mm/yyyy
	public static String convertirFechaAFormatoLocal(String fecha)
	{
		DateTimeFormatter formatterOriginal = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate fechaOriginal = LocalDate.parse(fecha, formatterOriginal);
		
		return fechaOriginal.format(DateTimeFormatter.ofPattern ("dd/MM/yyyy"));
	}
	
	//Convierte una fecha con formato dd/mm/yyyy en yyyy/mm/dd
	public static String convertirFechaAFormatoOriginal(String fecha)
	{
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate fechaEnFormatoDeseado = LocalDate.parse(fecha, formatter);
		
		return fechaEnFormatoDeseado.format(DateTimeFormatter.ofPattern ("yyyy-MM-dd"));
	}
}
