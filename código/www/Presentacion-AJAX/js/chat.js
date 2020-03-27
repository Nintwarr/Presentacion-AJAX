var exito = {
	leerMensajes: false,
	enviarMensaje: false
};

function leerMensajes () {
	exito.leerMensajes = false;

	var peticion = new XMLHttpRequest();
	var parametros = 'method=leer_mensajes';
	peticion.open('POST','http://localhost/Presentacion-AJAX/php/ajax/chat.php', true);
	peticion.onload = function() {
	   if (peticion.status == 200) {
		   renderizarMensajes(peticion.responseText);
		   scrollMensajes();
		   exito.leerMensajes = true;
	   } else {
		   // tratar error
		   console.log("Error");
	   }
   };
   peticion.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	peticion.send(parametros);
}

function renderizarMensajes(datos) {
	var mensajes = document.getElementById('caja_mensajes');
	mensajes.innerHTML = datos;
}

function enviarMensaje(mensaje) {
	exito.enviarMensaje = false;

	if ((mensaje.trim()).lenght != 0) {
		var parametros = "method=enviar_mensaje&mensaje=" + mensaje;
		var peticion = new XMLHttpRequest();
		peticion.open('POST','http://localhost/Presentacion-AJAX/php/ajax/chat.php', true);
		peticion.onload = function() {
		   if (peticion.status == 200) {
			   exito.enviarMensaje = true;
			   leerMensajes();
		   } else {
			   // tratar error
			   console.log("Error");
		   }
	   };
	   peticion.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
	   peticion.send(parametros);
	}
}

function scrollMensajes() {
	$('#caja_mensajes').animate({
		scrollTop: $('#caja_mensajes')[0].scrollHeight}, "slow");
}

// """Main"""
////////////////////////////////////////////////////////////////////////////////
leerMensajes();
setInterval(leerMensajes,8000);

var cajaTexto = document.getElementById('caja_texto');
cajaTexto.addEventListener('keydown', function(e) {
	if (e.keyCode == 13 && !(e.shifKey)) {
		enviarMensaje(cajaTexto.value);
		e.preventDefault();
		cajaTexto.value = "";
	}
});

var botonCambiarCuenta = document.getElementById('cambiar_cuenta');
botonCambiarCuenta.addEventListener('click', function() {
	location.href = 'http://localhost/Presentacion-AJAX/index.php';
});
////////////////////////////////////////////////////////////////////////////////
