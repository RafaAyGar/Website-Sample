<!DOCTYPE html>
<%@page import="es.uco.pw.vo.Interes"%>
<%@page import="es.uco.pw.business.util.Printer"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Register</title>
	<link rel="stylesheet" type="text/css" href="/P3/css/userLoginStyle.css">
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
	      <input type="text" id="name" name="name" placeholder="ej. Rafa..."><br/>
	      <small></small>
	    </div>
	    
	    <div class="form-control">
	      <label for="surNames">Apellidos: </label>
	      <input type="text" id="surnames" name="surNames" placeholder="ej. Rafa..."><br/>
	      <small></small>
	    </div>
	    
	    <div class="form-control">
	      <label for="birthDate">Fecha de nacimiento: </label>
	      <input type="text" id="birthDate" name="birthDate" placeholder="ej. 29/07/1998"><br/>
	      <small></small>
	    </div>
	    
	    <div class="form-control">
	      <label for="email">Email: </label>
	      <input type="text" id="email" name="email" placeholder="ej. rafa@uco.es"><br/>
	      <small></small>
	    </div>
	      
	    <div class="form-control">
	      <label for="pass">Contrase&ntilde;a: </label>
	      <input type="password" id="pass" name="pass" placeholder="Contrase&ntilde;a"><br/>
	      <small></small>
	    </div>
	      
	    <div class="form-control">
	      
	    	<label for="interests">Intereses: </label>
	    	<br>
	    
	    	<div class="checkbox-container">  
		        <input type="checkbox" value="<%=Interes.Informatica%>" id="informatica" name="interests">
		        <label>Informática</label>
		
		        <input type="checkbox" value="<%=Interes.Deporte%>" id="deporte" name="interests">
		        <label>Deporte</label>
		
		        <input type="checkbox" value="<%=Interes.Videojuegos%>" id="videojuegos" name="interests">
		        <label>Videojuegos</label>
	    	</div>
	
	    	<div class="checkbox-container">  
		        <input type="checkbox" value="<%=Interes.Television%>" id="television" name="interests"> 
		        <label>Televisión</label>
		
		        <input type="checkbox" value="<%=Interes.Musica%>" id="musica" name="interests">
		        <label>Musica</label>
		
		        <input type="checkbox" value="<%=Interes.Baile%>" id="baile" name="interests">
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