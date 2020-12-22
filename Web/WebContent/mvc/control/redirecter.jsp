<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Redirecter</title>
</head>

<body>
	<%
		String direction = request.getParameter("url");
		response.sendRedirect(direction);
	%>
</body>

</html>