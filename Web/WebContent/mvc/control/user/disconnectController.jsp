<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<jsp:useBean  id="userBean" scope="session" class="es.uco.pw.display.javabean.UserBean"></jsp:useBean>

<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Disconnect</title>
</head>

<body>
<%
	request.getSession().removeAttribute("userBean");
	response.sendRedirect("../../../index.jsp");
%>
</body>

</html>