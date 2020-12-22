<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean  id="userBean" scope="session" class="es.uco.pw.display.javabean.UserBean"></jsp:useBean>
<!DOCTYPE html>

<html>

<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="css/userLoginStyle.css">
	<title>Agenda</title>
</head>

<% 
if(userBean == null || userBean.getEmailUser().trim().equals(""))
{
%>
	<div class="form">
	      <div class="form-box">
	      
	          <form action="/P3/mvc/control/user/userLoginController.jsp">
	                <button type="submit">Acceder</button>
	          </form>
	
	          <br><br>
	
	          <form action="/P3/mvc/control/user/userRegisterController.jsp">
	                <button type="submit">Registrar</button>
	          </form>
	      
	      </div>
	</div>
<%} 
else
{%>
	<body> Bienvenido <jsp:getProperty property="emailUser" name="userBean"/></body>
	<br/>
	<br/>
	<a href="/P3/mvc/control/user/disconnectController.jsp">Desconectar</a>
	<br/>
	<br/>
	<a href="/P3/mvc/control/user/editProfileController.jsp">Editar Perfil</a>
<%}
%>
</html>