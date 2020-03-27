function registrarse() {
	var peticion = new XMLHttpRequest();
	var contenidoBoton = $('#texto_login').val();
	console.log(contenidoBoton);
	var parametros = 'usuario=' + contenidoBoton;
	peticion.open('POST', 'http://localhost/Presentacion-AJAX/php/ajax/registro.php', true);
	peticion.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

	peticion.onload = function() {
		if (peticion.status == 200) {
			location.href = 'http://localhost/Presentacion-AJAX/index.php?usuario=' + contenidoBoton;
		} else {
			$('.error-registro').css("display","block");
		}
	};

	peticion.send(parametros);
	$('.cargando').css("display","block");
}
