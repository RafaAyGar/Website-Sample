package es.uco.pw.business.util;

import es.uco.pw.vo.Interes;

public class Printer {

	public static String getInteresesDisponibles()
	{
		String result = "| ";
		int index = 0;
		
		for(Interes i : Interes.values())
		{
			result += "(" + index + ")" + " -> " + i.toString() + " | ";
			index++;
		}
		
		return result;
	}
}
