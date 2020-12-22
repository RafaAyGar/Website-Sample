<!DOCTYPE html>

<%@page import="java.util.Arrays"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page errorPage="/P3/include/userRegisterError.jsp" %>  
<%@page import="es.uco.pw.data.dao.*" %>
<%@page import="es.uco.pw.business.contacto.*" %>


<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Register</title>
</head>

<body>

<%
	String nextPage = "";
	String errorMessagge = "";

	//Consultamos el campo user name del register de la vista para ver si el flujo viene de esta o del index.
	String userName = request.getParameter("name");

	//El flujo no viene de la vista, por lo que redirecciono a ella para que el usuario rellene los campos:
	if(userName == null)
	{
		nextPage = "../../view/user/userRegisterView.jsp";	
	}
	//El flujo viene de la vista
	else
	{
		//Consultamos el resto de los campos del register traídos por la vista.
		String userSurnames = request.getParameter("surNames");
		String birthDate = request.getParameter("birthDate");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		
		//Cogemos el valor de las checkboxes y lo transformamos en un string del tipo [interes1, interes2..., interesN].
		//Dicho string será el que se pase al DAO.
		String[] interestsArray = request.getParameterValues("interests");
		String interestsSelected = Arrays.asList(interestsArray).toString();
		
		//Creamos el DAO.
		DAO contactoDAO = new ContactoDAO(application.getInitParameter("dbID"), application.getInitParameter("dbUser"), application.getInitParameter("dbPass"), application.getInitParameter("sqlProp"));
		
		//Si no existe un usuario con el email introducido, lo crea.
		if(contactoDAO.Exist(email) == false)
		{				
			contactoDAO.Create(userName, userSurnames, birthDate, email, pass, interestsSelected);
			contactoDAO.CloseConnection();

			nextPage = "../redirecter.jsp";
		}
		//Ya existe un usuario con el email introducido, informa del error.
		else
		{
			nextPage = "../../view/user/userRegisterView.jsp";
			errorMessagge = "El email introducido ya existe, pruebe con otro";
		}
	}
	%>
	
	<jsp:forward page="<%=nextPage%>">
		<jsp:param value="../../../index.jsp" name="url"/>
		<jsp:param value="<%=errorMessagge%>" name="message"/>
	</jsp:forward>

</body>
</html>