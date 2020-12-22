<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	    
<jsp:useBean  id="userBean" scope="session" class="es.uco.pw.display.javabean.UserBean"></jsp:useBean>
	 
<!DOCTYPE html>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="/P3/css/userLoginStyle.css">
</head>

<body>
	
	
	<%
		String nextPage = "../control/user/userLoginController.jsp";
		String message = request.getParameter("message");
		String attempts = request.getParameter("attempts");
		
		Boolean messageEmpty = message == null || message.equals("");
		
		if (!messageEmpty) message += attempts;
		
		//Si es nulo devolvemos al controller ya que no tiene sentido estar en la vista, el controller devolverá al index
		if (userBean != null && !userBean.getEmailUser().trim().equals("")) 
		{
			%>
				<jsp:forward page="<%=nextPage%>"></jsp:forward>
			<%
		} 
		//Si el userBean es nulo podemos continuar con el login
		else 
		{
		%>
			<div class="form">
			<%
			if(!messageEmpty)
			{
			%>
				<div class="outside-form-error">
				  <%= message %><br/><br/>
				</div>	
			<%
			} 
			%>
				<div class="form-box">
	   				<form id="form" action="">
						<div class="form-control">
							<label for="email">Email: </label>
							<input type="text" id='email' name="email" placeholder="ej.alguien@uco.es">
							<br>
	       					<small></small>
						</div>		
					        
				        <div class="form-control">
				            <label for="pass">Contrase&ntilde;a: </label>
				            <input type="password" id="password" name="pass">	
				            <br>
				            <small></small>
				        </div>
					       <br>
					       <br>
					    <input type="hidden" name ="attempts" value=<%=attempts %>>
						<button type="submit">Submit</button>
					</form>
			    </div>		
		     </div>
			<%
		}
	%>
	
	<script src="/P3/js/userLoginChecker.js"></script>
	
	</body>
	
	</html>