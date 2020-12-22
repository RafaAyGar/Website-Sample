
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="/P3/include/editProfileError.jsp" %>    
<%@page import="es.uco.pw.vo.Interes"%>
<%@page import="java.util.List"%>
<%@page import="es.uco.pw.business.util.Converters"%>
<%@page import="es.uco.pw.data.dao.*" %>
<%@page import="es.uco.pw.business.contacto.*" %>

<jsp:useBean  id="userBean" scope="session" class="es.uco.pw.display.javabean.UserBean"></jsp:useBean>

<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Edit Profile</title>
</head>

<body>
<%
	String nextPage = "";
	String errorMessage = "";

	/**
	Si el user bean es null no tiene sentido estar en esta página, ha habido un fallo en el flujo de la web,
	por lo que volvemos al index.
	**/
	if(userBean == null || userBean.getEmailUser().trim().equals(""))
	{
		nextPage = "../redirecter.jsp";
	}
	//Si el userBean existe entonces podemos continuar.
	else
	{
		String newUserName = request.getParameter("name");
		
		//No viene de la vista, por lo que redireccionamos a esta (si viniese de la vista este campo no sería nulo)
		if(newUserName ==  null)
		{
			nextPage = "../../view/user/editProfileView.jsp";						
		}
		//Viene de la vista por lo que podemos comenzar con la edición del perfil
		else
		{
			//Cogemos el resto de parámetros de la vista
			String newUserSurnames = request.getParameter("surNames");
			String newBirthDate = request.getParameter("birthDate");
			String newPass = request.getParameter("pass");

			//Cogemos el valor de las checkboxes y lo transformamos en un string del tipo [interes1, interes2..., interesN].
			//Dicho string será el que se pase al DAO.
			String[] interestsArray = request.getParameterValues("interests");
			String interestsSelected = Arrays.asList(interestsArray).toString();
			
			DAO contactoDAO = new ContactoDAO(application.getInitParameter("dbID"), application.getInitParameter("dbUser"), application.getInitParameter("dbPass"), application.getInitParameter("sqlProp"));
			contactoDAO.Update(newUserName, newUserSurnames, newBirthDate, newPass, interestsSelected, userBean.getEmailUser());
			contactoDAO.CloseConnection();
			%>
				<jsp:setProperty property="name" value="<%=newUserName%>" name="userBean"/>
				<jsp:setProperty property="surNames" value="<%=newUserSurnames%>" name="userBean"/>
				<jsp:setProperty property="birthDate" value="<%=newBirthDate.toString()%>" name="userBean"/>
				<jsp:setProperty property="interests" value="<%=interestsSelected%>" name="userBean"/>
				<jsp:setProperty property="password" value="<%=newPass%>" name="userBean"/>
			<%
			
			nextPage = "../redirecter.jsp";
			}
		}
	%>
	
	<jsp:forward page="<%=nextPage%>">
		<jsp:param value="../../../index.jsp" name="url"/>
		<jsp:param value="<%=errorMessage%>" name="message"/>
	</jsp:forward>
	
	</body>
	</html>