package es.uco.pw.data.dao;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import es.uco.pw.business.contacto.Contacto;

public abstract class DAO {

	//Instancia de la conexión con la base de datos
	protected Connection dbConnection;
	
	//Instancia de la clase properties
	protected Properties properties;
	//Nombre de la propiedad que en el .properties guarda la consulta para crear objetos en la base de datos
	protected String propertyToCreateName; 
	//Nombre de la propiedad que en el .properties guarda la consulta para leer objetos en la base de datos
	protected String propertyToReadName;
	//Nombre de la propiedad que en el .properties guarda la consulta para actualizar objetos en la base de datos
	protected String propertyToUpdateName;
	//Nombre de la propiedad que en el .properties guarda la consulta para borrar objetos en la base de datos
	protected String propertyToDeleteName;
	
	//Funciones CRUD
	public abstract int Create(String name, String surName, String birthDate, String email, String pass, String interests) throws DAOException;
	public abstract Contacto Read(String email, String pass) throws DAOException;
	public abstract Boolean Exist(String email) throws DAOException;
	public abstract int Update(String name, String surName, String birthDate, String pass, String interests, String email) throws DAOException;
	public abstract int Delete() throws DAOException;
	
	public DAO(String dataBaseID, String user, String password, String propertiesPath)
	{
		try
		{
			properties = new Properties();
			ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		    InputStream input = classLoader.getResourceAsStream(propertiesPath);

			properties.load(input);			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		Connect(dataBaseID, user, password);
	}
	
	public void Connect(String dataBaseID, String user, String password)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			dbConnection = DriverManager.getConnection(dataBaseID,user,password);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void CloseConnection()
	{
		try {
			dbConnection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
