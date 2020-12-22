
/**
 * @fileoverview 	Revisa que los campos del register se hayan introducido correctamente
 * @author			Rafael Ayllón Gavilán <rafaaylloningeniero@gmail.com>
 */

//Toma el formulario de la vista del register para añadir lógica a su onsubmit function
const form = document.getElementById('form');

//Toma todos los inputs del register
const name = document.getElementById('name');
const surnames = document.getElementById('surnames');
const birthDate = document.getElementById('birthDate');
const email = document.getElementById('email');
const pass = document.getElementById('pass');

//Toma todas las checkboxes del register
const televisionCB = document.getElementById('television');
const informaticaCB = document.getElementById('informatica');
const deporteCB = document.getElementById('deporte');
const baileCB = document.getElementById('baile');
const musicaCB = document.getElementById('musica');
const videojuegosCB = document.getElementById('videojuegos');

/**
 * Se comprueba que los campos del formulario son correctos, es decir:
	- Ninguno de los inputs obligatorios se ha dejado en blanco.
	- Se ha marcado al menos uno de los intereses.
 	- El email satisface al expresión regular "emailCheckRegex".
 	- La fecha de nacimiento satisface la exresión regular "birthDateCheckRegex".
 	- La contraseña tiene al menos 4 carateres.
 	**Nota - Las condiciones mostradas arriba son indicadas con más profundidad en el informe, dentro de la sección Decisiones de diseño.
 		
 * @return {Boolean}      [True si se satisfacen las condiciones anteriores, false si no]
 */
form.onsubmit = function()
{
	const emailCheckRegex = /\S+@\S+\.\S+/;
	const birthDateCheckRegex = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;

	//Name check
	if(name.value == '')
	{
		setErrorForInput(name, '* El nombre es obligatorio');
		return false;
	}
	else
	{
		setSuccessForInput(name);
	}
	
	//Birth date check
	if(birthDate.value == '')
	{
		setErrorForInput(birthDate, '* La Fecha de Nacimiento es obligatoria');
		return false;
	}
	else if(!birthDateCheckRegex.test(birthDate.value))
	{
		setErrorForInput(birthDate, '* La Fecha debe de seguir el formato dd/mm/yyyy');
		return false;
	}
	else
	{
		setSuccessForInput(birthDate);
	}
	
	//Email check
	if(email.value == '')
	{
		setErrorForInput(email, '* El Email es obligatorio');
		return false;
	}
	else if(!emailCheckRegex.test(email.value))
	{
		setErrorForInput(email, '* El Email introducido no es v\u00E1lido');
		return false;
	}
	else
	{
		setSuccessForInput(email);
	}
	
	//Contraseña check
	if(pass.value == '')
	{
		setErrorForInput(pass, '* La contrase\u00f1a es obligatoria');
		return false;
	}
	else if(pass.value.length < 4)
	{
		setErrorForInput(pass, '* La contrase\u00f1a debe ser de 4 o m\u00E1s caracteres');
		return false;
	}
	else
	{
		setSuccessForInput(pass);
	}
	
	//Intereses Check
	if(!televisionCB.checked & !informaticaCB.checked & !deporteCB.checked & !baileCB.checked & !musicaCB.checked & !videojuegosCB.checked)
	{
		setErrorForCheckbox(baileCB, '* Tienes que seleccionar al menos un inter\u00E9s');
		return false;
	}

	return true;
}

/**
 * Rellena el small del campo intereses del register con un mensaje de error.
 * @param  {input} 		checkbox	Una de las checkbox cualquiera del campo intereses
 * @param  {string} 	message		El mensaje de error que se quiere imprimir
 * @return {void} 
 */
function setErrorForCheckbox(checkbox, message)
{
	const checkboxContainer = checkbox.parentElement;
	const formControl = checkboxContainer.parentElement;
	const small = formControl.querySelector('small');
	small.innerText = message;
}
/**
 * Cambia el css de un input al correspondiente a cuando se da un fallo y rellena el small del input con un mensaje de error.
 * @param  {input} 		input		El input que contiene el error
 * @param  {string} 	message		El mensaje de error que se quiere imprimir
 * @return {void} 
 */
function setErrorForInput(input, message) {
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
function setSuccessForInput(input)
{
	const formControlError = input.parentElement;
	const small = formControlError.querySelector('small');
	formControlError.className = 'form-control error';
	small.innerText = '';
	const formControl = input.parentElement;
	formControl.className = 'form-control success';
}