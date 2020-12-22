<!DOCTYPE html>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="es.uco.pw.business.util.Converters"%>
<%@page errorPage="/P3/include/userLoginError.jsp" %>    
<%@page import="es.uco.pw.data.dao.*" %>
<%@page import="es.uco.pw.business.contacto.*" %>
    
<jsp:useBean  id="userBean" scope="session" class="es.uco.pw.display.javabean.UserBean"></jsp:useBean>
    
<head>
	<title>Login</title>
</head>

<%
	String nextPage = "";
	String errorMessage = "";
	
	//En caso de hacer el forward al redirecter, esta será la página que este redireccionará.
	String pageToSendRedirect = "";
	
	String attemptsFromView = request.getParameter("attempts");
	
	int attempts = 0;
	
	//Si attemptsFromView no es nulo, es decir, se fallo al loguear y el flujo viene de la lista, hay que actualizar
	//el número de intentos restantes "attempts".
	if(attemptsFromView != null)
	{
		attempts = Integer.parseInt(attemptsFromView);
	}
	
	String userEmail = request.getParameter("email");
	
	//Si el userEmail es nulo viene del index, así que redireccionamos a la vista por primera vez,
	//pasandole el numero inicial de intentos (3)
	if(userEmail == null)
	{
		attempts = 3;
		nextPage = "../../view/user/userLoginView.jsp";
	}
	//Si el email no es nulo intenta leer de la base de datos un contacto con dicho email
	else
	{
		String userPass = request.getParameter("pass");
		
		DAO contactoDAO = new ContactoDAO(application.getInitParameter("dbID"), application.getInitParameter("dbUser"), application.getInitParameter("dbPass"), application.getInitParameter("sqlProp"));
		Contacto c = contactoDAO.Read(userEmail, userPass);
		
		contactoDAO.CloseConnection();
		
		//Si el contacto no es nulo significa que ha habido un match con un usuario de la base de datos
		if(c != null)
		{
			%>
				<jsp:setProperty property="emailUser" value="<%=userEmail%>" name="userBean"/>
				<jsp:setProperty property="name" value="<%=c.getNombre()%>" name="userBean"/>
				<jsp:setProperty property="surNames" value="<%=c.getApellidos()%>" name="userBean"/>
				<jsp:setProperty property="birthDate" value="<%=Converters.convertirFechaAFormatoLocal(c.getFechaNacimiento().toString())%>" name="userBean"/>
				<jsp:setProperty property="interests" value="<%=c.getIntereses().toString()%>" name="userBean"/>
				<jsp:setProperty property="password" value="<%=c.getPass()%>" name="userBean"/>
			<%
			
			nextPage = "../redirecter.jsp";
			pageToSendRedirect = "../../../index.jsp";
		}
		//Si es nulo significa que se ha fallado en el intento de loguear
		else
		{
			//Disminuimos en 1 los intentos restantes
			attempts--;
			
			//Si aún le quedan intentos devuelve a la vista de nuevo
			if(attempts > 0)
			{
				nextPage = "../../view/user/userLoginView.jsp";
				errorMessage = "El usuario o la clave son inv&aacutelidos, intentos restantes: ";
			}
			//Si se ha quedado sin intentos redirecciona a www.uco.es
			else
			{
				nextPage = "../redirecter.jsp";
				pageToSendRedirect = "http://www.uco.es";
			}
		}
	}
	%>
	<jsp:forward page="<%=nextPage%>">
		<jsp:param value="<%=pageToSendRedirect%>" name="url"/>
		<jsp:param value="<%=errorMessage%>" name="message"/>
		<jsp:param value="<%=attempts%>" name="attempts"/>
	</jsp:forward>
