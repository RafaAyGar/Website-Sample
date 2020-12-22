package es.uco.pw.data.dao;

public class DAOException extends Exception{

	private static final long serialVersionUID = 1L;
	
	public DAOException(String errorMSG, Throwable error)
	{
		super(errorMSG, error);
		error.printStackTrace();
	}
}
