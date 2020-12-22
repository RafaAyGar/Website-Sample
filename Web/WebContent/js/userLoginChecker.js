
 /**
 * @fileoverview 	Revisa que los campos del login se hayan introducido correctamente
 * @author			Rafael Ayllón Gavilán <rafaaylloningeniero@gmail.com>
 */
const name = document.getElementById('email');
const password = document.getElementById('password');
const form = document.getElementById('form');

/**
 * Se comprueba que los campos del formulario son correctos, es decir:
	- Ninguno de los campos se ha dejado en blanco.
 	- El email satisface al expresión regular "emailCheckRegex".
 	- La contraseña tiene al menos 4 carateres.
 	**Nota - Las condiciones mostradas arriba son indicadas con más profundidad en el informe, dentro de la sección Decisiones de diseño.
 		
 * @return {Boolean}      [True si se satisfacen las condiciones anteriores, false si no]
 */
form.onsubmit = function()
{
	const emailCheckRegex = /\S+@\S+\.\S+/;
	  
	//Comprobamos el email
	if(name.value === '')
	{
		setErrorFor(name, '* Es obligatorio introducir un email');
		return false;
	}
	else if(!emailCheckRegex.test(email.value))
	{
		setErrorFor(name, '* El Email introducido no es v\u00E1lido');
		return false;  
	}
	else
	{
		setSuccessFor(name);  
	}
	  
	//Comprobamos la contraseña
	if(password.value === '')
	{
		setErrorFor(password, '* Es obligatorio introducir una contrase\u00f1a');
	    return false;
	}
	else if(password.value.length < 4)
	{
		setErrorFor(password, '* La contrase\u00f1a debe ser de 4 o m\u00E1s caracteres');
	    return false;
	}
	else
	{
	    setSuccessFor(password);  
	}
	
	return true;
}

/**
 * Cambia el css de un input al correspondiente a cuando se da un fallo y rellena el small del input con un mensaje de error.
 * @param  {input} 		input		El input que contiene el error
 * @param  {string} 	message		El mensaje de error que se quiere imprimir
 * @return {void} 
 */
function setErrorFor(input, message) {
	const formControl = input.parentElement;
	const small = formControl.querySelector('small');
	formControl.className = 'form-control error';
	small.innerText = message;
}
/**
 * Cambia el css de un input al correspondiente a cuando este está rellenado correctamente
 * @param  {input} 		input		El input exitoso
 * @return {void} 
 */
function setSuccessFor(input)
{
	const formControlError = input.parentElement;
	const small = formControlError.querySelector('small');
	formControlError.className = 'form-control error';
	small.innerText = '';
	const formControl = input.parentElement;
	formControl.className = 'form-control success';
}
