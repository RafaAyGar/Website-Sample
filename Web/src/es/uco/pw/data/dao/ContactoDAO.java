/**
 * @fileoverview 	Implementan las funciones que operan sobre la tabla contacto en la base de datos
 * @author			Rafael Ayllón Gavilán <rafaaylloningeniero@gmail.com>
 */
package es.uco.pw.data.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.List;
import es.uco.pw.business.contacto.Contacto;
import es.uco.pw.business.util.Converters;
import es.uco.pw.data.dao.DAO;
import es.uco.pw.vo.Interes;

public class ContactoDAO extends DAO{

	
	public ContactoDAO(String dataBaseID, String user, String password, String propertiesPath) {
		super(dataBaseID, user, password, propertiesPath);
		
		propertyToReadName = "getContactFromDB";
		propertyToCreateName = "createContactInDB";
		propertyToUpdateName = "updateContactInDB";
	}

	@Override
	public Contacto Read(String email, String pass) throws DAOException{
		
		Contacto c = null;
		Statement stm = null;
		
		try
		{
			stm = dbConnection.createStatement();
			
			ResultSet rs = stm.executeQuery(properties.getProperty(propertyToReadName) + email + "'");
			
			while(rs.next())
			{
				String nombre = rs.getString(1);
				String apellidos = rs.getString(2);
				LocalDate fechaNacimiento = LocalDate.parse(rs.getString(3));
				String contra = rs.getString(5);
				List<Interes> intereses = Converters.LeerInteresesDelInput(rs.getString(6));
				
				//Si la contraseña coincide
				if(contra.contentEquals(pass))
				{
					c = new Contacto(nombre, apellidos, fechaNacimiento, email, contra, intereses);					
				}
			}
			
			stm.close();
		}
		catch(SQLException e)
		{
			throw new DAOException("Error al leer contacto de la base de datos", e);
		}
		
		return c;
	}
	
	@Override
	public Boolean Exist(String email) throws DAOException{
		
		Statement stm = null;
		
		try
		{
			stm = dbConnection.createStatement();
			
			ResultSet rs = stm.executeQuery(properties.getProperty(propertyToReadName) + email + "'");
			
			if(rs.next())
			{
				return true;
			}
			
			stm.close();
		}
		catch(SQLException e)
		{
			throw new DAOException("Error al leer contacto de la base de datos", e);
		}
		
		return false;
	}

	@Override
	public int Create(String name, String surName, String birthDate, String email, String pass, String interests) {
		int status = 0;
			
		System.out.println("Llego al create");
		
		try
		{
			PreparedStatement ps = dbConnection.prepareStatement(properties.getProperty(propertyToCreateName));
			
			ps.setString(1, name);
			ps.setString(2, surName);
			ps.setString(3, Converters.convertirFechaAFormatoOriginal(birthDate));
			ps.setString(4, email);
			ps.setString(5, pass);
			ps.setString(6, interests);

			status = ps.executeUpdate();
			
			ps.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return status;
	}

	@Override
	public int Update(String name, String surName, String birthDate, String pass, String interests, String email) {
		
		int status = 0;
		
		try
		{
			PreparedStatement ps = dbConnection.prepareStatement(properties.getProperty(propertyToUpdateName));
			
			ps.setString(1, name);
			ps.setString(2, surName);
			ps.setString(3, Converters.convertirFechaAFormatoOriginal(birthDate));
			ps.setString(4, pass);
			ps.setString(5, interests);
			ps.setString(6, email);
			
			status = ps.executeUpdate();
			
			ps.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return status;
	}

	@Override
	public int Delete() {
		
		return 0;
	}
}
