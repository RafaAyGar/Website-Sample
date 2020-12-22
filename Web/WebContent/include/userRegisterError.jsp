<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>



<html>
<head>

<title>Register Error</title>

</head>
<body>
	Ha ocurrido un error en el register. <br>
	Mensaje de error: <br>
	<%exception.printStackTrace(); %>
	<%=exception.getMessage() %> <br><br>
	<a href="../../index.jsp">Volver</a>
</body>
</html>

	<!--
	Unless this text is here, if your page is less than 513 bytes, Internet Explorer will display it's "Friendly HTTP Error Message",
	and your custom error will never be displayed.  This text is just used as filler.
	This is a useless buffer to fill the page to 513 bytes to avoid display of Friendly Error Pages in Internet Explorer
	This is a useless buffer to fill the page to 513 bytes to avoid display of Friendly Error Pages in Internet Explorer
	This is a useless buffer to fill the page to 513 bytes to avoid display of Friendly Error Pages in Internet Explorer
	-->
	