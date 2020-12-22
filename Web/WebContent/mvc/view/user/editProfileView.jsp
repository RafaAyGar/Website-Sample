<!DOCTYPE html>
<%@page import="es.uco.pw.vo.Interes"%>
<%@page import="es.uco.pw.business.util.Printer"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<jsp:useBean  id="userBean" scope="session" class="es.uco.pw.display.javabean.UserBean"></jsp:useBean>

<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Register</title>
	<link rel="stylesheet" type="text/css" href="/P3/css/style.css">
</head>

<body>

	<%
		String message = request.getParameter("message");
	
		if(message == null) message = "";
	%>
	
	<FONT COLOR="red"><%=message %> </FONT> <br><br/>
	
	<form id="form" class="form" action="">
	
	   <div class="form-box">
	   
	    <div class="form-control">
	      <label for="name">Nombre: </label>
	      <input type="text" id="name" name="name" value=<%=userBean.getName()%>><br/>
	      <small></small>
	    </div>
	    
	    <div class="form-control">
	      <label for="surNames">Apellidos: </label>
	      <input type="text" id="surnames" name="surNames" value=<%=userBean.getSurNames()%>><br/>
	      <small></small>
	    </div>
	    
	    <div class="form-control">
	      <label for="birthDate">Fecha de nacimiento: </label>
	      <input type="text" id="birthDate" name="birthDate" value=<%=userBean.getBirthDate()%>><br/>
	      <small></small>
	    </div>
	      
	    <div class="form-control">
	      <label for="pass">Contrase&ntilde;a: </label>
	      <input type="password" id="pass" name="pass" value=<%=userBean.getPassword()%>><br/>
	      <small></small>
	    </div>
	      
	    <div class="form-control">
	      
	    	<label for="interests">Intereses: </label>
	    	<br>
	    
	    	<div class="checkbox-container">  
		        <input type="checkbox" value="<%=Interes.Informatica%>" id="informatica" name="interests"
		        	<%if(userBean.getInterests().contains("Informatica")) out.print("checked"); %>>
		        <label>Informática</label>
		
		        <input type="checkbox" value="<%=Interes.Deporte%>" id="deporte" name="interests"
		        	<%if(userBean.getInterests().contains("Deporte")) out.print("checked"); %>>
		        <label>Deporte</label>
				
		        <input type="checkbox" value="<%=Interes.Videojuegos%>" id="videojuegos" name="interests" 
		        	<%if(userBean.getInterests().contains("Videojuegos")) out.print("checked"); %>>
		        <label>Videojuegos</label>
	    	</div>
	
	    	<div class="checkbox-container">  
		        <input type="checkbox" value="<%=Interes.Television%>" value="true" id="television" name="interests"
		        	<%if(userBean.getInterests().contains("Television")) out.print("checked"); %>>
		        <label>Televisión</label>
		
		        <input type="checkbox" value="<%=Interes.Musica%>" id="musica" name="interests"
		        	<%if(userBean.getInterests().contains("Musica")) out.print("checked"); %>>
		        <label>Musica</label>
		
		        <input type="checkbox" value="<%=Interes.Baile%>" id="baile" name="interests"
		        	<%if(userBean.getInterests().contains("Baile")) out.print("checked"); %>>
		        <label>Baile</label>
	    	</div>
	    	<br>
	    	<small></small>
		</div>
		<br/>
		
		<button type="submit">Submit</button>
	
		</div>
	</form>
	
	<script src="/P3/js/userRegisterChecker.js"></script>
</body>

</html>