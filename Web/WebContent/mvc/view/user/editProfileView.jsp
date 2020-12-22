<!DOCTYPE html>
<%@page import="es.uco.pw.business.util.Converters"%>
<%@page import="es.uco.pw.business.util.Printer"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<jsp:useBean  id="userBean" scope="session" class="es.uco.pw.display.javabean.UserBean"></jsp:useBean>

<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Edit Profile</title>
</head>

<body>
<%
	String nextPage = "";
	String message = request.getParameter("message");

	if(message == null) message = "";
%>

	<form method="post" action="../../control/user/editProfileController.jsp">
	Intereses disponibles (Introduzca el índice entre paréntesis (separado por comas si hubiese varios intereses) en el campo intereses.<br>
	<%=Printer.getInteresesDisponibles()%>
	<table>
	<tr>
		<td align="right"><label for="name">Nombre: </label>
		<td align="left"><input type="text" name="name" value=<%=userBean.getName() %>><br/>
	</tr>
	<tr>
		<td align="right"><label for="surNames">Apellidos: </label>
		<td align="left"><input type="text" name="surNames" value=<%="\"" + userBean.getSurNames() + "\""%>><br/>
	</tr>
	<tr>
		<td align="right"><label for="birthDate">Fecha de nacimiento: </label>
		<td align="left"><input type="text" name="birthDate" value=<%=userBean.getBirthDate()%>><br/>
	</tr>
	<tr>
		<td align="right"><label for="pass">Contrase&ntilde;a: </label>
		<td align="left"><input type="password" name="pass" value=<%=userBean.getPassword()%>><br/>
	</tr>
	<tr>
		<td align="right"><label for="interests">Intereses: </label>
		<td align="left"><input type="text" name="interests" value=<%="\"" + Converters.transformaInteresesAIndexado(userBean.getInterests())+ "\""%>>
	</tr>
	</table>
		<br/>
		<input type="submit" value="Submit">
	</form>

</body>
</html>